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
pkgver=102.9.0
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

sha512sums=('3923212ce4b7d1f589129025961ff1b380b8aaf1dd074674f3bd63cf14e9a44ff051bda556b7796c25634e153de00ce62243ece15a520f63dd0791a19b2a6685'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '596b7388115d8dee354a5d80c96abf7f14fd33d1f592f7ed1d0cee620a6d0573a947212b1d694972efaf58d1cfc0265503b406903eb2a74c73fb8333f2f32922'
            '41c35a08d87d2289916532ecffa598ac8595bea1812b42f51f71c0594c661f6aaa211660fbeafbb57a514bad86983e08da740c58d475dcb2b314af757425daa3'
            '8ff42fe5c664a676cc448655a6bd283e2fbed7dc8a31bff7416da27809d78f9f2216b7384fa37fa517c6f1818e40a33668a72768a3947a1e3af9c840dded1c11'
            '190a2322cdf6889bd86648c441032910eac031670c278b7e95354af6504ef52134aa06be8a46126d6fc4f4699b5fd71b7cf92cba12ccaa5f25963c6ce4bedfce'
            '3577372dbebfa4c7480730c5d78fa223baf636216a0577a201ec8eaa265689bd37ff7677fcdccb9207168ecbd6c54979f3ba2a3dece8276ab36560eb063aa802'
            '439c20942ca5ebbe206533a2a25f904e344cf5fc33156f7c42773b48e7ecdec8518633f857160aad01ee76fdd26aa5aafcabbddd94640d3a5841f6cd041b6e79'
            '1a3fbf17a11422a05f39782be819e4357044e664462a3f6055de93931b7af8fa2826d16eaab4041c4f4192f2cbb38dc396807787d39fe9a74c318c6cc2fa056b'
            'ddd540e3795645c6ec343d8571cef431b9a7096d2e0d396d01dff9389b71dd34aabd9233b183485815ebdd3634159c7fbcc45540650e88397c04f1a675ab06c4'
            '9985e9a221ffa0389b95751f1adefa39f20f98ea94625ab008f618c0619af99f28b81825a33656ee0df4c9e7e9c64e1722f17272384de7e18f6414b09844347d'
            '28f8d111630ff88fa8d8f800be3c297a0acef9126f8fa3a494d391a70ec94432edb574492320bd9088e1c89831b81724eb4afac361cb3263af04a846c4ed0825'
            '4e8ce75992b4f029b8f62936aa3053f01eafd30fdd6f7b5c55a5cdbd918bae487bb7158adef74b63f3eaf942f7038aa28d397ad93d975624facc2788adf0a970'
            '35b6272c33767f57dd2b154b4175b7c638a7cabe591573220e2dc3012af146186b30f7f9ebae0737f9ad984918185397674a9c47cd540158d4a14701906185ca'
            '8c4d5ba48fa63a10e7ac50d9d1b60cc96e6a71e5b1d776ca070fb0ab991fcbe3176c564ddb773b865343ebed4cb59d82ca56d24633e05999d6bcd7c1981a7c45'
            'd6db06d9f6ab3022d0e1890444afc55b9ef3d8a3dee541945c926662f13f87a4b665527ab8222e9b784fccae7cc3a8c4a6db795ce817b526d1841607a6fb2148'
            '8c58f5784d6a65ba641db25b9435e58a56a7c0ab6e0e4816f9cf4d997c28790df0ea7f2e05c283331a4a47b5c916659d6ec7932088ad6dc84403835a68e4c9f8'
            '3956eb92f5ab8e2305e93031835ece7df9ed187d8a5343ff4c6de6decbe86296c85921c325a22ea29159226c131bbd2772d49d366b3d34ae458f45f909d9a1b4'
            '5c62aa273bc54439c7c9e97817791ba90a6ad46a52a5ed5af831a7a009f82394fc298dda8de5ec77f532efb3c2a2ea79247c268e221f878ec189a02e2c94fca9'
            '103c8cb3e1117595a40694bb3380b53e62735fb5792aea4791cf48a442b65cc641de7eec6d6bad459080650284b4b2e2d21ce4aabe2f7a6ce1d9b41a40aa44e2'
            '64ba4cb48d4cb7831cb59f2e430550ba234f51cbda50bfd3e76405fbeb0a6b1537eff30cd545a65510fd520e3b491f6a48a5e5da3e5f4a5e45e88c0786c9421b'
            '65803852032a21ce478ee1df28d3a038d4a64a0227ce502d00808237db876bb6441bf4e1d9d4817a19669a2d49cda6116f331ec42ea0a324a722dd523bf09a59'
            'fd744b9c55b478f436fc07a465e50e616a587ff00107ac513d9198956dfbc5edf1396b89fde44b98c75f88d421842fedd1a53cc6d438458dc4ff788ff3e17db1'
            'e9eca66976af1527faa22c76953df8c729b1a66b12471fe0977a650a5d211488fbe4bf78c9ce1a00bfd4004a729ef0ca973abbe789fdedd8ffb36326d82ac462'
            '9770eceedb6eeb161e002cf0fc798f34ab48ae398ccd61d393f07b752cf9668a79cc9791fe0c95764712b9a788971126737306b44da79010ddd4d72c1004080b'
            '7e3b6d1fa85ef237886d7039795b7306c2f0a8349327e2b59dd82902365322834ce30c420b7e23588d840f4a18c311f730d43bd49c451eece6ced22f4a9b262d'
            'd7a9a47157741684353829fb7272a7043ffa49d88b675b45d0872a4084ce668ee186d0193f71df5ae765646c78f472649c4526d17b1a34d1c294f975b6bc3bee'
            'd4583e6092e6f0b2651f0d9e8c75750b420994bb68c230ec8917b5f7d61bede6ee8c7dafdaed23bf6ebe506798806aa524001ef3854536058004690cfa188f42'
            '6a8c94c311c23bdf1d72bc4e29c323a761babde9bb8355c2a9807c4c93e961bd747fb1c8b4bf09b911c8f1c839486ce0d25ccbd72818aa60524d42c5624231f1'
            'ef727fd22ae14d3f6052cd913b417361576e7d687576aa2e46e6f8c3032785ac81089809951cf9dd60697f412b397d97006df48df694a01d2e22d742925ac928'
            '7d498fedcfaca2615c2542ceb3579891deb4f183bb04eff4fa0e65430a2b06f0899a1cdf64c0172c7664ac5edce271f82581ba315d6bc64ef2dd5f069c2c2b4f'
            '1e8b84d9bb87d251d0e5403776ec80dbea2e7d635fc316e98064416953f6979bfbdc6a32b5db52dce6889907a0f18c8951d5ee9ee103ec2408fa09274aa1453c'
            '2661c2137f7f688895900b4eee6cef267d72fd807932b4d1793293f7070063947012ce6d810549e39ca2783b74bbf427d93f397a764c518f155f4d3b24245a5e'
            'aea03f85777a8fc4cf0d50d2d098a7c03fbf55f549586164fac26e01010bb9f86405ac45f60e89bc9e7946fde2822594a97df546f540b5ba42d8e5ef0f926321'
            '71ff17c439612ec9ba1265715b0e135c6e87fc2870741f6137cffa7e7656d6c4f4d511f047f452b8273d0afdb473e148a77e3ef555652ebf052b1e29cd2d4bbf'
            'ff96bafe88fb6a54e3f5318c7b71559166212019bb37ebfc765536d337456ab1adfee8cc06e03be38b88e6c0e202e90659f99fa68762d3f69b8a29e1cc67c390'
            'fb836e18372e764d81780f6c467062d93978b69fa221410dcc13671e23088b72efc5aefe61ad98544ac9775b2671b3ce6d98dc3b9a7ab8dbfbbab75fd8f30a8b'
            'b4f545fb5c8e89c1995606d1e2d6ca9247e14f12bca3764e60d0b2cd905124e7ed918c3a116919c22b75512cf65399cd51d26e29e06a6f9fe4485d5c05fdf114'
            '057eec3d54e0be02d4ff24606d3a770f3c3bf521b31ccbdac09a6cd3b1cd5489578548d3455bc0ad204b74b19ad9eba91883461bf92effaeb7fa46d7d24228ce'
            '9d5fef9caaded1428b2d96757171041ba6b1866f8c184b0ae31051e861301b330e9af93b4c4df7a3f1b3ed44c4afa7740540b53b332ef121dc2af8a5e91a17fe'
            '8dde76da91c18e4e818a326d8c7ad58e6e6e9dc260a09b13839cfcd8d036603a12d6ba1d3619d5fc49958a4c66e73f3733b7714c3d95428e97cfd386242d3461'
            '69ac5fea9f47bf4ebd6122152c57dc074260ddeb785998e15449a622590452edff3ea41043008f111372505875b31dcb43a6ad7f84992887d69f733376d3edff'
            '65855f60a202bbcc0bc503a06e726eeea0b71b802e7c62d9c71490dff189c07127f13aa4a1757966a89bfd8da30d0976bd0c2fda26b427a2074077b8a2a5cbe4'
            'f05db7bc43cdfd356f5dac4c3afae79998472311e772fd01fac26ee592f8d5346414852221ac9c8f9d37a3d9d0d8ec42a54dc85cf0a71651a08aeb0ab44346b8'
            'cc4b96c5843ad5ef9c8fa6b8f127fdc41754693b73cb871c76f53e9d08f873aa3441bde06df2c347c278ddfab3e968d560fca26adc3eff2bb8054ea75de838e3'
            '76fb12a9e46ce067e41ef55ddb7381b2cd39072cf6e1e36a0afccd06e081679d866a572b1b88e4784a9e6fc4b9ae947e9661bd68adc5e0d5f6a9042c0ef0adfb'
            '5ab093748c8fe313f30f0f7d24391f5508c4f05a8f25a0ba242e7d995c0890d6528a01e064b927951e1aa788349b0a7b77a5f70f08482512882c47a6edb1ad3b'
            '4740233e4905e455cab32e7cc65d0245b6129a3200e915c012720725f963f1796017ca825705834d6fd51cb7e343d7eec417eb6d6afff1a71f1edafdc4a7b3a5'
            '86055a51ef7e1e260866502b1dfaf1fcb2faeead07bd3ce07d38c08dff4b121c105f6d622bfae7da9bde8a8bd3a51635a4a3a7d60aec7c026ad3637861d847d9'
            'd0c3632d2bd58f46c00fd4590606b326d3823716f6afe836f2980ebfa2991cb787cab1355730d7abbfc668805161d44b3e179ce3c63836aa17f19d34a0edf012'
            'e8d8cf6717af604691bca7499ea802cebdd68081df41c684b9f7c7bc22435b63e6a6cab8aab24dd92ea937a494415f28b20c3fc6ebb6ab2d8cb359ebe70911bb'
            'cc87f90df9c900cdd5efe2ef5db7a3e045f45b5a07dba6c83a5e78b28fe7f50498f947fe3f0c07b61d2d08c44584a77b30ce0fed832c1a4a4bad370292d66123'
            '0517d0c1c1b3a76c840cd0eee0832ad23564fe0dbd0f8c630911b628988ace1fa65399a82edf0ba6eed757eec99c12aeec234af72e0777c760aa1323f57a0fbd'
            '40f2df513f754c5439bf1e27b7f4442e4794d769b229bc6891157e0e3503b661e6e1ff256eec8794ac08feb87654beaa7c278fe1dfad48a7ea6ab4a6d2aa3b92'
            '516f3cce8d6fb11c55db8715e1c93eec42c8095bc36584171f63daa1f5e88ee745c1f2d9bb2a964fc1aa87d382520e4123e8301e36bd479d42505e4053cf06e9'
            'f42aa9aa1ad79ae3d1ac18f2ae42c18946d4de8eec072a1efa4dac9949a044a0c5a0c9ab09a69fa28b67d56b822d39b051cf758f7b07c754ca3905ac7a0dbe59'
            '21f0adefaaab51249de8933251d6453ce247a101619aa6e352bd3ad32af997a98361747e773d1744d635efc4ac01f1b4a4959c5d2965983bc539fc29d97d2415'
            '7fb92098df4da37cccf0fe3d144eb2d0ec5fea8084bc55f624fa4284f97343cc38e2e0466bff0e2cd0bb7c2a399f0aade101f228f46012bf0ef707ad42f69b94'
            'f717e54b7c0ba9dfc97e1312f34848859945fd8f72cd3dcb9365a3731baebab17c2dd3232d8543826364eb60f604aa1802e142ba91fe212da6b06c278eb0c45e'
            'c5d8230eef3b73ceeed36a2faf69ea5075ff51a6f0850fd63024b7ee514ec4f57df2b9ffb651e22b9b11b842db6eaf99a9cd8388fcd6266bea0d36130ea43983'
            '61e16e481c7ae2b79036d6539e40705d1bcdb4c5d78310232faee94e02c1832182c9277dc3277a8089097bca75b6b1fb9390eac5ceb3e732b7fee6ae8fefc39c'
            'cd3aeb37469a9c46b086a079e86da92a7248aaa48eb01c2ba9bbbffd3e7e46b7fd93d9bacc1b5e2203283ef8004bb9e66ead3eb87f2ac12110d2e263596c2c36'
            '111f51facd882446509683e6f5e41df49fc2f96e969f77d9cb6770a4b7defe7b0f551d9d4fe60bc3067285b025565a6dc07fd7e06ba5a84dffe0bed7963b11f5'
            '66058001e955da163c81fa57dcdf87245629f2841381173282a6aee2119b45f3c5c0a8b5c6cd1d9dd501fc8acc6b90031d603b91589034167352c1f1ecfd92a6'
            '8a5ef05371f71f09c47944f6cfa9cfaaacd367e328450766ae340f36b233dc20f4503a5213be3ea8889b6aa6d06053270f186cd4ffe9a5b770c0dd96a42c08d2'
            'c897f9510ae14900d81db33f5372e053a12a3a2b24e64310fb271db85f61798f1d9b02031de5fb62a27df11da167b6236e7352dbaa5d437a746db0260cee028d'
            '3e9950525dd40fc81007250a99d2a78a6872b9c3d8c046f55e7a5154f160c7ef7370b10a5cf931ad23183cccdd0920c70f216280e1f75493c000b21f03e45529'
            'dfd159a5a12a06c4b1feb9694d7ef69e78f88d112cbab2aa6d714eb20937178f82de56a48844fe160d56d9dc0f7ffcb64b42ff9f1512c7ba8429e9e8b9c0bfe2'
            '22278f15270efd7702967a79057c17fc422fe99d5043f0cb4239c9068655aa7ca0eff513ddbee5e0e352f1ad9a47d704be53d3bae068dc2b62d1b2ba2b7ae274'
            'ddd6d19eb53ad17120a97311e5185fdbfb46df8d462d474081bebe98e87300d8c6c707ad773ac78b27e06c931afe87b0edeee5435604686d869e0667f07cba1b'
            'ced46f4eb5010340b68f1931206331b042e335189a2835acd68afdcff2844857dc5e8052ec40c149641bf17cd00889d49ff3b37279ea91cb492505f2bf454fbc'
            '919e20b2a6042e7715ed2cfb4a826448001587b7bb08a25cc999f047e22ec0cb3fc9196e0886de2e141c137dff0cfda5a21643606c5e0100396af1b0883deef4'
            '17d192600089eeda8a6b74ca7459112eef495909170542883c6e1ef5ac721003450ce9cc584ba009ca9b453f87888c5d01794e19f7087a8bd5707455d5f7a01e'
            'fa605033ad6acfc387be11d2852ac8042b8afffd25947d16888550a0a3993d9e150d861271885e3590195fc9461670f65e89f75577c94baea7f0379e02c6f1e7'
            '497c921a19d51fc1a391ce4f694aa77c8abdf4182a7ba4753699275462dbc9aa152e0cc5469735e3a9872adfcc40d4c4aa5425d17fded856db8b4df3b33759a7'
            '1e1694fe95fb06da726d1c451a9c587c9bfccf3bbe51b3078e6b17bafe41f37badafd04e1666f5197a0bfab72c6cc57d032a17f54101d48d2833913c90215d22'
            '461de5e6e0d4384e816adaa0b5683152a277e9164746e2f610c9fc37590f8319669ad9615fda50665a0e8424b84d6f9515bf48138df8cab6a6df1d2fa34c1d4f'
            '833964ef9e53daf2b29e0bfea3df02fbe227dd2c99a9f1ca9e3bd78446e6be9ebec8e7cdbf39ee14f5349723e121553c8a4625aa0295a70f425c909e036295d9'
            'ae28fea390c095ef2eece090e1b3e0f3cd303ca50842189e47ea8a2f195ba48742f2ec0d15aea79ccb52e1a23d9228b3cde3e41ddc9ba4cd9b9f84aeab8cae11'
            'a9eae36a22fd649a2445b7082acd8b7838b058b2d5ad4d3ccb239b8591dc6391127ff1f43e380e2d9486b3e3a3a227082a42949c6121a7f4b6e10725f2f23d17'
            '89a3e5ef9b2e397e409474431ab1d5dd39e51286ca1567e008b1133347e1c5451271ebf3a889a6baeba74b0ec99b243989c64c03faafaae7ac41ab70d6b54a3c'
            '4b0a872bef218f2d6a3744b1018cda9f89e608842a88da7bc296c2029b3e17d24d9b4ed9919422c73a611b2b0a17c683cc99fdc905e1dd407dc8e6edc50ec416'
            'e83b5237a4154781bd5ccfd5677b841be0d98136683513513689c31cdecb21b83c3406dd9fa37808aeec25387d51b5be1648fded35771cfdf1115d2df15250cc'
            '816ce29aff61baccfc73ce01a95e32e0369e5ec7d20832f0bfe7fc5348d36bcbb1a2d44222c5ef5e2548ff3090f15972e7728d831951d81f0aa0250e6b25af6d'
            '8bb7edaa9b2d49c7e303096b8e221f496aff87ca057fd8c5dc0e6318a65ac3ef543636ed688db42104c047fb56d14f25debf7e289624c57601fff952dc70c1df'
            '0391e697856c1ca8c6aef74cd2dc5d2043c868345142eab252a2e1dfc478f421662bef8b3148837bd0706e8eb4ba7905a1eb6831a7dd5c7aab0127a73af352d4'
            '6ebf2246f5d619329617ed61709427cb5b4d4dfbd26fb2af39c7d13e514352b8b3845a676d98fb8087afebe0830bb8541649554e7879173a90762dec2890306d'
            'aea8b389f57a0b4baf69f58799d5ba6cf9234db9c4aa7d10eca45252de7b6504872985b8c7d19f398315f11b506249a64603a9573638ad96b3e45e4a5ab93ac6'
            'f2786cbf25c7fbcad114d48913abf44e9393c7848806fcefbaa3a06f78ee87ba901c847e722526d627d5ed73c28c76b6a10adf970afbd9e7781a43ca9a2a992a'
            '806cf4e615b7d33443ee22fcdde546d60426989977be0eb2804c80fc291adf47886162d049c300d816ac8ce74d53e9fc28f0ca6da19c33ab0e4ac69fb2e7b990'
            '7d616c3a8325987851d5c28f26ffa13c7030c40c9051320ee22f2b0d5aab88e3859ed5ede8aa1d1da98e60db2c8375330338fcb2063579a3e07725e6e837add2'
            '7bed085f625b413c34bd8a9ad522fbf28e56590f2b0e71981884594a1626b6d864d2b975fbae6f50f6f5fb7a6d64865cb9010fc7d3b4aaba8f045513f294110a'
            'a4016cba323ace45e7dfe51e301cd6203889349e7a65bb1ffc7c1845674f2331f1b6f25dc9f47ed2ff19175d962a31d0bfcadc54389cbac764f27dd77e331d33'
            '285ec35782ea1a42e093717945e73cd3f9711a70b1dd2ceb19bdf0ded03e90825cb63abe8c42780c1e8ba5c74e6ef911d59b25ddfd5a3a96b64379fc8475fd7a'
            'db995016e69b1116a155184ec7f3b1f74248f27d6c366387c2593b814dc8cbe1ccac238afff4d2334308900fa6fed414dfadf56d2ef05422327c6b7a870a14e2'
            'aeefc8215d10221eb5863211ac48577b5db0ab37e5104fbb33181b9cea957ec6505e51c44b19cc3c786071b2093a5de888d64ba13ef9809d6f63d14fda9a4e1c'
            'f9e617236f9bb90718079fbd6a1a24accc8ab355fe98cc2fdd39a644d836fa5a76ee84f2c831441b9f8b91859c1be1315533410af12f7c51929f1776dccbba27'
            'e0ece0d2cbe81ad0d2ca65dd9931fd5ebb6e798b3eac63945f889a44fe7549fc913c9a1e2afb4f92855222132be7cf6e24d760d62872f144835ab0bdb506bb02')


# vim:set sw=2 et:
