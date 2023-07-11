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
pkgver=115.0.2
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

sha512sums=('f145d0e0e63032367af4198d4ca046589689b5852cb2451efbdcabeae37dfeda88dd0a2c317120ae5785228a6d7df21aa2d18c18ed7bf4b180823af37326a458'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '42980a51bff3dfcf8b2a2be88093d9eb3c0d53785a604ad3402b8f624eed40cab2d087e31fa811475fe5490f23c9bcdcaca3c34295b8edbe89b7f94e556f9f2a'
            '5997c373dbe95b9293d446e901d3b2487d3f922964f875e82a43c5da13de0d18dc109a99941ca41d60476bbdfd086fcab8b5796b9ed028d8b92562aacbf0404b'
            '76d953c377504be36b5eeebfcdce98e9ebb814e0167eae4ec369222a5baacbb3210863e1a6c24b4a45795bc145bc715ee575131d2b488eab22fa16641b324246'
            'bd512fdce442d5e552ae07e67ad0755f480c08d57de73378dd36d85405380eeedac8288758e41c36f556c86572047e1a66b0b7cde8cde29887bfb05e52ade989'
            '88dd57dbf92c8aa98037eaa3648a8cb6fde91e80956d27ad05e613eb3ed3a4d1baf15c783654ac282910b3b1a523c2c23bf0eb44664c45997abbbe86ab3dafcf'
            'f6c680ed946d61687a5dabcde971c35fbf264d0f8a6b44d0a3ecb99cdfe11cab645e7ce48bc079ba8076b4e08402bef9d022a69a0db092503295c3f65fd871e6'
            'bcc7bf3f7eaa79ad497cbd442fc6d6f24c387f100f92d0a51179cabd9636359e4b3d048b7e656ab8ca8e64744457556f71925d54f9e418060e43131a72a692eb'
            '9c5f3e7bfd6ab8a2a0a93bb58f4de6fe15333c60cec55941c03927798d94844cb74cc92dbee60fc67f17cd7cbe8e60ede2686df9a12afcf8b54351b6d5d92c50'
            '70d9d28e09a9828bd16aa56230d03340ec65970b1fba2027ef31a755b68fcd8498200968ec4ed8898e76283f3a25bff9c1bed91a1d638388cf1ee81f4f08fc1e'
            'ea7ddea2d1ba463b826018abd8c2bfdc227738a734b74e31dbe3f7943a03e0bf73adc75d5f0d4684dfa7498ba40cb0a8363de6afa335dc22ad962b36068a3195'
            'aeffe91b69135b655411af4756b49652129321706fab891da842f6792eda49a48e0a504ca135aef5ee43ad26234f2da20541ff020b3f29991bbbcfc7b9dbb631'
            'dee8da103b634e36ef53c1c93e15e6e1b2c45d860df0f6181ccb7824cef4490f79decf214292167226c64d8a941b3435474cc5952f6753404dd198797e7991b2'
            '8dab48bdd576e531ad95352ee65da4251e453eeb1cec28cd28bccd125d7b6c32e31b3fda24855db16aebf85081b6172f452119ddaa5c518ec0ea5851724da80f'
            '7d9b469d40831aa8537de81fd4e385f7ea3061dc69c987d2ba4bf0043798f1548540c85002f1649a461aea2b81bcb7f800c1c8f7ce41ca0d889bcf9a78645c16'
            '329149db66b6f6a1e91da7c60dd57d6f6400811ca41b627d0cff84eebc821bc6d3454cadef827a853a838510b92e60d778c78c335163673188326a3cc22c312b'
            '4676011205a0b8cc1be7f67c586331c36fff47b94093a5d54826463a7d236dc48be6e0105e5b355318da01e3ce1f565ad2043a5cd85d6cf84450f37a53b10a2e'
            '70984ff6ca99d2d366c56fda8e242c3001a9a79386a6897fa2dc6544b5d8855074ccef0fb1595d78e904b38ae35a55c7798e8ed276c8daf92e37c9d1dbcc1408'
            'f02ef0680728c48471cf81721ed29aa2b300a1234ed49f287ec773eb2aaca5538863869e3b09612cef594c1e0cef80cd291277864d315cdf4785da9f10fba898'
            '6ebe5186a60f1d763b4067b000566a01b813f68657100117fa6ae1953835e79aa77c3ef72ec030048221a7fff24a0d7cbba368061bdfc10a1850ddaeb330c163'
            '6e2a3b2ac2bbe67cc8c2277ae4e5b5d54b6be60f57e6cfda9bd4bf5bbcc7d5ffd67a860901cfae938bd5bb7531b04897f1125af42027bcb2fc56751f2df8b2d3'
            '97437eab286ad570e99142ad81c104f43918a139a2766aa5a7eb2f48e6dc5169b8ce82c2992d9a6612c090d02de859a3d31d26a4bec867bea0bbd37e07a58d73'
            '371b2ed72507fb293b1f36b5c1a6c1eba73f3a6fdad28b87f0df6fe5147487920aba4bc51b7b0f80b17e4bfcda644902649a90c53e38b7968cae117df9679929'
            'b576227967c3c2fd8b24d3c5bf167ffabbc99e5550e751439180896fae49ab442fde1a944c69a082fd8f1f1753e9efa9c1794b5a313d763cde7166e11db67b21'
            '77c9f81f44ef1822ac23568b5f477883a11be0cdaca3f8d82c00b74cfdf05d1a4272a49291c65069f3cc0589157a1cde1b3fbbbb2eff69b0e86e881d53eea13e'
            '725337e8dccf52474b663d797c3477238b5608c509ad266516d3f206cd61e643d41146680c9a9c925917993af651d3d43ccaf6b8389d1c10f6719f3d0eb90042'
            '30cd6c7c8d028ab10b56f934f57ce73eb50ff46ac32f63b0dbf801ef02d12b2f2ae09f5c0ecd6a1e4b4de5cf36b6a84a62bc83c25345c58d096d203209f6fda6'
            '8493c3bb5542eb87bf7ee21edba4435f0f9907856f913b061dc50d992816b1d01ea68da6987e2567d8ed9817da9617201e68895464c5f692f1c72d83affea4f0'
            '811b0df3b8ff3add165f91bf2733517a1ff16a5207ff620c9af8de5934de930ce489d0b4d871eea5541e633a868932dd16a1f18655a5f24fe3fbb313eeee7633'
            'cdd12f01a2b54322b60551f6f8fb0569c189e3f05580cb23213d9fb4c536ea1162c8e0ada41bdc33cb664c58c1b9d9d6f32700dee4f3aaad4c92661114cec34c'
            '55e69a7ed3d8b37b1875c530d50233d5a4f4714e35ab745a43fc32ba67eee5de439ebc8aa7037d62e0b5d9cc88e9beba07ead418c3e2110bb6f67418f8afbc7a'
            'd6dab1ac19206f23920dbb3a31a15d4ad4eee4d91e504fa2c91471b7e8106fc7e03f1fae5a6a43197fd348bd43ec629ae55e044b15635934e496135f85e42485'
            '5a17ff7c9eaa7ecf74700e19457a93f804d6f88a758db23ee22cd1def8e150ed9517104165785f16dc2e47b2ebfb8d5927cafa52f56e653f8918852c9add7566'
            '5f75d0296f4a09e334f0877596e2a202493f8a8301ddd60e1be74c9ecef58a5842cdcfc9ea90abadcf2842cd56e068bf0ed4233fcad28dfeabd09136b57e6aa6'
            '10ebf5642767914556870d88e7e350a017e8f516ea042ae4ad86ec0e9d37c0142e46b9b3fba7f7367831b917171ba56606799cac7b7ace83fdc81c7012bfdca5'
            'e4b4c61365e91d549294f334bf12cdb2c68114d5ff0c7ccb3ed6d1237fc949f94d9a426aa153f5c86461088ae191b7c44b5d1e0d54b1e58791dcb0315cc437c7'
            'dd555d54261e3bb8b882a002cda51da8e0d310d562631f6835d94c73e69ee050c0b71473965fd7665da33831f99fcc3f41f05bb7e043bb2bb117a508f98bcb0b'
            'b85309932cff719507105ddc4301a625bee315e9c3ed5b3eef869dcf873995e75ca69f805cf78fce4dfb7a61d5f90ba704a9065824e3bc038189254e02c874f2'
            'f74a8ef0525eff0c35423ac6b0795ed03ac98b0187d19db5c7461593354f3d5cac1bbd25467c3248cde8a2d9d1235751c269e64ea5272eb7bc8cad464aec63a3'
            '45383edb7a29c54bc8bccdc8d358d8664bf667c84adbc62a9c8fa8b543663f9b7524a8eeffab50371f9f7fb6292eba1cb8409cf6bbaefc22c239fc2d350e73f9'
            '248ad72a7e57a22bbc41e1424429a46f0d73640afdcfadeb9f2c9ca7a88a196a5e54f05800576e7bbd45fd0179fcc5cebb4371051e6e1df128612c1906f69493'
            '912cbdebc02f1f920af144748bd4f33960f8b554d7f81380ac9104adbcf35625bfc4d91a910ff7b131530067ca441a70c6bfaa4bd3a1df1757303f5aabea2753'
            'be435dc3220b0b7a1749dd139a2a5bd5aed6aceed94b4b85e97ac5a0b8f6c8c91d72ac3c461b6d3176a0259a62c9d2840d2153e7db349581252bb356ad00abbb'
            '10938459befdf3dce3d9dfa1e40472a95c5cf658d3087aaa7dfaf48300665fd8ce7329d9f1853262cdb1d34e4953f67217b9b364f40d921c5368ac1cf78fa608'
            '844c6736f30068902881013bca43fc42954f7627c05a5bc7217af94fb24401cc1fd5170f2c5147699c90ea4da270529f977d8493f3d05b41fafbb7f85842c433'
            '43621b4ad3cb09cfe2c3dc8f2f57a5e47cbfa75ae38b1a95402648f8a2b3ffce414574f8e34cd8c312d5e7f46c5edb78f6af79732621ce7e05f0cd78737d0e19'
            '35712159dbb0bc18652186a8585a62a2ae537e4fa300880f295929f379be8a2152d1e60c851ba03e8809d234cf14ada0f75e94a917653edc4d3c33376737a184'
            '50616dac0895a357818243b649cb77c410ab957e9a2a5a517eb36beb34c1aa0f0700ab2c1c1164750e49b569bbf7db9045d5960b58338c0222093ff39c75976d'
            '6cb0074f9e0a3dc3224a04b4ddaa8361744b0385daa13774d54b89d614de4d078a38544b95e702193cac9a22e29b93786a3d75e4fe297f83751878105ec76333'
            '2be3b913d53a8a1e59fccb2d414acbe7e560cfa1f4603bba1d5ff7758525887050d14b029541061ed0859c75352634c4692c7e5d0c78deff5b31b6011bf3d22a'
            '79b6ac2ae8b9f18f609bf9dc476935579c309f759b723b5af9647f16ff0d51ffd4dad005dcdf2fb876959dd98c213e7e73d4c17a9d89f68c5cae0f37f5dc12f4'
            '8fbc1c822c97007bb906d54f28acace08114d72e526bb7259505f6202116f884d81337d23a089772375e13c1fc20985fc3a54d7f19be437b2d761ea1d77ca4cd'
            'f689d0f9509a83d3c9ba70222d9ca94726d72b6797f418f99f8f3db9840b816b6a6ea1ab42cc6c7ffee087b68345736985ef7bc55af57708a8ae3ac58c551f87'
            '4cb83e4e1ad74a756bf6240f350340625ab555e3945a89936fa0ed9d143d78febc7e066f43dcd2a140a6653f3ba2fdc76595098bb152e3fbb5622c501b53e316'
            'ab3d705391df983f999a47e930709a05f40d4d99ea5c7b71dba3b54f95354c404269e7f7a4fa302d94620a11800f38d30d07825b2b5c40da7ec1877255929075'
            'd437cf7ae55e842ecf5e92c8d38f1e47ecfe50def4bf7f0e8d0a7026d30d726a651fc4b57045e118c0efb0cecc4b8349e04dd41d680e741bd45cc49c8e68fb57'
            'e015b5cbe41213eb3c2c3aee3fdc264dde26cdc5da6099d83ce57faa88c51dd856458d28bc3cf87c81b40e5f00c3a9c79109958d15b359b5ff3009b0dfaa81de'
            '883e609e937e488dac2006e6f9e4599d5cd91c72abde2964743b4825b78e5e00baef5fcd4a227f6229104e1cacf16b079b65a2835def07c395078451f07cc92a'
            'cc42c791d9aa0b6c7674cf366c624f757a6b37fdc6c6dcc89b602983a3c502dfbc3ff8c7df112a87d120c383bbb25e0ee7819d177b92f374d8a8f0a399c06893'
            '0e1ff0bbfe2d6b33fcb78f9c1e734d6fa3d44c21ff86dd62bd65dc28fcedb9222e2a5a4c19a5276ddab51f6e382d661f68460db4aebc02e4c6f1d4d09be298a0'
            '042cb428e48f21bee9574a9471b0365c4e332b3bc26583ccb4fafc57c0968afb97070d87229cf0896cfc568d81d3f119036ca90752dcc9f58fa0f7a0f69fd277'
            '0f202698cc190f4c1880a0b070a447c1c1081c10736a12697e14a9ce6c8c847378d6f908d0376bcb8f8dae74193c208f0ac3f284a12a3af0a34b5d951319525a'
            '671c520bff1073a99daef84d11d252ddf4982fc89a3d79206bd29268cd40ca1544b3d76988cfae0baf680ea97bf7b02c731ab4dcec7a8f1f41cab431626bc4c9'
            'aed48381ef229d54d5f78f36713c7004293c4daf0ce25e16dca16f94e994d16fb303e4114843bbca9098474cf4714d7486feb498748afb28d917e873a4cfb441'
            'd5bb3fb061359473b4c57d766db712202014f9e714124c46f634f3c830670152f82e1a822490f3da057b1dc7532b37370fd586521878834832d18a4b4db7335e'
            '9da8d6ca8cd1e39f8b34ec37442be7574c42704d70c3fa4e7711c7184c81f71ae74f317a9bacf97d754a6093e2435677baa8bbf00359c3b97e59a3023253a81d'
            '2519f92d34cdac11812e131da4d9c70ab5146e52bf44dba803477cbe54a80064e614acc210f0c1582f319245de2f9d35dec0bd397e4a36880e0deb40caba2a91'
            'd23ecbbb0cb9f6b76bf204bc2787307e3aba2cfa38e70128fdef61359747852d6776868602d2ca3946d3e2dde591566553e443a0bb9bc442908cd6bb0500f8dc'
            '6ffea02ceb660e7bdce6bbfb834386d57eb84778a13875004abf98f25f0ecb13fe070a779821ef187a2ec98da2472358fe096e1537b101a5bdac5969b0381de9'
            '7df99bea9f2542ec453d89f3cb4a27cbdd5a35874d005bf31b5bccb10c6cb013436e18bca494f88b7bcca31a6df606a267a3dd95dc396c3a96f10740bdb59e2d'
            '636c2a8d52ebf66ee6c596dabddef40944c0f0f2cdf7c8a07bfad6119a94e385b62dcd0df122aa7f4f207cb17dacd63015acf82aa478e4861c96ed196c6daa58'
            'c7afa6c9d768f8676a0ac5f182cac5883077632f08a6d230c2f78c3a3ed834ad8eaac4d9a2e4a3044b1f60fcf7865a348062b91c06dd702496bbc0c4ff76efb2'
            'ee0fc38d585ba06436db01ba7285c9e3602824bbb2cc2bdf7708ad1e620b608cc7e6eadc4bf77a2057339d78aa3bd48f63e5c587933df4bd0aeb85eb7a5becf2'
            '31bbbd15bf63d45e58353a761b568030508715bebad08a5e08422d895ec35105ebd4106d04676b664ec602e5be30aa6551c39ff595b46fb8bb50bc9424a8093d'
            'd7ccd4e83f827f186d1b1639c7db8b24001da972b5c3e8d3e2270c83cf6e287ec80bad5aa58fa0a9f31b79541ce4d934d8f1bb00b2a6c237f756d60916dddd38'
            'b22e04b6663bcf69902aa80a223efe4e495eec8444711523dc3699d2e18266c7b49351e4de6fc71a45510dcb299dcef8c1996109b3a4ea788c7aaf5ad70a9f72'
            '65b270176d13efce336f5d6f189c867399215f2c7c12468a552832f1f5ccac4058fe5746404fd58a9f2c353db003e6a974e25c284c2c9190d17a0e803a187594'
            '642a6ba80c1ef38b4bfae19d9b47cf95258868334d670462e9894f49d17cd0c87b2a17ec90a054cd5999cac4e4540893dc8ee59f0109f568b9380e8b48a6ae58'
            'eab3254089055f03efecbbda2fd78694821b5608952172d2d52630206fc4305dbe03fb5ef8403597b4b64f2c38ff85c0cec70237aac4d9a0f57555c3a999acae'
            'ee16f6dc8b4b28ad0059f5a365003a66ddda03390a738cae396f921913206862ae0e8eebc57277dba8ef707e15dcb10a7844c386a52996d4aa870bf0264b054a'
            '27286a87181166113bd87c39df562a08b367d93db16994ee9c7b339176090f606b609dd44ab3be3255cf46823cc6a8debe198883ce7943a686dac14a49ee4738'
            'f2d923dade6cf5fe33d6f5df1646d33453ff448082acf898d51f170879b5eaca4133c6d0feda63d731d3a38fef924ea923be0e6493b5a842547c7e66fb95f383'
            '14f4732b6a7b925057ac4683fffde10b79f407fe73eb197fe472d1ba9ed7b2a9c6545655ac52a99e08b3a04e63c75046fe6cfa201b4baccf444f2011677b8519'
            '7c674c6076748fc2c184b6b1f1ad8c16136eee4778064b4f3d90c493d330212e7f35458d95a2c8ee0c62abf3318bc2a131f16a49d5f4ea86498c213cb1779841'
            'ac50dae34b995ff0a661f562a3a4bf88b03a56145fe01a8a0855858e3c71152ede785bc2fc7ab534dfff54aa800507b91a55679b46a1565320ef99df8f4986fd'
            'd2600ced3c64e581263f199bde39a69d8216037b1fed01e7427392f385faae84cd8f1963c3b784a3d7ed1167686044738eafda7b504e25a574ad4fb0b312a307'
            'ab483f61a6ac25d05c2313670289888a50140cf4b6b56799c116d6c98a674b614ac880dda0515215ddbc90db0b317e4f3f025582cd53ff9df5bf82959a031f0d'
            'dbaaada8411e1679b0a9f95f023aec41b46615ab0cf3b4efe6fb5ad02716e834df21d73ad5c02b38cc03d14d2fac8549e15b55ca0095bb79f6361003e7a4b389'
            '6f72b72f895c3e0d5363d6396f3e4e1f19a4c609caeb1e156a65d5d0c4c3f687e283fe973eaa77f54cd3c7d301e58990593f89f446b878fec4c5de3668b03b40'
            '34f89200d452a44dde6def30995cd044be1608953e2fc8e9fb87623391893c2d77ac448511238894b9181d3f83579727d6e247a51112f10a311c5da203d607d9'
            'afcc86084462d987266940f974995813a912962d9711547dacba8f6f56fdf2bcd5377fb527b3098510a0b84719403db51c18dd07d2c5d98d5eba07ffbe468607'
            'dc6ae4e4534c7e0c9707ebb5b53a04f94bcd44189a4687ff55baf9167cf0db641e97bd35080826ed1384fc983722dee6e7f86941e5b3bd522bb5a339234b5d96'
            '74e277e3c668d9868ec345ee6750dde5837c74e9a4ef30e767132deef9522e63c08940202972c86516354e689edf95cb0227fa20f12aab666b6f7114afcd1800'
            '1c2dd33b2bedd207c6a6c919688698a2d50d31db1e94310f3f56c61e49c5527aa25920091cfedeed38025da1fc990992e9cb7e461398ff2923bc1c1e0b40e3be'
            'c45db1aeea3f2541cac9295219fda36ea7764a6d237d7cc777bf67165c58b7a9577a1b7120f38689e8fbcfc47a8554046ff1dd2b6850c0944d7e16c017628396'
            '75debc108bd7ec415d38e76546644ee0a91312460c52af14569554d9a1e907f41ca0d901713ea7d2a0e27d7c4a7d48589eb4051e128a14add30cae0c32363459'
            '3be85b120d18bf6c2e81454a14f37bd4499fca7d7b4c5b0fe571d51fd700c659f5e1bd475d19b2967501763c19f8f4fffe93311153412d86e25f56a68100b14e')


# vim:set sw=2 et:
