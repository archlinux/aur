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
pkgver=128.8.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  dump_syms
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
  $pkgname.desktop identity-icons-brand.svg
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  echo "${noextract[@]}"

  echo -n "$_google_api_key" >google-api-key

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

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build --priority normal

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
  ./mach clobber objdir

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build --priority normal

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

sha512sums=('040c4c6667d5020569075e25cad21d019a66165cc2e05ecd386db2c1db1243473c4a1a96ca4901d734da8c7aee4761574b284afb44aff85cef071da995619157'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'd654a1c2541f9cd68cb33a0982cea595e18a95069998ae3e490cde385a0216e7643090f40d237542fd2d206162772332e2091ac76c65456f2b66b4d4e210dc2b'
            '3826b02eea2aa63fc9e6ab0d9bb0d1fe61cb1d6a220529a4c9fefee89077972405179403f0a93fe20bf15dcdf7c10e2411866e94e422b9e8620168929be122f1'
            '58b38584e174cb3cc1ef64fcfe35bfdae553cda91617139cfd862b00c1940606c8a575701ed2d73b09b497f05a07383c6b1a7cc6eae4a372a6c6038306d0c7f1'
            'ef0768b7943085e0bf4aac2a7cf036705766d47846f265e0ded5326e685ef0c4b93c2d72c4ae7ef972ca0a469f8995ae47b0f786654e012192d2f5d927bd1797'
            'e8eef7c4b7c5022c39532b070a715837fbfcb43fdedd44190fcd91ab922cd1c3a7fef0e9364dab8c5d34daf40340fe4977fb76680c2b91b4497fc7ccc106e0ac'
            '05793e7647ecb4aef569e431abc06c2bdef1c0ad8cdd7f9a0a08aac31ea891f6c33c88fca6e64421df1f6d2e4b0c1588a045068479933d1a8e5a240aa867248a'
            '2f8c4bdb2e84831313a12d6041d26c521c26c21f41ff24181a0272d3fe7be5dde42115c801cb1f33bcdbdb00b74f043da3684212a175dce89c3a7af1a18cebda'
            '1fde93452deb5d8adc20906c8b9c4fcd2bd7f35d9059de03414980ecf1dbc83cc855c6d31e6c4a8aae199aaec7fdd1434493f4e12bad8f9dcca386483dc78418'
            '8192b6dccfdc0b85e6f20da776d57a77ab2288fae5d3c2f553451ef72d8c4b9b624772b102a23e82210fb6bdf3743083e735bf162db6197a562546cd06c4af32'
            '5d52317fc314d1d889098e32d5a4ed2a8057eb464ddb4f8ee0b4420a4afbab7a39216c9046fb48ff939f7168fbe11784da59ef91095706de788b0ac974c4e7d0'
            'c71b9fbde04d8b8e7333f021c525717be3ff1298594f831f32e602640dd9c2226a431d6fc111ee2e63e19a002b1c4ba4e8e8fcc482cfdce40acfe9ebdd8c7d15'
            '6a34d717d11126d76b03819a22722c7a25134df90e6b32ce8f41a81aee4aa634b7f068c5e57ab1651e17134a15efc2fa9d969b72f9269a5b28f138fa10a66300'
            '578e502c115140beb0f9ca5f360a8f32d21faf79517bb8dbd4527f4d9835ab870150a791277ba8ac1d760eb26549f9bf763d1e6f3117da232e739468065f40cd'
            '77cfa495f756ebd4194fb4e9a7af91120cbd8e269bdec678229abfa9b52ce623613925b1a5d0cde2ea3516ab3cf6e865fc638eb0718dd3becc0c7df3f8079d38'
            '84adc1550c631ea2e85fe9d2c47108a945092ac1155f9fc39811cdf9a3ac17fc82eb2e0ab26df22cbf536f716a6eabb6e6e62235bcc573aa9e237fba545508f4'
            '134c021540b2193bbed8c2bcc73ebc7273d6b9d67b69e980139d493feb7566c689a7c803ec31b37d7722a1dd164080502949c7354c71a5de004635b132d33d00'
            'a14a8991a46530988d235a8a630910f603d0eb5c071e4fe7a5de66edfed4458444cdee0ed86fe7d6094a7d5df4fe45556faf30bc53642832665702c2e483f5ea'
            'b72ad93caca088eae3059bae60aa4dde9f035702544ee9c597cc470beb3c4cf84f97f8091634f4d86b433d9ec3adbf707b80557001aacd96efe24b426708eba7'
            'd7d5534b97f0cc1f8c39a4fc3c153f9b83c1795dd0e6f5276c048b65351f485953a5dd5dcea9655ed123e440ceb02c7442018ab5719ad384edb5bc51bf4b4624'
            '459d6e24d8f0e20ff352c883d3cb1d53beccfcaed5dab8c7ded01f134c3a57b3df292b7ff0b5f2b53c52350985ba987bbea57ac1ed46cfa46d207832038d13f9'
            '1602f10ffaaebe86e2bcfa248ea5603d1ad593f5c668c57519f3f472ced1979f1ef200109be3274b5ce3614af9aaa387bc12a727a05c0b34c26d66d940a6917a'
            '9ae78c0b2e94ed522a015c37681db9c795cd50f4af512fa37dd2e164e10173c16bd83e4b593536a06634cff8fe9a47d127bdeb2b09cf6d504099438b580acd3d'
            'f4a91e24a90faf621d72c6c1b91ce732f9f76923647e7f59781e6e40e7e6a7870e81449530d3303ddf9b19fdcf752ef1db0165507a6009d9aefe455c22a6edb0'
            'f8291d1467d628429c9df50642067cd86a0ebb5f792fe65e8e793c4158e00efc7e13280963b96716a3371ea5a61fe41da6c26e7e5cf666e05f13c34e8e5ff162'
            '4629f1a111fdd0a1aba939d9d41901d392e5c81907f89a3545f3b8de721146899ed061ab3ad97c124bda82126df5eeaca858863431f83cb485581aae12afe1ae'
            'de984e1d1796cb40b88bbd0c1ee9912ad358cb4264b53d3689dc8e985a9f962d06d11303c153896bfaa42c135da84878c923ddbc2bf7059f4a952e882ba710ac'
            'ab5a32f2ee65aa423f2abd7c1d10c253fa5508f73e8eb2028232770ba37f3abaf07ec6246db436052a6b3bfee0607995bba730128e169ce4312e9b70cee38362'
            '5c7774ae367a94b7626d4e53b33372037991b82914d20f432ca18c5f8a9c76ea5b563c4489f40d6125b610ed459e804883d1846d2c9aa1fd8a58913285d6f9b8'
            '5936480d1677c2d71d4c34486421a0d1f1e0561d271b8b800799cb682b85f9fb9e238d794aaecf4aa9ff950153a728bcafadc0a11012d345ee5524397c9673be'
            '7b7d9deb4c2ff63e9bef4fe6b95184613b9841927a37f048e2a12452153d78da0e756e2bf71a9f67d97cef3fb7ca6ab9cf46878d22bbfcf69681b95daf25f1de'
            '11015ae7f1c9afca5f4b186a3eea6037918a36ca6c06328f290c639adc471f569e21634dae9ba25561071e88878f73bbf50d2e46e33219e7d9915bb0073cb975'
            '56bcfb430cbc94dc4814b50f03c15dab8f35eaba3eb345288fb9ffe8c810dafc6309ce6f6ff8ee21797538fc716bf210fd8ede4a6c7276edb34823ab2059c17c'
            'd61de53cfa55efa3db8c7a90a686cd2623bdad832e95ae013c7839b12e9bf5ec636328538b555195d7b5cd44e78d5f8ee280242c5b8331641930302f262ceca9'
            'c4a2a716b63f78a975a36cfe46ad0e77a8eac5b7b1bc28e73b854e638a81545d9f8e7e418c709c2cab599c29b27ddc7f8108f872ceed8cf7ff8c6aeb3e1eb593'
            'cee8e0cd24e8aa92ec6bee6f338f5df8093b8706a2be5afcc0e3426e485ae1f8b7f9c60c44e89e36bfddcb6202b7b11663430643015d6bc059ad5201134dd272'
            '14f12ed39ef1f9c2bc59ee1ea906ab5eaafb1eed4a5ac6c87ba69a203f7ebe6e3c8ecab716c5fa59f37a154e90246d2429b71ab16a57bdfafeb2158bfa68ecd5'
            '01c0179d95ddf935a674888789daecdad4fe55bd476dc462216ad43b94a6b8c97499312f2d2f880df4e515a2a000f5361a98c6ccf448a9c26b7dd844f129a397'
            '0589ed344918acb08d3505e892f7da195901c7a80af26f3f2d9ff8e607f71af05263d7337c2187416cba10bdfc5eae7bd043f50d532439cbc6339168eb92f446'
            '76195c267d1f841588ad3332354e492168d722c6a4d7b1cca326dedfb39165d89a0fba868a1fc1442055561ef9d5b3134846be69b6cd416724de89048cb40432'
            'b8492ee6cf974d462238e38b5789b5aec2b5a849544700631365c5ddf83289082b3c51c654572b660dfc843ee6ef3c9bf928721c0bd622861b910ce0a4b00f6f'
            'ea3b501152ae4eb4b1651d9a17a230a35e93237d44ebd13da05ba9b76d7959f4e9a4ecb8ab3f53129c4393cbcfbe6721614225ba9b322531a70c21d31a1a8819'
            '8f4cf9dd4953f5593dd7ca0149ebff13caa11fcf2cfb8d717eb6d1f57f5a5c793f25bc60c1d8175a13db507196b2a7e937ac6cbfc3ef029045fe40684474abff'
            '10005337cb129e01a6935d07019c26c2249432eda86514cbd60ddec2b5bd41da4f1f0606f502fe96293de014c39529db6863073a70cb6eba5176091889f081a1'
            '41324e4985fb65ea50f4eabf8a4d7f05dddeb7182772684a2fe7effd4d765a0dc32853fc61aa7442496cb87fdeec1a6f632cc2f5a51a5105bc125617187bbf3e'
            'd6bcdd9f03aa8577ecad8f0f53b97590887b624a71178e0182f2d06e4c1c9fa427afd096943c8b0db90969a173a26f2c8450dddc9d7b2f8fff18d94b93df5a47'
            'a4bc10e13467272d64f98f5b55d96069e1443a63d249ee830aaa7f70b2360c4bbfc85ed2b4f0170bc114f17bd150e2c8ae4cb78d78b12c9eae6efeba0d40b679'
            '5642269b028fdff2afc845b9fa0256b9a151aafd3b93f6e4f45527e2abec6514a353f051e7436a1ffaba6e48cb4884f4699e4643fb18e59b27cbd5a88730118a'
            'bf2e9e2266b40090b37cfd512c906a29afbc83a1fb1e5ea4e0a8a456181e5490549c3be923cfa00418be0c13b7965dde00d1f10324e0028e1139419469c339ef'
            'f1ffda4f39505d9c915d61f748b16b76aaa93a09f60d1155d19da4de1d3eb6b8f3dc8dc3ed8f6738a6a131c1d069fa1fd3b9b1454be5f989fec5d7afb6b607e6'
            '5ce93de4f7d96973ac9dd3fb59564e73ffd2545b832ac629e112f2f82d4c67f01e7f4be5736d5ff7e3ecf32cbaae33ba2c2fa5c3bd0b2e0121f26b74bd80893c'
            'e1b8eeaee4bc5fd328568db385f4ee188c2e8d849d4f881b97a8541150475d5644761b1e5295bbf6a77e6001532982d2e20d8f3dc87b93f25541e1e98caaf9e2'
            'f71629538e1946fa5d756ee3755fba53576459b630ea3cc39f0034165e23004fdea639be89e940f909a954e0c3d60b85b5252e9e82208db512758d9a8992dc81'
            'c208e7c5ef6b548ab464d917435d6066029474b27fb35559d36f3baea642c3a246818bd7d9ad2fa922f6bf9cf4551be51518d4d819be10d7cd21dfbe1c7bf5c3'
            '98994079e12d31d9a87df36f861b11cfa0e01321618e80867e9afc185b4fccda740ff727c7fc088d508493afa4d1a12fc38df7e2b7588e0fbf176903c3fdce77'
            'b0202dda58ab1c4717ba1be90896779acc59cdba9a22897fab5fad514c4b780842d69495b2aea6a79a18ea1df66c8c8fd48fb8f2c41df55adc0fd437b64b5b03'
            '19d1edc9128da0fd77378d637a364652649c3754fbbe98fc0881087597c63a56fc348d56403cd00dc65616c97697a03554f8d09bca0f9dfc62be6da4659fc50d'
            'bce8eeebb43d18998ed80634a94ea978440ae5afe3e1fa3ba9a69ec1afb251e8e0c2f90795f0517668a5aa16652f0b918bd986c05efec55a28c1c2dd73996f5f'
            '6030568e87f4af75ee109b3f134dceb2724832973bb5f2d09ef9b4b8c15c9b5eef184ebcf2dd395b5112611c461e3e326263aa539e7a17520e81d2410d8a4447'
            'b97bc70ea6ef9208d9653cb329503866e838780ab185927ab60183ce73ffad283c94f4705657253e55d0999b3fd83d3f8d1f04570b161ebb99ec9df6b31fa9da'
            '5539fc8c5fe900b315c8bdb18a2841cf4a946d1078bc65ae432af9690601fec8b572d41f3734943e4a7a0fa75c256d755089ab506ef6e331952d2900cd0245f2'
            'c00a423086873d9dc1c519281e229060956c7a6b63c137f05ea0009385c5118bf0c4405f515f4cd32e2284d4bd72da1a90c62aa157dc3c87128d0bc407428ef6'
            'd274b7c27465f2826fd1aaffadd13f4792c828e729599c9cea5ffc70fb7aa646921c4d2565942364a5ebcc8ed9be0e0cb4c0e555041eea47213c62bd9e202878'
            'bb79983ea7496c048f9d6f6446d9d8e4320ff3b9fbbb0d186a453348a29f255f59987631aff9d53fa8fe5c9fb6948d7d696c682447b74f66433c3ce6ef1fef1d'
            'fe0a74bbbee3e8b1fb8d1f8b4e97de6647447cc7d2cf79b8827baa6429afa02ddf90834571911cf335a66a39e7c58903e0698f2eec2f41556be70f7a093bbf44'
            '8109fda366c187d784d82eff20d6250ad6e9bef82a15291b719f8cedd180369d032ba4d78ffa008e2e3c99ff8b817101d5c7e017c5fb309de718b6bcdd3730cb'
            '03f06cc635aaf354ca081dfebd63a7f6e4f7f739aa0ef0f2e8197400b638014d2a900a3b6d1767bf2c55038af3cb60b0c07c7b70febc95e748f3b3f34cbc849e'
            'fb733df6d0ba8d4e02a0ea74a3705d6ecb1ffc839a218e1330f67c2e7cef436b6bdaa513e7fb96c528e5658b7a83e307362514dc6858e8f5b7667c35fa284e74'
            '8270cbdc47f53b9f7749d1722506c63bfe6662ce90aec77f9d9fda33880639c67714814f20867885a0a7850e725ddfaca695d14a7ed2e5a60787593422d82e71'
            '478e13d1d23abe26df56badb4052b7dc7c7544497c61be4a2de1f661ceb482cf9989031abe0781368ec42417d154dfdece8c0c0b8ce06db963fd34025fdaf1b5'
            '63015b89fef517ba47c49de47bc9afd98ef8567c7c1e9800ee14bb0dfa32a1fd17740802d0f7ff424e7c64f7c5e29c1d24a2a8c33a6ec1624eb0b729ea3bf475'
            'cab035cdfb1bb4d55919c5d11312e3247f2364fb697cc4b4491e1f5127858e2da4134cb4172515aadafdaed24aa93d4505d01ae9b3e1221ceb3e8c428a7af18f'
            'fcca2e824919431b0f8f3b06aac365a74fd85900641ee0941dd4ceae56474b2ecd86b02c3dc84f8a089bde939281e2674271a22d4fc8b557565ba074e96a10c8'
            '19bf46b427bdb3fd67b703299b2960da348421a383e654c401cbfe79d3d640046a4f02b0d77d6ae6ede0b634e998d567a5b4c9badd33d6687fd226c23c4f6c83'
            'ca5f832a7abc3307c0cdbc4dd51b7834aa9cb6e150fcae726e61ff5231c5ea1c40527001c59b218912563327f652fa82ded98290dfa5de9fe05e13c49f5b2d60'
            'f966b5fe6a1b48ff71fec181837142ea0d5095623a6b6de7bbaa4ea836373a123d7b9feef7f8c04ed9a63cf131eee67e5411aac47bf4973137c45a7e1be6f9c9'
            'c80e0e2f7f756078c1d4619b87448869f09e607d08bcddfeebbfab1593f7cb33fb3ac38e5a0ecb3f3b44c028a7d51765ed62a508c8de24b23b6305c6881c34fe'
            '3ef1a154dc56faafcb79328c801cea2c86c5592c952599e694e5053fcaec17d5cde0790b13921bceb41d45f38ca4f330e3003d668e19ff49017bbfd370ebd144'
            'e87324a2d23548f72531121d9ce814caee78b9f8ef6fe797e0c23cc8a66e1e7bd6d7e8feb2c9fc5cff1f228b344bbc6867b9573537a3e1a772ff7965171e07e9'
            'aefded5b769eb4d714be9767b92bae24628a9d3f147dd06962c6f30824750d543faaea91019619d3e3bd318c0832152e72086f9d69e2cebc1ac819f054e576f4'
            '6a68a485bf3f169b7dd8216e12ea6c1965e1ad711018b057c0fee200e06a26f9c905b24d860c8abe6611cdb1d6d79408bef9fa9b01a3420d88541f8df2e7e00b'
            '13a8918228ec0d804e72249b5af2b4db72b33971ed8dd75d6dcc3dae4f19a29cc8816579dedd2d7f765b69b7b5d44a804453679c2860f8725342ed6f9693f8be'
            'd575160defd6a8af98dbc904333b19cf29a64659013601fbc491b271994a5f0c0ffad6270df7dee2022cf14cca620837010dbe299b0e9c3d82c8f820d1ff9cd6'
            '97798818542e31161ed4d1820fab9fe2bcb04fe0e89364aa4f2907649528e9562440a7fb1f209fb5bf22741a6a00688d120e50ca6fffb09c77715fea037fdc34'
            '2c824f32c504d92dc4cf9c0f016684d4c9f692005b7d7acfc7ba8a1f3a5e41083423d19f28b8ae161e5d1b27451e9f01097273c16f172ea019def6b08e6a9265'
            'f8f8118683a1f9bc939171b912a299c0f53fc0844f63bae07e218ff845db08dfa00d6335df27628cdbd5b5bf8ebe5853867601e706062f3306c8a4aab46966f0'
            '56203f8399a24d00f30b2746f2549cc173b7f67398c479c1db6c168742fb693d35e34ce5ad0b2b19782bca71f7c919e56ec07f0c82cbb3c85eff027fd0b53101'
            '653594321a394eda8c8a7fe4adffe0678a64848d384f2025b6c6df9a2fc6d1bf296bcab5071ab57c6e34b0bcb5746c59112cfa61069b79f398cc7b0c4d723255'
            '5a50d417bf0a7fa56ea72495cf7ac5e15badc2b37f7d15c0e150c5d3326d36c03af6c839a1e4bb20a754f269554e2f50678abc5a1deb4f91aada6c806c043f7b'
            '1eec936316f02e5230f2675c68aa2925ae60c6d9a642e93fc6f09459ec676a80115261870b7e344ade0e1853b2168d3fcdefe84fc7baae90861587ee3af446bf'
            '8a243e930b7abe256cde65139b826fb4365dead8c3dcc3ed92c64ff20e7a4ed205d0faef4e5252c3df534372e521f5c95756b1880a7d22d7b83fdc6f983ae41f'
            'e53d5c0083ebe0f548fac07550f142c79ef8eb3c2a84207872baf772b461e5b82818d5ca6df563f3e48a70bcfa7a1480baabdc03d3b2ce520b6fb3817a188325'
            '68d7fddb694085fe7a6ada2025be5fa9d92347c11f4874ce1a2a0b99bfb81b48d4731e2910c5db4fcd67cdf2d640bcbe99cac688dad46029497cd26b605416d7'
            'd7d369e305886974a4c6c5245546d2532d7b61c1ba55db3212e8790598c79beeca321d51355b04a925bcbbfb177fd466147571846802bc8ca1a0029a59713fd6'
            '16c79c12f7f6db2330ee1e1b8acf60b879a3ebf1c3984fbc050466aa8b12cd49099f3e5f43685d1d5fd84b3687ef7c0fee47f90a937159210f66c07c663f5f0f'
            '85e65e84a881850855b102887fb81b68c60b5d8d59d340495ac37f5ff90b8ad374739087bb6e96eb7f42f2b75e6406cc4952077d446864d0acb98ca27d0bfd82'
            '9858cb4487c48a29a68866432b585da4b9547e2b65451551272bf5a78af026de60201a24363cecd17230b2d1e16d7bc88562a30a7fd398a0668ff10364374ecb')


# vim:set sw=2 et:
