# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgbase=firefox-esr
pkgname=(firefox-esr)
pkgver=115.1.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm jack nodejs cbindgen nasm
             python lld dump_syms
             wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
options=(!emptydirs !makeflags !strip !lto !debug)
source=(https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
        $pkgname.desktop identity-icons-brand.svg)
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  echo "${noextract[@]}"

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$pkgname
export MOZ_APP_PROFILE="mozilla/firefox-esr"

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-$pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  export MOZ_BUILD_DATE=$(head -1 sourcestamp.txt)
  export RUSTFLAGS="-C debuginfo=1"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package_firefox-esr() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox ESR for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dvm644 ../identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/firefox-esr "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/firefox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
  if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
    make -C obj uploadsymbols
  else
    cp -fvt "$startdir" obj/dist/*crashreporter-symbols-full.tar.zst
  fi
}

_package_i18n() {
  pkgdesc="$2 language pack for Firefox ESR"
  depends=("firefox-esr>=$pkgver")
  install -Dm644 firefox-esr-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox-esr/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)
_url=https://archive.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-esr-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-esr-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package_i18n $_lang
  }"
done

# Don't extract languages
noextract=()
for _src in "${source[@]%%::*}"; do
    case "$_src" in
      *.xpi) noextract+=("$_src") ;;
    esac
done

sha512sums=('b2abb706fef2f1aa9451e7ac7c2affa0cc92cf2b0c6629f106a94c62017476380c7b6f406861fa468f60ea898d8402f534ad74844eb3932741fbd981cec66592'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'd957b39927cc889461a87b859005682070e6e5e6a7047b011b7c341e24ff531168acec4dc26a5e49002d62fdadda78f53db81355f4c0e759ea1a17964c57706d'
            '46d531289436d823b67cb3cfb5e60702b56edb15a68dcb7877731fe3d1cfd2bd8ffcc5149831c8319d22db8221bbb34e1fabe0c5ed96e809cdb73a2644f9aa24'
            '47c0c7621ebbaa601a0858b6ccbe1eacb6e321ca43122d3caef69a2d73f891d4adbe776c9b34b6e95ecb17e53ab6be1974448ad649f665d24c768f51741ee0c2'
            'a576af0ada09e829f4ba0884498bc68cc9bad105ab4bfd1f29163c6c05f883310bf5172ecc4e22ee127d007dd53b27adc05a5c70f386d95190e02c792943297a'
            '35053f787b49757ccc4abbc3db923c71981f8a2e2ba7033f55b3ad54431b160fca669b6462ac7323696ed460697a6210cb1a4a028f0b1da24abca8c9853c21a7'
            'bd91f4c271ca5fa07d080115edd29f7bc14f562579be1def80f3fba70b6a944a9d5f42e4103564191b8ca12cebe64aaa89965955dc2d6e25774cd137c1e5fc99'
            '3978515f162185dc5a304f6b3cf0c870b93b44e7f958bb5606dba972dfaffc921d508bec8cfe109f54424fd15668db922542a5340196e05f8089c2120afb2ebf'
            'e78a47a0b4ca3faad81e8fc2c21e17e82514833f07360e5d0b483c0241502ce03ba0483e369f11e0a5e05cc78edccd9e106a7f08e750d4ac9142ad00fb7e030f'
            '6923a62dae7caa79a3b02ba63fc9a038ca01f270882f65da08aabb1706a406a8ad74d0140dd7dcbd3d6009d8ef2b275f8510d888c2590e8a48c1f3f849bc6219'
            'de9cb0244592756a728824d9bc23ca8c9e13cc0b34848cad4ee589c0f68bdf787d3d56e3deb411891c664b4eb2f3c31e2e391a4360919ac6cfdc19a8162fca7d'
            '403da0ba5d7a2c6003117eb3432cd3eb282c1e99a45f9d6154668cdad1cb791c297266c9b446d16ca30b5569d328a1e54feffb71b6049638c640ce9cf9987b81'
            'af5e87974b649544028f34487e96f1eec79247b79372e8c7afaf6c71a0f5df996389f2953d12dca5ca6f8b5316516377ea232ecc286106ef31487ab8f16f7506'
            'a429e3a8edb5dca07a37746775078faada6c54ae8f42744d673e35dc4420185502f1f8fc2d10b638de217d8529794e7afb6e6181df414a7819dbc24a782d23c1'
            '916700859c294663a8d53b80cc84d8ae3732268a0d41d992eb06cf91fcd497cae5f9358af4365124459407c2885c10e2810a9c73ac74f4760be29fc7a1acce97'
            '3c8f154568a40c49a5f83cd5bec8720373cb506d2121f467c272e82d05969439ec8a7c51f1ba32275a6448a6a45e8048de7d543556185d65bee00ebd8e5a34d0'
            'e15799fd2a78da1867e023670c279307534334159f31ddc55131060db7f6b8c6317920b6161c93292d55710faada5c86692af02515f682e6f7f58b72a97e619b'
            '42b77fa346df50fef41325ded30ebacf7e9a42cdaa4e230d5cce8175c1c3af442e22d57ccda16a06a9305087f3ed2a863eadbada8f7561592ede763381115f37'
            'b9fe7bffe0962fbd73c06cb73f18721e7269186d8e4e66305dc4eac51e7d467e2801f789171f0d855a6e9e92851c8d628cf961f7f83db5b04e9270542d37a337'
            'bd19b38c07cafce2856a4caa774dbbe3c49ac759a9ce7fd9be354b5d7293e7d0607290ea541029189083bb74ff59c4746bd53cc737f782651c4ad2c6600d5562'
            '5230b4f0c54a11a6c310ec698e24d62b3f27714a03a13c3f85d0c868bb3902bb9cf4ad54153fe3014371df536bd1babd1e410222db93fa216fa7793cfcd744d2'
            '41af7061fbd60fab20a5e4e14be9b5427be6f9089fcb71359e441dcc07e401a16e67f86915a2fcb89d26ac36984ebceb5cb8f14326e1604f8d2ac192c09b3fad'
            'f48ddf13692a219bfdff6184e756f25c31ad0a1082e4c7c8211bb4b7c581f9684ecd9a3401f6d083e8bdc5bec51f5edd1de8b804e11ef054b6abf314d3201050'
            'c6583bff2d684585d307f74c8d282c5dd52d67c1004a3328556f738e6fa57550a92463e11b851ca49f94fdcd249139fc45f33b1a712591d9d66a9b708a3393a2'
            '46937f3a75cf37abe2bf1f32acc811332a6fde9819b7a409401302ed9b7971b094fbcd6b5d54f282c2ca5d5e97690b8a38e4a2a3635147f8e1622dd970174f12'
            '0c70239a51d0530624b5b27e563761fee04d547890112e82a174248ba1e2b5e83d92d564dfb80388388dfa98d675fcc727d415e9e3168c1cde472f439a29e4ee'
            '84fb266283f9d11f19b36036997fb5b3215e56d31022bf7c5caae1e9f16eb07cd531e5d65b812b6f331f821c347603ec0d976f7590c6025ab9d79e670cb36ae7'
            '1147fe42d9768db621e497f0242a53179995e28db21c49a4b8b9b1572ce08278dbbe0cded6f5e029418225b764e306612d6751a84f839fd3de1a0c7f7c0b6016'
            '4b2df486342c329ff49296398151c6b33632444044ddd8fcc3b15c3ddd95e67c792761d8b15bd89e5b51bdb9f0038bae55e7e317c3f2a7d3adc7205e7d4a76c3'
            'eaede75ce8c8dda3d89b049f9c7625d6b20fa935b630cb7d7260fd95535ca6f0f6534e1c5fe8e113813030a160cbfaeeff3adfc8ed0462f86b73c2a4b605a454'
            '9959520a2314dbe25feabb1c7d8920be468efe1c3d16cb5e13b7aae5da4cba470a00c61f59a646f34cce67fb008169f6e15bcfb5a70faca7b4413cc7d5c6169e'
            '6c7440f5aa36d1e4cc44c22cafe83a1ce278bf7ecefdc157e98c7737079aa3319504da25eb15ee70f79d2b8ede3c0ccd83c3839312936e8e1b0fb846efdf0fa3'
            '7a1f418b18b53d4bf98729f9347f25526c63783b99fab6731d11aaf6836e43d9488a508d0985384c917669723e22300ae43817f746e2dfa3e918f4696e65dae9'
            '9424fdc0f7398db920a436723ffcf67de70df32ddb9b96f9ac3422f5c6603ade409a4f70426a97378cafc36fef826db363b3630789c6fba458077a46d8286e8f'
            '255d3a9f689224dcc94b3268d7284898d774dfe69bce44fdc32cdfba70ffcc44728b873c1ea3558e994e9f79acd9de7b956a6e74cf5df883d5e20034ad504323'
            '677aeedc40a4ca0e2dabb0e6237807734a8525044289a67cab6c075eb9e9586497ae438cb8ce0884cadad3367fd256d289c4c78be0317a1ffa91472370ea3484'
            'b00b4d2f52e8639e30c443cbdd779df34821447978895918ee448f3c5517bb997fffb96269bfd01df7ff25d7b8e913ab15e795668659f3e73eb0b5c9a8654159'
            '32422c21914821ede82845a0902ab0c6b4f60f41fea9c98285c961b519ee6a00747d63ad81b8a369fdff2f4315dc02bc2e898267e6f883a096d390951ec85dbe'
            'e59829cdf189778e754ebd774ab0513fdee65daf50ae760e4aa107598aed36c44e98cdaa2c1e0023a13c56c4118012a1390762ca82a6fdb8a151560365257775'
            '1c988af15071f599e7e42b2438045a041ea6a3dcfe5894c02f4129d79017c3b68fbe1d5d2f8976612a284cc145b8f6c84e5b82b8c749f7c1287024c2a5c904da'
            'cfe1f4e693780d99a101204d05e7276615ffd9b604f1b361196e5d961072c7313b2735500c6df843bd465d702b60f6c5ad3e5b781ff7b34ad4d95f22c3326eef'
            'd93aee11f8cfae38488800bad95b7e556d4bbc007e9f0826ced9f72639e43895316abaf99420725e9574b5e022b33d54414822a3807f20db30efd421b0472fc1'
            'c13e12b5d44ea492b278ba66dd680a43996c2036db99ffac2f345e8b7708ebabeb9d11329d9be383e9f82ab460f6a60683214b955530acb174c8d00b53169e9c'
            '6b5ed5a979d243d28d91877edebf2fcd745705af499f6a58d70889fb0ebcb1ef81e46d7085f04fa73179ab27d140419ff5d1ecbb2c650737bf118fb06c0b3992'
            '9bcef14afbc5c8c23d605334ed5406133eb165631d629451e117c318c29e44a82c5c57b5522bbcc5fd601d7190b048789a4e8980b9c8f1121bcb184d0dc86a90'
            'b9d4118049cfa373e9696630cc8f0c24f66fd7a1755fe51bfe6211160326b8828b60e6559dbb454d7e4303bbe4f5c58c1d44023c0115afab724b8fa462fb3644'
            '30ef7acf22a9720a890d17923ba562fad9d4c83c480b81385665014a10a496cd4227923a140912828aa129f21d4ab7607a0ea8ba5183c644db9332a5d22aa08d'
            '1fc0a974702bbf81e39f851a16fc56035fc7eff8597bf5335ddb0f6c466981d79e0de4325333740b742dab67f847fbfe9753bffa63a4cb849d37cee1dca708d6'
            'a5e9ea9f73a7ed25c20c9320666728538b7a347c969963f059478f274d15a488088db029b0e369b0c5c144ffd999d60d27ccced1bc1a748d347355cb81748acd'
            'fbf293cf16c6b4920144091d2ba0879753f8746eac41d57e5ee3d9edc18d2a96eed8cb7166f06471aa98a154359c6cace3364d3bf30934d5ff916975a718ec37'
            '0cfecabbcc5d384b5266e4aa7a87e2faa849309d453431636f5332a5eec7d05357e82f385ba5c9a5d19cb1870112551a9751a99706a5b527bd5c4e4974faeaf9'
            '09bbebd5971993c239e26db2ea9d8439ab2e6b646fb11362b997e5a8a849c58e68a1302d888724c3799b43f24a0a9e9bdfe5600072d3a3db34c383ba52fbf531'
            'f762f4d34772554250e0e29b8b502f70d44e2c5b9980623b815802731342c76d4fa7d335319a6d7674d0c6f6409ec76aa6a6e7dc285e723699e5e7bf578a316a'
            '738c8a058388dd52ddbc364e49ebef5393c316a8784e5f7cf2a20d93cb81d3c73cf13cda926d0fbd75202813874c98802e16f86f4ff32ab361fb0da9222db949'
            'b914623adfa19ad91b1c2a6804052f558a27dab0f4205a3db098d185599fb4b0fa01ef3ebaac399263a67570814caad0a8d8795d44ece60dcf77b9bcd5ef2516'
            '99312ab0fea9c9019a8f1e964b2a72fd9a79cc80db338d2bc1623ed5639a977f11b2750d562bf87550fcacbde3a3ee7cda25ef132bb1a1399387ff4c56e5d4ea'
            '42d21b2b7e0cfe4a78cf981f92a4a28ae3c063acff1dbdf81682372ed2bbe976afa441b35a58ebd2a50462663a82739539742aa7f3af0fdac486ec980dd869e9'
            '81f24dc8c510b852aaa75f2f99c1d18d27cbe4061603b0ec8a1a3a865cedf061e50fd49d8f413b405e92e7980475ab57531001df093effc6e0af37664d7c843d'
            'd893b8ad6a10788bd05011b31cd82a64dc7102f4cd1a488fbcdd897d26e1984e4cf5ba210b32cfd45e1ad604a0666bbbba05e8c02b2f18f8acda27fb713c6767'
            'd31e2ebf9b2d3a2ac5849f3a8d19e742517a091b2862663b00145b07b226e50dff25b62a32e73ed34aff9af1aac220bf257ca07bfd4e91f7b9f36bff93e6c17a'
            '9d2937066e6b9347a6af0c382a9e7f5c1fa7fc510efca24e6b1cab40ac13a5d825e53ca634a7cc59b88f0ecf155bf7cb5d5cd50dad32b01072575e4f0639fc52'
            'e52a7290cb61d1f1cc31dc77d83c0b4a82908dac8a9980e91ca05d7496aa09030a1571f538c9cdf4de24a146367e06dfc79859768b1bd2841bf79c918f0cfd07'
            'b2ed51a7fb97a12465595951f8c1f5502bc495232d1383a433714b8ccd9d43699cdf48580fa93a9cc3f4e6031c95f155c861166045d80720104218585f8bc9ed'
            'b59ac2abbaec3c81c5fe0e7ab185e5de5ce469f23310cbd62ce617cff6237f9e9a6a7f020272a5fea35361702b99a5732b6763f200565617f8be2eb899cec4ea'
            'e0a9c63b425f0d1e49e66fcefe095b2b06c05d02968db9b709b3a00340b0f3a43a5d4e34ad134cc315b32adf4c75e7d8c3205ad4eef5403e88d653491655515d'
            'c58820e8cda0030520cda08f7c3df14254e723e26e7ae727cbbbccadaacb77e8a3f1d1a499ac8dcb6effcdf00eb8ee87bb26447b60f38fb346c1301ce2d9c8c8'
            'b6b1acd637ee015ce35fcf9423caff07d2f5a6bc7fe0309b3b5fe55e4d81ada37ebd9849949f5e3aca7edfd22db8bf6273c6f038b17f84f28e2d99654585dda4'
            'c6a4e4c049ac905f4707623514f8ce93dd5ce56c6982e1af711a52da2608a5f58360759f668e5b5638a83a40575111d611a2be093b771203d293d8db9d739eae'
            'b10fd7e60f0b7bbe8022798858a1ce93effff1749ecf7b41689ed88ecb1b6ceef27f4429df920eb07cb7c00219e4fefce4db55835654fef7d84f0443621b9b91'
            '113501995773883fdbbc043f3cc894d39b575f6ebd8d8ef308a3a7de01f210da958da0a91f52e7503ebccd52751d381d2f5cc2d55bfd8a040a1814d8ea55ac83'
            '9e9be0fcb52409ceebc2b34c7f6a3b1280597721bb347b3473adc37033fe7635c671deaf25c75090fccdd91a0f57d20d116ecda7e4b03e273e39544762ab7afb'
            '721aca0edeb59a919e1ff26f599ab37d71885d71c6217370bf864093c6709d275ab1a49d2080d0d721c5b2c4fe46ab0a71833e9a445c07c434b9d2cc8c0e4c3b'
            'cb4774e3d928e678eaa2a114762ccb5b6bfb2e724445d79e70d31881d6c55863cfb28116c5ea31801972aa40b5cc443bdadb3e93467c8eb4e029099e9cd1cffe'
            '0ca42093302600b262d946521267cd6b085718a8b4fa48590b7f6efc86bf4d06106a768055b82de4038e66a44ebe65408d80d18625764e0fb34bc5c20798697c'
            'd0b522d23c1806b5b1aa21aa50662a176b24ebeafa857bcb16b0e7480b21dbceb1cb5a21f8f493b86c6ad2124702e67d362932e2b4391754de00803eaa74d527'
            'b0711e7f4e472bfcd8c96929c935cd0695fcbbd16cc9884a1d7e6a8db2361a2c83253909af5008067a12ffc9f7952128fb71b1e5175a3a832d172d66ba7ba069'
            '58032b032f69663e2f870a577eeee65c161459919407a54a6e14f1c35598e088c3d44c743dd7db20366176b000885a5c05ee8baf5cf2fe5da9f031c99fa66a04'
            '341c8c4845ddf70aeefc28db5cf52f67737a9b4fb4a91b0ccbfb4bb1c7e99aa86a27cd5f61f21e35c55fa530bb92e1fc08dc97c6a6dd5eda25adc43f13e7bbb4'
            'f8c1a22aae172c5beb5bcfd687ad0b9bd68dc421c25f8d01dd9a376b3ae38d62aeb97260cb55c3c7d1de68b122f37e40acca3464b5201f6b3de27e12b21ad1ba'
            '664d423664cb525f844ff6386f9c69f4080426bdc9f0d6f10e66cc0ef9c6f9c733ca6f6d178aea4d034c4bdddc52d55d2492fd5a4f2b549fa71ece095e0ec8ea'
            '10ae95e94160fdf00030395be76504866a1161953237e56e6e8ebe929c0f7ffce2595b98be2b39e31127250fab080273a352e80bcaf4725eb8b5131ff2347542'
            '247f1b46790104186edfe7b2defbc6eed3b8cf94f470e8f80fa8d81433a955f3ef218c05c6419f4a7df6665fb2b96c49cff38649aef9c28de89c72eda9575b3d'
            'c7ecdff46e76a3f4aa036fad58509a70c3a571455e9ecbcbd69cdc38c206c32887938a581132d28e9a7a90a2c557555103fddee3415b888a32566c9c26145ab8'
            'bf68191625f205f58335f4e0e2128c5f9fac0743f666a31a39312c116cd1a95e2e224658805322cda89ddc46aac4f5806894c363c6ab1a10a1533cb5d8cc36ee'
            '7268c48bfc1ba108686ac839c3915cfdc7601db5dc695808640ecc4f57e1bb58fbe77e02caa635d130fd624c7bf344aa6fb82e0998e70d42907ffe61547cedd9'
            '446e2f17d6891870d9a0082f752b48944e3e34d5f08722941775757bcaf8ff725634fe3a19ed99d57581bba3b93b2c355f8b4d82085a9b48a642d085e039eba8'
            '11d46504708a7d814913f76afd76aa1796535e97068faf7bdc97c78a12e8c9e678ac4a75b560ec94a5f61df725da784f08b6f7c8204fc13d38ed08277e42006c'
            '5587873cff65a86063dce60e48e2c788f1fe86ab7068ac6246a9fcf168d1a5a1901bf4fdc307ec2f62216470fbc859dd6c7f5a3fe4c2fd011b90275834d730d7'
            'd24a005c17c80eeec17a8c8be7f58ed99b9a372ebed8488181df90a14c12e54a3978c4fa17269295111c4d37f1da247e7979336dcdb414fa65f18e361fc2a30c'
            '4ffa86bdb5bd96dd6b954dabb8cd8b0492cf8ad5874cb4c47603531b6097bd21df607475d46d98e793f4a113a44fde2f2adfea03dfd414a50dab963cdfc1b54f'
            '1b08e84702de4d4ceb91a371853bc9232016626ac5b3e4c77f9441818de16ca2d933e47acff78dfd59401bb14a3578ba6878c8eb600b368151a176071bd38b71'
            '037e4fb98e118ba4c1f15285c5bb1e59e7261850b74c121b18fb751da1fd22fa73a854ece1ecf50340b84e9d4eb5e9a0f20dd47dc5525f96fd6deae094fbe1ce'
            '135f39238105c17f2a8ea6cf2747459bbb47d052cdfbc2a2df93fa1525305d184a84a3622bf40759b7ad79064b8cb25619197fa8c9fa6e1ff5e2320d957b6b04'
            '7fd90a80e0204a544ecf1f71c18b0491cd991c3412eb701e2f32cf9b95380e265f238232d466ce9bf63b06ce7860693f080ec9a646c0a73a70e2d9cc5281826b'
            'd89ed1174c0e50e9d03c76e3114a05f0c16e5f668f5c9d0520078b1c4cfbb0090dc925d7d2b4c1a9a10c23a5c598c4972baa6389cefbf243c1216edc7faab663'
            '6bf3d518e98df5380eb38852f495740630e969f77c9196be84bb804f361a3e0ac88f325d195e0c8fe20733bce9ef54c9852f3ffd432b7c6dbbff3af7f5e38fa9'
            '8e9c3ad02d885c080ade555db078ad9c714fe5da6cb44320cc12ec508e5e1060da7e2990de4f3bcd3782f77c83d965c4664af8b228b3d9222cad8563a85f3f75')


# vim:set sw=2 et:
