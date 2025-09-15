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
pkgver=140.3.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL-2.0)
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

sha512sums=('f2a45352372a7c54bfc3a07652098b55634d111ea88550d33e7e2710d15524d689ee39fbd3b2049643436530e13c237d03e05fb7abd3970c9c18b66e5a84c85a'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'd4a3999f3bdc97ceef042cfd60dfffea790ac6c4fbfea441aaf054f21c8f3177ba7f5d9d2ad26a04b28d59ce9f86326d92853909772f90f76e863ff0e54bd79c'
            '7ef5fa6a87a6cb3891e1e227b291bcb981afb77974d67c6b03d9f47116a05833d2adbf6192fd1bdcc7360d5edc97043fb3ecc74042da2f40af1787b693cbccc5'
            '30e6ef2881df1f10c9b6a5c12624c42f8671a99fda1d4b257af22bced7baa006d7dac73cfc0dd5ff9e97a6edf88191410b2ac7e29de99c04899abe68f7ab6a76'
            '9f37232c0f14e7bd1894ddc6537f7de1fe0676478887c0c525c625257a996d5bade54ad6eed25a9f777027cad65a2fc0719ae96ed27f708c58bf819e5f0ffcf1'
            '96578c48a772fcae8e343dcba7f34c6e3ba621e8844bf370e7e843b906e31840c2a81391620a8330032c7ef5e9a7b80520a8b3360c4e6645f64be486bf605c55'
            '912183e6ec079fa64ed014f68fcfb96f0aabf03d04524810b7f6cd3dd41699e79b9a8b1f6eb8a9f4edac4cf1f78328bf02bb0916425cc5ba3cd7cbd1a5114df2'
            '751cda98f04472979929c408ae6248edb9ef0243968ff9210bc85100f0223c55b58fbecd7588c9608250cc49fd8cd9a275a3d77810a84fe4e15b7ea4f5a288cd'
            '52eaca46d471d918b8a59f7ef384137bed7cf61a43be03a035ff26abaae35c87c5f687543cab2485b5cdb5463ed703b355fbb447f0dacf56ae726041bcf277c3'
            'c64715b02c4de0cd35088a299a23e7bea3561c52ddc34d23797b113d8acbab894afd827daf1bc5371e43beafacb72763b718590b185b838e1ef461e30ae10ab6'
            'c2ebc2e731f90e2d62a40996f9d6886faf42e2286cb9b85c7a46be4ecd22dd4df4f39fab6fae0393f948998d7ce72717dcc5394923afd76f199f5328b94804a9'
            '476a3064d199da9eef3d8bdd3df7158b34a383308b76c7bf79c9631e28f08420a2bd411abb174a721e37d5c0fc881ec4351608e1a3863d5ec1d6ed9b81986f6f'
            '403574d4423bc5bb06133130e73741ea88c1d20f6993dd7149dd4fbed26e84cd747127b747e0f99f47c1310c6dde5451fcd04aae2ae9ae3231aaf20ab5d1a2fe'
            'a09ebd82642e36056d0fc1c15de4b19693d352c626fb2c093c9d80e36561008d6bbda41b5ecb553347cf8bae0801200fe79a5aa99a25bdc54256ef0f9148c963'
            '9c59add22a5de11434d4d56a4685286cee8b54e7f27ff36452f858e67722ec71ab92b6d0b3b8c91556963afba13c548d94d808941bc73a65c8f3d3374346ed7f'
            '682eb8190802207c5c3a6b828ae521547f29565e8cb92c92c8da8f65f31c3b63ccdba6d40a93ba19a50d272e152155cf97126d2a6dc4f93af9672a82af178f27'
            'e7be74473b3d1d48fa2b36ecaccb7b20b7c89db0d9f103af2a9a0f66c700ab4b8538ed1f674a6a2f76a8372c29e466c98e2cb598b3e8a705c0abd21839925e59'
            '369f227415cf8469e74aed11dd26b76eac7471c41e590c39bf0a6cbb0a6baa8e0bb83899d3a519c805c655c22b6a12fa2a98d8f18e3fd927d7aed08e9f82ac31'
            '6167253b1d236bacde90ecf3704574096ee230cae05cb57bfbe07f01a3d31906701d00496d6e490caeb8b3dedd65c0f802989c825addd5febe3964d1e91c86e2'
            '09e43dfbb4a878591ce333f80457ae2b0d85488224ea7a794f2c306e131e4ff2c488dae47573a68385dba43317924efb6871b88d15d80183a09aa3ba4bac87a4'
            'fffd509746b20a6ddcdc53fa23452e9dd761192b535f3fb041a363d00ef0cfd2655285e8d2414e8f18e5d083c327d8743a7dc3358bdb473cd309d5c4dff07ff9'
            '025691532e851051a27454f8f410630069abdf0d2aa59f40d353f6d7787b02650b8658e7eeb881b30bd996a81baec9179c019dbc6df70aae840c78d558964668'
            '915c9d8fc80b890b158d87c70726c4072c593c47b62f23d06c5f19e79382360d5c5a40812f500d9207389f30f4bffcc62b8b5f804ee41b6e5061d682fb3e7ca9'
            '968eb72a9303c37810902d41ce18195f47e2a126337a30828512a08d78b2bf329b0bf297a6df01ee25a9e7e7e576f65ebf97907baf106acbfffbb02c9de528fa'
            'a2459c54b7e9e8912066d499138af6b7a6888c8d874ce185032d70667ecdd2e46744b041d95ca4031c4a844a338e9669fb8c47428ae0968c689649bcf56e3ed2'
            '7f9c8749475f1b15ca2a3e6386237e2a36bafd7e727de86bbf76888a92bda29730a9395071ee923d3a34914277c55c849ea2d8f00b30b98ceb1825f977105585'
            'b94a4ea4ffbd9c0274e1a0282c1cb717f0db11fbf7ca96870398849bceb70e425e58a696d4b9c77ee533a178a19630002d7e5eac88e71a2d198579c38eb8cbff'
            'fa58d89f4cb683d2de2be320e4e674585d5b3297a37051ee5a17f699c0f929beb2a2273ae1a6a5cd52e7955520d3ca5e1286ec96eb6c21fae93d8f12b0cb37a4'
            '5a36cbb380ae2411aa0489e9ea2ad7dd2e191d3e0f36231f05f9ac4160d3a3ab7cf280872b9294cac3bb884082f372422166f80b4534536a440d7daab9b9e50f'
            '3070de7228c1fd0795ef212cd4bf239143533182288b3fe73da6edae8fbf8f33a91b566cfd1ef758b4c2c09eb10929691a59ab18da1135b7d911eb3689bce0e2'
            'bb65c97276dcbfe2b518bb962d6a9e517568dd568b68b7a2d8d40b26010e995e42bd5f7b27e1e6feb1add154e4c9d587c594302834de7de2b922b477ba6b041f'
            '4310db90aca3effd3312bbf7fb7fb33ab6d1826379e9807eb46e104dc3d4183bf4c8ad98ab893a73d877b37019164e8b9d0e6485ef6c412173af636af658bdaa'
            '09a934e49c433b8f2b47f8064506e568d4f88d4f11da0a0e4d6c86f2027254ebe9f4e2f41b520a4c4af6ab4bebdd0a046d08e8c1863a3b87feedaaa79397b4c2'
            '4044aea681cd84ea6d6e9fc445329fbd5dc05dad35383cdf4578b6a26268cd091cc89749853e9c318f65187bf415cfbaa26f57db3c98b085eb377aacfbbaa3fc'
            '70301316a12bdbed748213727144ac7e7f48bcedd528c9fdcad4136f411302dbc6573b17d165fc02969a76e78c3adcfd18a9e5c40c358c95cfca2414d79dd366'
            '23e57305a29f581172fcb9dc407c273acd9b06c0bb117c1842dbf80bf1672c4377bf1cd8d8420d2ba0505e5b99d3ce270d836620471524bf4914152828705e67'
            'da0c78a408139f5c17e9705d2bd71f89353f9efb0ad1752a85febe131ea205a4eaf60513d328fffcbedb301e672a93ba5b2c2d9531abcec975134e9bbdb8096c'
            'b0e5e77a7e98c2d10d3fa6d4ac0d9044dd85f55030300b49d6eae14905100e1e73caca453316fcdf0e897d7e2f58df68d2b7fba8a6da0b5ae0cb941d29e62be9'
            'c625e92aae13ec445626b4c941cd01eebf6e0c4c654dd56902e92ed8bf5a1470ee2d0a6a814dd1d8e6475a915deabb9f8190e2b809dadd813369d8f089ca34a5'
            '6cd9c1a8d1cf485960633d56d355d44ef84508457495751509aa2b86a1af2b5fd9c8d1580f6a5132481de6b4ea6631dfd77dfd6cb414ba86dc1a8db45a5b4f54'
            '9ff92dd99454fc295acd38d72272fb777c4c6abcfa255997886c4fb3fe0f0c88083b3117c33da4eda753609c9f45577682ae30877968b60752f0ace2054eba1d'
            '28b83594bd4159a18587666e731ec3637547daaaef3f838e02ebc1f31e5dd3acc09cedcd7e76fbc44cec1cfcdd419e51473911abba607e618aafd6c36ceafd5b'
            '6626ea3f25088da2c38fcb1529995ae36f48f0e50bb7235138f11e9bbea547a4fbeb88022bb9e8cd3dfbe6b44b02b432e95aa9c1daba4298a69efd37df3c20e8'
            'c68000b7aed31fb8a5463a255255f19322503d5bf5f5b309e4aced170836ec09f1cb7f19573845946db4be87dbb721a47b27d32e2070c2e09f64de99947c0689'
            'c15a1eba1d0244359fd2abfa2f1a6aa6b36a46c53f65b2f5cdc24bcd694fbe2762a4692a4c07174899289b4ece1fe40d4a777f7bb7ac6ef28d3de719157e7355'
            'c77ea76c4ee8674549442e3575fb2e233ec3d9bba6ae99d4222b72e6f8da04d8217c81247efcf773c5c41827480f10c577364002fc9dc25b0e2d4a0a179f87c5'
            '90ce2a3974d757a84cdbad6d0660770a1bed38915308827a18b809264e50a790eba294e2f01ef5e72ce01b23978b3bb555d42f264a9dc898c4f02958c6182091'
            '9593014a5c82eb79e383bebbbd7aca4e65afde76ffa6bb96e57db07d72b952bdab97eff9318d32d37bace596a2d42062847ea84da0857041c69fb34cbef97e34'
            '2d2d398b5ec9f7e407542df13ce56f1ddccbea5c68faddf18ff74aa0676600e670d1a48fc7ef18cb517e97345c6fa2ce0c8ab64f7e76c63362597f49025c2b17'
            'b292e644bb767619f6165bc17538e3bb3ae23f34db6635f0c47c5a5a360484c6062bea08f9f3425799226ed4cbcd8e917847bd70da855dffb8fd704dca98756a'
            '01c550c9a323cd7124919cbc73a0c85ba0521deaf1e4e3d83b7741bb0a14e21b9306d7ff326c07341251c600f28bfa0fb4a3dc38f8082cac3d838fab9ff83724'
            'ca1bc8b3b684d59bad9daca075ef1c78cd7cf5a3d670eb220e18ba9c7e38b7a3e3d323eac7b02d9c6aedf9996c967ac899121a2b308cb9f0c5303f09ee9a694b'
            '84daca641126a6ce6725ef2cbe0c3c1a96af1e88d529e9d1d9aaafc014b9dd80ad5b77f0f816db6b9bfab2ee1567d65efa32d29f83eef5ec3a5fdd22bf94295f'
            'a3d4874076b391cf7026ffe5a12d8a96f45dd24b5a1da086bc4f0b68da3bccc813cf48ec7b5b0692e9a9e609f96b31af13bbd0f9d3585d85a8ee095fa9826a71'
            '9775553cf632acffeb35836ad07afa14556d0ff121a4a00c0b9fe635423f510741f3913eb4edcbd520e1759b6f5c777150a35ef810d1c271317bd592cd69aaa8'
            'e84404620b1f0f8c97faf03c52a69ec2d0442f94c2b404a60d573fd7e59598ff30f85c9050f68e7472570c1c1d874d31c19d71768b8b60038b03bab93dec7585'
            '58ee7d70e529e61a309369a80c7f55810751ae833492f56a471cf0b336ea71530b34ffa6179c365a54445eb2fb5013d1e309ae17585ef4316494741be9138743'
            '097cadf98c5a5123c9e21d1076a2f60eb1a6778585c02284b46e3b47740edb0d45fa8d128bb3e21798de5b0bd98f081fa3589e3f571a865ec7db4ab7b9cc3987'
            '86f22b13ba2bbe109b058b5763cf675810f37eb8de1164a9833d394323b8ee234699cd446052f55e14709b07581fad1d5c259933dc79aec9d2237864152939d8'
            '5b94844c0d7f5db0fabc12c9247beea8a3a648d028ec4ec920afc5cc1d6d84965a7101799b92b1b3bc85378bcb2219e89d2ef96b5fbbe06aed7e8712062ae942'
            '93a727092b74f4c1eecdd18398fa694a37232a739f89a1bdfb76f93c279afefdcc4aa158148c74f823f012377d49c20ed4fe44c5fb2a9679a6b9c2eac5a3b828'
            '15da32da7a3837e8f3911ce52c6d2394d5a4b95355b470ce7f2f55291300c37a3c9cb53e1f7f723fefadbdead16c3e5f5a06a9662511b7758c147cdbb5d43700'
            'd56e62713eb2cbe01022a8cf4db9406be822bf802794c0f7d9424ebf9ac30ced84ea6babac601fd2f1f808f76e1bd017484ebda60d56cdbe1dc0503bc98ef4e8'
            'e97bdcd71943213525596cad242584cfcf3821d18eba4d01ccc125ae03c5fbf3ebafe53535039ac7b9e4cf36090034f9df60b0299dffb3da7bd6a46f7817959c'
            '8b4b87f7ebfb46576ac8fddce8cb17ea979af74feacdea70713a21fc46f5db3d4fe54e54b9183c31823e06ffaf25f20a5c0e80d5012a9dd95a03d5c615e0b608'
            '0fc475b1af6203f1d32f727d5bf0714564ee40adbe39193e6615b6c137e8ec5df57391a6b583fbbca347525d618baf250235373824f23f0df5a880fe6521551b'
            '21ca1d860c0f253c07b06a721c2a8d1bdad4b15919618356e2b39ad3061d1b3f51b95eb2dbef988464d50ba3c665cfaafbeb91964ff4ece29c9a903c549b31cc'
            '2f2b66235e2f5e1e4fa38503935d9d4e062b75dfc633992f650ecec1e45d406f429c25fd0eca8893093d55fbbca0146a15c6ef858407f9a9293349bdaa361891'
            '63e8947d008721857c812cda1b883ab2a7e54c6e40aa985d4843c0d9daa9bdadb519124ffd507156509dc0c736c31b8b7298a75d333b51f146d8f7fc8171c297'
            '468652de3c0748875b0898a7ff111f42e6c66f1f95c700c7518716fa4f21498a9d865965637c463c0dca10645103a09b2610efcabf3fc17f836b14d2e26788a0'
            '1108d5251d55056e22c41ef38385b69f44b322d6f822d8cecc8ab5eaf845f83e1cdfff85105aa1ec75f3d7f96afc8a625bfe5c0df226e481abb0a577d12b63db'
            '2554bf18e8759a2fade2f0353f265907e196807d2b59b79ffb3bf2dd456bccdd433d43bf02ecf662eba49d5f1b960525825ac936809b6ab29f4fe6cbf2dd8c0b'
            '79792d5efc428b2a12f186aa967ef0d31684dccee3e030390ee079e8da5a3ce529bc822363748f25ea029643c6f6b4238b5dc6c505ea1767e25b7f5ed8638c5b'
            'b722d64f79d7c8bd621b0cf7f697aba5f13ebd664687d25a31ec25deb4afc71c3452d96685e310449815e83586aacd664197d0e7c5255baf1d337d59798ee3c0'
            'd4c3792443d0f0f040d871484fa6e55bbe456ed8b479e37966f8bbc46f2b16c044adfb8d8f80278a5bca15caa3f7e45831c7c6ae50b43c1d6fa7127173801414'
            '754b7087d3c152c2441e992b704684eac3ec4cffb5dbaeaa7ac82d25764613638b61fad39f987df252dc3dfb6c86cace1164140f215757eecf4217e3042780f3'
            'efdd6f17f878e16a2b2514b7c95b6279b4a7941140920c48d35b872edccbff682b3506df44fda66b0c3f225519d7c5d645ded8d916b81a59a387eb8962519b3f'
            '2b98a8b99e4f9c0a4e35bf3ea19f10fffb55a3d415881f57ec46a0f509ae8f81a2a6e2378501116cddd22cd58f16fd6eb7af38e720c8c9b52fc425097902faec'
            '66de347072a59ed69261098ec56fd445c7f300978b0a00caa482d618c45a0d23a2489af82df643843203194af57a301f000d6c542961e7145d28d972c64b618c'
            '04368b2da7e656ed35a61d0077228f45f9cc32d945b2d83722789a6ab201d82eb4034e2c7ecd78eb8372c949ac6664e3f665cbe99c20e88d1d4ca2d313c7ccce'
            '6c9ccf615cdd7b45b4dbd6c5ab297bd09eb8b172273e3edadfd62054eb2328582013623500cddd21f74bbadf2844891570208f99c3b9bf2e03a48e30fcd8fd97'
            'f3f0355b49d92b1e2f8e6280a713816a69bc61e57850ebd10187ca3509c6e81d790bbb05730c7b03d94a310b17166a3397dcfaac447d162e10709933b9bebf34'
            '63492b3c802bafef24e6d01c04bb9118530afae86b4e0d52c719f836a5bb75c6dea5dd3bb7d8618d06690d9a0b8f361ca47812f697b5f69958320d1c95311339'
            '3c8ae7719ecfda6c6571205abb78d640f79b7bd60e2d6e0a14249e6cde515ec33135b41bc9f34fdb5ca826d4647b3467702f9c1b13d8a8e4a9ec9eff8d3a8a68'
            '6624399d9cad317c63652862ee417509186ff62d418ba2363161dd2a9bcbdf375c0558a1615d359ed8102861384190842d8ca81137b3c535a3afc6ed78af400d'
            '4225d6d5b9a3ec8e9da10caadc3d29a70315f019deefde4fdc2fd63b7c9a5105e8dbf0c7126093a0a2ac4be0c549c75d6e550731902aae6714243afff8283a93'
            'f98dd8ef6eb9afe93dc4fb55238bb4ad5c06d55828aca597456e2de7b5e47d9af2abd4d9e0978d218636925c7d3aabcca7d27ff79711bce1796f5c9ffeb80a04'
            '6d59c5bff3bdce81f3424e4d4d6ef1121310c28e82088d03016d0ea47ae14dcaa6bf41b274de14132720c0d6d90727a88cb01939c524045544c6acc1ec7f616a'
            '1590132110a5df015f5608ae13696f657f01541d02663676a949119f632bb56ddfae192664659ad0fda82b4510bf3dce36ed5070e4c5b5cf249cccf15c909e0e'
            '617de510bcba7a49070833dcd657ebd6e0273bc65ee8dbb4863b9ceeddd0ddc076c641b3111221f8c6387c8fc0b88ebc53fdca7a0e0807bb95354bd5525b5478'
            '7b063b63bb0b1e71231426f68a7bc00489cd36902baba75f58b0877af4fe9c7cbb3af74df80f2d35c46e3238eb40a0a4b6c924518a64385146af74a5b28b69c3'
            '41cffd7e22d217597d0fe402a89c3cfe3e850578b03e37f64c27d9b7aaefce6b3c132a878a9ccf00ffea2d2ca2f18abdf8e1a1d55c40dc6829d0bf746bc8558c'
            'd0934b3aa72ae4bce7c188b8ea01388099d5aa197bc2d3289ae6362550be0cd41e1349538e0c3335ddaa0f2ea3cea9668e99eef661f18e7d688d0a987191e323'
            '9151df2be8f82d6e64eff7bb77dfd009dbbccaaf905e019591b4c70efe2376d7a9b7fadc1600762882eb82f62c5ffc2c447fecd00ede0226ccc2d3ac6b0310a6'
            '61b017c9d6162767549416d24a195c44c968502b89691ac98da4afe28eac187336bd4da89df238ffe36de1e5a59c103e84b543512b334ef3bae1cad45ba9d7a4'
            '3e1ae976719328205ed5c86d787a25ccd546aa1b877ff86301f682e141277ea7467a3e3ac0835b9e299cce15f6390a4dcd814018d81488692321395c7da849b0'
            '888d39a834e72651d86315605762231902ad51b3a72bb8fece0144b327d52ced6b8adfb00024af9e9402af74c3c152d82c219cd667cebc201e056d8c3ee57fee')


# vim:set sw=2 et:
