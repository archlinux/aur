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
pkgver=128.10.1
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

sha512sums=('6e7363d8cbecda1cedaf534ac10dc046b5f515399ec754492357e8a558c61ee3389f7bb90aa929dbcb4d6eba041ae1e778a0a8f90aa1e1f939eea517333b6c45'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '77c152cdc2706a72655b199bf2a4a8dfb88ccaa78df15956869c226046e90ca6f43e962dbb500c7dd779b32d73ff8007aa275eee67f725e5428e72ef416c8643'
            '242ce9718ac2c1b39f324f145e5fdc5d3cf554a7efe09663ecf72abf62d5d402ade5b1c5ab1e6c86e1f957b9aa4ae06fc9d1ccf83afffd34038e7864f440cb3c'
            'b65d092a1975b40988ed0fcd27d778c0c689fffd86112295f55fe266a7339e6e675421a6d71e2422cae969abcb294e92515988385d22938305b91230a9f8a74e'
            '1b9725e952208de2f036828d7452a165f61a2f60024c002970c34ec209bdb4b88da98b7044aa2d2ebf34438c1e3225696ec1124b5b6f8695781b82c3f623c304'
            '7f690754e442573ebd3c1b126ec42b49c57f42ecfcfed93549140a820543a7b88406337494d910060f8584082d456306900972a900c26059e098d1a738e92d15'
            'f26d2628271a7bda5a329cc3006d0ea32735af2103dd56e38805743de0075a7b4f2b32423127d753cb4356e29361d268fe44b9511c4d0575971178515f825045'
            '58d22695c48bf6ff11ce7af92e9b1f0af9c597f2d7fa6e608462722bf8136ba9a5e1443a3c362855db2be1ac38b440fab6717181fa087ede8ade34b53199e53c'
            '1a013d26af37baeaab28da19b6cfe3c37e6bc215a3a9a8a6c7ff9010a45d030f3147aee4c20cd2d9b8833c51cae844135414aa0b558ebbee8b15a694b75e62ae'
            '2f7ed2d00dd4efa97d5315bfc32e11f83c0222979ddc0b18a7822144ae2520919c984d903aeca3f8f2d013fc718cef65d567c0fd5f657b4bf711ef743c96f82d'
            '54ef70538f9c5961f223b2d6ce245ef1f91d5ad4452312304a74945544bb250c4b63193f8a8ea9904504e9cbe1e7050f83695c08add34be963058ebcc86e8fed'
            'a96683a1bd689e95286b9a6866c8779f7b8f99220e33ad81971a60ace30bc5b6bfffc280baa28635d15bf4bcf3a1888bca47f64e306ca5d57f71e8e251d558f0'
            'f131a7c4cdd2642e572c063daf1e9a952e551de539690266bcb6e2c9d8140480bfaf24272b67ca8d925a810908550af838cd8a30672c44e8c8cbe07ca8ca19e8'
            '364b4984a4165f609c0845afd963d2029f65cd8f23b66f7ea9bebe346e1a8a6803acbeb9d138a84bd06f179f59ca5c5f2d6c9c7da45826f8f5686b4236caf596'
            '82293bcd989cbf2120b03d43f739f11f8796c767b175b72575cf2cc5e047f42bb7b40d161c3faaeaf59c5a2ad0a9c8fcbd28d6a60ccd7bb9710be16b4d7a0d1a'
            '4f80e37e8c1abd5b07e0475ce7176ce8488d372d137ac54ba9d8866f5f409edfcac40e55db5a1b44b8b272315426be904381fced0939a517561f18ee3672d5c3'
            'c534e0b5ea39a9d8c4ee1f7b5adab5fe538c4593740840c34974f9c4edad3a3b75bd27bcb735048fdf941522e05376bcec9c0aedfbfe75f95ad4081858072136'
            '85def8a21b0f60e3b0a67ce23b35aaa3ebee6867cee5e123ec38201747502c40c370f4e4fd41d5d0d10490f6804614f013d5d12a0ded28aa95ad0d77b83f1c7a'
            '6341e6fcf7e98041723a01656cd02269544c8768ec97362c6d260b50d0ec9ff47360f19f8321166f8b82f3f40e80bb1534459b1bef2b38d81a66cac390321cc8'
            '55e2080818acb0c26c31a090e31a379dde18253a788ff56e6a52f118d072d657ee6f9fcc4f5feb5a57e640e5134c273d8a15ead0b92fe0d61549c540a730c8c2'
            '27e340c3f5f2dc49fa4b5dd8e34fdd6d95c32a4538ef5dfec6ba70d4a358aba7a9342083324bb9269b82910e33e0745c60e291e630fcc1b9269cf84da52aef68'
            'eded316f08085c02a8e66311ad29fcae1d60606aa213a4f394865a53dc3351f4880b2d342b23882cc97e763e1f6dd120b39b24a54c41e354587f8e992ed2edaa'
            'e874046e4cb04759f72713892bd19c85997a19ddfa2f205afa86b847596c3feddbb93b887d0425f050b3639dd54ad641dcc0e0fa226f17149ffe4956ced235eb'
            '4cf3688421840e2598fe66ba4332b04662225ccc6719f42046d62e00cb3f08ac08a023d3ebdfa49690c7d3ccd6c6dd3fe7d69e999039ce51a9c4a1731e3bd6da'
            '1d224d0090c05dfe034c94d61a2cc0e32b843c090d6c0e360edcbb2f5db003934f35c80268cbe8f27702893d495ff0eb2c373ec6dac5c171b4442e1af254c216'
            '0f6415363a1f3070effd9c5ecffa59edf0f3b01b846d0fb9c85fc9014223892ca2ed0cacb3cb4acfcd4a2da32a9c0c787f8945d8fb728bd81d3be3deaa2341d7'
            'c63d9d36e906ee6ccc9346bf8b38d997188e041914bfb82cdf0e526264bdb3a3f133dab6f398b93c70f4749771315d1da99cbc3d13db8b8581069a33400f5ba6'
            '0a0d349210b09c6d9939d3a3418d1c4eba90c9a1cf75b7ef9e0a903e0cefeb63b2f18db680168f7eaf37316945155a8a47b2daef8dfb7d64c24fc051a98f4a36'
            '82d7062f09e1e9b3913acfdad9ab18ceb8e69b1d60e309e17349131e3842007e98c2f09acc5843fa424d2dedaf91793479da9174e36594b12af7e0a694b69734'
            'a6f50adbbe2ef758733e4ecd6f5dd16400813029f6c36046774caeb783938ece5bfa425d9af058b3a185b729f7237b127d2019f7c0df9f2be97ed2d7fa8e34a1'
            'bbcb07f7ea5b44aeb0d03335ff650a6cef8f0678249698432d1470dfca513dc5b2a522ac13e6613bdbd819f966da23c253f36a09d97d69565ae3ffede5aded47'
            '2bf4f9f96f536bbfa8506f60df4dbc9f7c46308054114ee5d9759e5ec1685a8496a49022589da47aabb1a56f777370e11e8d181fcc2422fc86e9e40ddaa994ad'
            '04bc891d21296e07517c18416204187ad302787ea15c8c820bc4c430bc36fe25a27ee206a87eea7dde4c50dbb2b8cbf8cdb17af39a23424d0c84eb718e98d567'
            '2077969274692c15a77c55abcd347c1950a4dbb54bc665260c238e76b8245dc7ee226438f8dfbe34555ab70bf7c6e296f25889b4948fd6fcd9b30976bbc54836'
            'bb7a9989087d3d626507026d3b913adf5b00c592d51236e364ea8f572b946aad5ea70da7dd658828023987fc56cbdd7e0efed6bb9bf5e94432a0338446b77ff9'
            '47aa70cb223ad5b4e12481f4d925031476a53b72a9b815853b28e6fbac76860e076842dcab5f9c6c0d36286f4ee7284239562082b0cdeaa756c3d2723dcabd97'
            'e33b49a43afed85c5ba4d3418a9b2ed2f6f2534ef3d2d56c5b57bf8335cc73b2f6dcd5fba8722cd69a588de7664a6f83fed9b49fdd662c21e63e669540da9126'
            'a6093c631f22f7b3c4d531d5bc4dbd0553c91a6ab49a9dea816f9802493aebc2c2b92ffeefc68d8c8a83cdf515ea5e0d1525e0d77f552c9233485f6b7ef00614'
            '43ddc8c9d82638c67142bb7932866286ad308da689ac652682ed35f87ab059438bfc6d5370a44756ce68161a4e5b813beadc538a5f1f83d282703aeb1d5dd8dc'
            '2e2e821d70df8fea4ee93e218bc57611e63834ff55693156704dcc4c728daffd25547d36ba84825b9c996d23701a7137eb6edb386b0f968b8dabbebab39f0c90'
            'd1abbbb888b46a7171242f19558c0d139479a8d66e2e081475407c43bd30bddcd77a87ac96ec514652bdbdb4beb1db504e7b74b3faedc05cb3705109788eddb0'
            'c81ecdbb51fde9d9ab9968ab07cf06a8aaae9ceb5c7f38620f81580957479cee5c3dfb35dc06fc3123086877a31bd9223c724ff64e9577eee44292b20797f984'
            '7038d0eff092ecedaaf24cf0a179e9355583bdd13a29a53f131779aaac7a7752f10aa993864b91579f035667c83afa69375e425b569a9b0a311dd8cd972df464'
            '3b8753d5b484930f08ebe55ed051807c18bc5a9fc02a48546bd990a9300c6c44816b54877d5feabcdefd5d114dc0435a3c1ea6f253c17dde202ad30be34a09dc'
            'd01e46c84d988f7babf9bfc82ad1578ee82d91d63e71974e074152b57990b87d3a45ba3e34a7f36a710e7ee46abad959f7a154aedb3ca49425ac3abffd264379'
            '8b9d7d36704e22b9a87aceb4239bc9a26d6a91a87ab70b9de86c921c96dfa340b865a246811261b7dd001772a8ba7f42e0f49a9267fd64a58c99451d51412c25'
            '65f0ce1735de41771f2a0752baae784811050dc70b8cfc5554c3323d0468ac03dfcca0bbe7191cd088badb2990895435d77a07277f3efc215710e0db6ce11782'
            '984aa8bba9ee64bd40628119cefbac2b57229c09221ea308da9320196a8f87d901725e8ceece99edb3c64c9d2a62c4061026a92b5b8d46d7c4d8b8bdcad2a6d0'
            '816699f5d4ce7a81fe07e8bf930a2dc200d9ce5a84dc3c09cca08011feb00614de2671dee30b71a3e30d0656e66421739d9e81050bfe1afabe8e41281ece014d'
            '0de8d17b6a88be05ec0ba18aaac7aec051cdda09d9faf578b71653b81060ed44724c6689cf8dbf10a571512efd01f25dee349dbaba5cc81ab4a95a85a1f9904c'
            '7257e9f235197d02df388d1b4c170b3f73100f2ecb585520fec693403a0c2511a40382a74a40f184fb53677684caad485ff45d7c3017bfd3aafa33f88e2c3b5f'
            '9f11992d163f39e54cb4673e40c08b987a2c07a87d7df50f53c10e29c48a8f580646f810c0a2392c52bb1b9d70963c77af0a07e6dea167085db049c2ba639a6d'
            '37bffa7bf53a8a9dc7eab8d7ed48246cf31ccab2a935ad40bf881cbb632c0cdeeeb80a8923f2a4eeb204eacdf5127f3d56370511bef2972a921f4452dc07f8be'
            '91b71a6cad88a5e12347cb00a3e8c799563bf75ff9d981be4012d2bee2852c7620107ed0b5b687b4b05b863c066d1bad427c8cd71bf44c71b0f2d5bfe7737f26'
            'a35026a780eb363352b15133f82525f5d3e5a0b12bf1235d51b4746aab8a623642c8538c9b4cb8f9b03b68a69a531608fd4ef77e1ce019ac8cd7b2338d309f05'
            'fe7694aade2d59b5d9fed87095eb429657f3290c8008379c408e968f993b0adf9a48ac52917aa8b8e73bbf438edc3ff379fed054155d12213da822911c1571d5'
            '3d6e3f3a9a9ee9814ba8fcf58465128b589f3f2257278bb4c9b2bd3880865379a9f95baa0163511b04cdd89f442c7b039b09d893e25f466a76925c7ebb64f012'
            '3b1d9d43a254064063f88b91544d17fc776bb93d6e6e00c794db5ee14e7ec6cfa74e63023ca92e21dbd83b16df35d856fa2b2249bd06544e95d48e0f407dcff6'
            '1f25f4793f4b328a3ac32efdc10e36315a009523abd13ceefc0314ef0aa88e1811cf7ef95e17ff5a3ddd4a17008d78c4a2eadb2a4e374d54d6afff2183e11d1b'
            '71f787e71a25c3c0dac7e7ace704c5b742a37bdb7950b4b46716ce0f3341c5aa7a2aaa02741a6d0518637901bc334ec56ab1408641205ba18df553bd9eb5d077'
            '2e66664a374d32ba09c374f7dfad9b0e7b6ae977da3efe81e6592525e81e3720a614fc6bc8e737506c148cec21f6d67f7380a863de5863f82eb1a6b7335a798c'
            'a05b774706390e5fea01884f1abf0619edacfc3c9547917bbbb3b2d5bbf774fdbbf136180e811788305b9ba5efa6026e2c02fa6b1f517a64c601550ad6017452'
            'ffc90cdb12db670716348e0f19558588844434d115ef8ad2e7b7e77ee7958169064f0103024e7de29a3445cde5908112d9051adec1e89bbedca866a582749964'
            '9401bf8c4a2ef4df255e21b753bd220503a37d717076eb70d69e8d4a67e6e7d61dd9bf2ea7fbb9291aa405fc2fc42e98b38fd740c579acaea1aa945a2aee9429'
            '93a9db1ba6e1ffed374163774c1c66fbc2cfd98cc60572dfa259f71f5d8c2b7f894fe9bd12caab24fe85ab3abdd34488043c06e0d9e650e60f31e3df7fb8a6f5'
            '906eb3656dd09c93b870541e6202e899617282219f97e0fec47db881bb07687ce4c119c2c4207ecbf5e828e50e96350f5aed9d9f8e826a17d70f492e2874746f'
            'c7e309d254c4e986529797aa6424c6d302357622a39e7ee4950f8f1912f9aafee713f6c612a1764613e3e02a3c0f7fc3cac6b6a6ea850dd5b6f93c5e246ac2b8'
            'ab827f5769e81c258ae38b09f82caaf0c6ec32f7a831a1158490699c32c651167ec8f67d27fd891c2ee91ae900b6a68cb4a4d1bfbffd4cfa6269993cab77ede4'
            '3114380f7666235a1fbfc0edd839df1c6832458f1a3325feff74cd2a98928b79c69995f6b7bff0fda4116a1cb21f18578d399d08675a814404c7fc8dfeb0cc36'
            'e91e6d1aa87489716c20a2d313a663d3638b9fe7d1d6a86da98b546dbf4a448a8c7982fc827d86bbce64135dc3599b5488dc36bfff762724591a37cbf8b72ad1'
            '3824544414cd8ed5b3553359ff56c6c6d61738a7eeb8a3cbce2265de9865e769d7c0bb7d02b3418dac63f386b2878d83e1f8bbf02d6306df6903012e12b1a9b3'
            'd0950093e0dd9a03777b8df7700033bf42b26904a50014782fb493c0d3bb7ff4284571995967e01408a792a7f2fac1ce8d06db6f7eaf83c4883af9783ca51fbf'
            'f4e89859c82935be9b5ae22f458801adf861caccc1a19d13cf043708b2a58bc8d248511f91be3798571fa99cc8f00e76c51e8cd35fe0bd227b541d9f70990288'
            '4b227a66310cf8bd9862175ee6f01649f68e476b3f854c577f2d87833524380204206c9e564c24576b00e62738f6885e7db0edd1d9f8eae1ae70bd6d61bd8262'
            '7f0c3a25c8d780692a51c80b3ed72bc447b5425567abb984ebc5837ea74d42549ace2c7d1266683033312cfdaf694460e9c2268715b91572523659e33e13f66e'
            'af6eb240618a9930f6fb99a3c4e141c53e04b605d244c2c93a07e8c574b179f82c66ad196b564df729e9a118a4e33bbc2e64d8101e82750440e2f443a8410112'
            'e90ebec3950aa28a3722b31fda965a166de709d9db12b801957af354bb0300f0c94f39816788e5f5a6fc3a67f8952f5aacddc3c8e321070b1d0a521873cbca94'
            'f6490549b7b8b46f76ec56a69e7a9cd8349944181374eabf7c6a1b7dc7ca47d1f5608f7ae822cba481f69f3d6642e2c972dc3f8a40d47941bf8927f3b8b3cc22'
            'f2d70ae6522cd1a8caf320dbee9f2948ba5ed327ea07b6873c119cabb00995f4e6f3e89e423710600d057af80b131d848ed9ef8c2bd54028edac72a99b407176'
            '3b5602d2fae66eeacf369d207d3fa2b122660e92c9ef776b9214242bf818a05651bf4e9020e38bee715c4a58dbc58da8f1cae322d9a1d7e80a81d40986be9a2d'
            'e32ad75d8d95058097c676ed2aa07a7697a18fb93a3d32ef4a7531add4a3f8b9eb654378fd1cfa949d79ba26cf5b66bcaa5ca97a4866a487996b1e94539deb5d'
            'fbc61797f4573c670e71c45a4a994fd2eefbe724f80afcb9bd7fc1d60e270e452ce98966764de98d77af70f659efe594ffb5f6321fb1d96391c67b86dadbcc87'
            '993521245c1c70e9422f5ea89cbf0ae4fd95fa46b1ab23d6f4a746d20aae3ffa12fde94a51a4f1b169559d036b6da4f964b94060ae6b858babd608edd85debda'
            '7b24b7c0f4816c24e0ab7b7b4865033cbc0b6f905beb92a19f77e45fef08a39e9848731fdc70f6ef47563cb37350c5f1ed12187eafbf5d99fec1e843add167f7'
            '3feca25fcdc1db8b9f42d9a9e13d5f6a2e50135c92fd0ec8238d00a5aa8f91f2f3834180e97805ed58db08e2488c5f78d03ff86e4b9b61273fe154f6d3622488'
            'ac7a408fbdd78215f50b231e1d4c58f784ee231aabb58e499ace409bc6476aa8f857c8c3f9bcee349fdf5a9bf03400295c21b9533253224fe2b3dc1a308267f3'
            'db97df123394232e6e9641012412d1dff6cbafc1ada2fd9c9884351ff8b3bf61138c16908bd2c330a540757e6d00c81af8e2efd13a2265ca56aff8ef7ceaac13'
            '79e9c11027ef4130a9db2091f5e7fd8939aa4cc6cc61603aaaa2866ae6ad8e1de9b71622c75f9991c4ed9c7f5f720994c0b96f71537b0fa41c09418272187d07'
            '3d7382e014c25c020488799b290b8d640d33f8d2b54825698c814cfee4c72db9b77ed0d03cbf7345c54e92876f5943a0ff9743f2c8e13a7017ddb48540a02f98'
            '95b666637bccd027baba59d2183c36331a90b48c2fbe4c7fb54542b727584cb336c03b21433f0106ab50db65a3a8366c675e9b2e81153580bfe293dc7b13fc7a'
            '0227d555151683b5e5ac23ae7842b529d4745399d0785a8ac854c6582a8194202da6708c1583f572caf4ec5f6db7c75d54fcb9f516f1a75243b866fc50ec6947'
            '55e4db8510d431e645adb6b32fc9afa518a9405754c9770c6c133600640cb6af02b8eb863d0f504985427962814729f591e1bb902aee976d437c27de78bb2318'
            '97318afbdb179de85a051c1fb5a428500e45ccb2e3c7636a61ee7741be4227af6bc34d309797bbe7d8f2bf9158f5cd6afa1818f6fd6d06591afff23335b79eba'
            '8e8234ddda08f9cb26e4b053e47d69ba49a30ae4f639b920b8ba0b0026975de3fd290a570d5c7d6b7ca0632aa1c1dcad4ca832089224df3132f30a70b1c8cf89'
            '0194cc7c282515b3cac71974b14847bfe9f2c248f1c49a13f6bbfade6ddde4b37c0f7683490906f46edaa2824bcec58ee35d3fb369d2a2e0b7e009662f3c1c3d'
            '8af1272402a96d3d472dac8630e6ac7ef1b55e53dcb6dfee20aceb083294aceaf50ed3b7d394a19168c5314dc736da1a8d7f14754c827b65da5b93fb32e4f871'
            '3ebc37ff47f6c78a0a86d8d024520c8251ea821952244e227a6184ce102507dde5f9323f40ded01220a6c480ff7296d8d89ab44a5561f8863ae00155f7749d98')


# vim:set sw=2 et:
