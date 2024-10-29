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
pkgver=128.4.0
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

sha512sums=('e720b1f993926d73f5a5727648f753176ac2fd093fb0b71393946bbc5919ce5fc7b88b82960bd1aa427b5663c7f659828dc6702485fc0c1e7a6961571c67faa3'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '9d756e0fa0880508addeb703d3c26a39d35d105a91dece81bc21c61b2b9740f64613e824281a9c54938110b005b326fb7b846235fed1772271294e7021ad4b53'
            '8c6dbcbdb9517a0886a8e4b80e8ee0dae05aec366f6fbe5996ebc8c37be70eb104a5e3b0d0eeb99d0b9308c1b723290d6bf96b782b2c10f29668db7a5d1bf1d9'
            'd2cfd1705af29d37a86fa80ee5f459e86b78e4218874ca44c60ae042106239c37d93b9553409d360cde80ac69b2e5f969197cebff4310fd79d87854764697398'
            '23c6a557039053c870aefe6e75ec89ac83db5dd78dde01f128b705897ade0bdbc6443aa1805be739877252ff13e4f155d4358f75f976fa4f814cf9d5228c79fb'
            '37055137c7219c7548e2cdcfe66fbfb192501e0df24c0c9e45c968c828389f1a78b1bd203871c2cae7b9df6bc05600df5d69c47decd6a7fa85d1d53a8ff93001'
            'aa2c63ea7e90c069c187d6cd3ff892e10d004316acde7a2e5994cc0792eb0403efc4fbd974e3c0a9e84d447cb7fe22bd4a5de422a250de5fa49eb3d3451cca68'
            'c13632d42fc9dda66394879b704c7bbee808186b1afbe1cdc4af4a80211b44f65cb0d95192ff6914e00da8effaa74ac8e306175ad53519b6308d1d6e8a828b67'
            '91f4db861fc69d97245ed0b10a5ce8a7ba15c5435da967e4e5f9f1d5297931377e7dd200d047eeef9ccf513aaa95fab7bdba01198345e85bcf13e9e636503d8e'
            '419832878ef934489e507fe3f2fe9c069c1eda393eea7e8cccf4bad8c7d98f22ed4970b14899dadd7b5de27607247b08e73e64e7a889fe94d0a94656a9bdeb98'
            '84b8bd04842021ffb7475bbebdb4a0921be699e24226411fa3905e843361a8363fd623c85c3a947de717fdd74b53dde7c0ab4a2c6cd365be76840d2a5b293717'
            '3e4337b1daa733abd916bffd79a57bf861f2faaecc51addabb4cdfa04177d1c6dc56f53ebf7ffffd3a2a72192aedcab1030ffd3d871b8f024b3c37259ed7b51a'
            '6b8894ad8103e325d5ea7d32109ab58f2314238dd3672d064960bbff4636114cd8900c943b4791a34603f8985dead320d85e352e305c0a1512e48e0bbbeba576'
            '3653eab908010b01a4ca92ba9ef31b7a056705550644483110ad3ffb53d2d216d88bedae467a65745d074a49d349db61cc6a7b19bf16994ab2554e9eca8c1ebd'
            '13a8ac86ae3dc5d3553ad873d763f4b951657974f8ab2b017993da38bf1e37dd6d9c50b5b6dc67fbbed6c6f82041b6698c68305e9ea93a2776141937e2576faf'
            '924daf2ace96382ef5ff104df955eb66a81005564f1844b95127cacaad0673e975d2bc8f3fe63413e8ca90aa00e0d04313c55809cf6e39b3d7b098b6be53bcae'
            '1d2cdc764a18d542b8283e76220f6d14f38228f74a5f0df2977a2db7833896c9962dc5918d39a585418ae691c48496a0aa895fe5f751f9d3bd84c5b2a26f9b46'
            'c90d63f22fc8bcf61c647876c3eae5c9101804f25f14964a49edc63a146727eb4353e685061b2ded5330b723e6398162a108b78d3442799b9cc68af9c1522f25'
            '5b44ab8f142dfc5e69e7e03851f382e0de7639e3953c0355a05d4726afd1453df46d9d4a3f703e2efaeee4591b5324c1fb3956b0a30ab86f618f5dbeb4452064'
            '364ff138510568cef12772ca451e171c8a3966d029df19aa95f84131e5b11ffd69b742dc93d5f49495f4a5bbcb0557e368cc82eff32c7b2f74ef549ca940a90b'
            'a0f11744c77f9eee3d4da9964d39d6091709154c60d8003629da9a5800b23bd1cfb672c662b1816deb93a41690c066c8d186a4b0a22c1325d6738e045503a4d2'
            '125122c3b4f5e19063c74da77c754590b3aba3d60b9743fe6d684f142f602041dc079af69e11ddf617a7c2018180c784c2802429eee519bbab0093672c82d42f'
            '2422f5c2feceb7892384d6e1db6e6ea8682436fab9752287e801ca58b1526468edb680259da3eb4c8eef1c62acd9de6545f5224d2f0f3231ae6f94da5382aaba'
            '282fad1ccddb699e0bc58508da77da96340aec97cfc9ad9a668245828bba49835bab0dea0f55c80f7d6f015d9c3194009ca02fed544cca9558a2ed06f796a36a'
            '13742a87cbfe68d56987ccd7e1975c8e39b6d84756f18077eedd51526d28d4c218377522cd7baf70dceaf11258aca055a41e3f9668f4cd06dcca472c4557562f'
            'f4e808713b97a1ec62f0255e3af4b649410ed6c95eebe12bd42332bed3b47ed2ce6798ffd63abcd730e26147917e6a9e54a76b9f4b9e05f8a9ba62b4b3bdfffe'
            'ff6bb7e202915ed072c7a8afd113906dec7d799e5b17dfb55f92216c613d6262e493d302192ec8bc9d6252fb56733079e5c64fa728ae79356a862d8b2e774333'
            '23f85f50cc4bf73aec68ccc12a553441a070c40cb055861aa83cf949d213e3825a9e9eaabf78968f54bc6dd4f585638d053f83250f629aa2ebf45d0ffd56bf8e'
            'be0c03e9f8d8abe0668a4b9d117cddebf6869042a330519b3fd1df20e1dfddf705f06f08f79ef9c2cfc3c82250726fe468caf3627b50c9c7d7224f63483283eb'
            '5170155894e45d5fc9de12ae659de5f3374825a718acc7a79329a4c4f71e3383a98b7c7897fcdce6d239d646e5a5bada3cf6113adf8ddddd57845e09ac622f9e'
            '8ae87158be09e744ee0bd034fe18811da83953ea9271c8e83031576433f50902bd7325799a20e8a1a2aff62fa319b7d7164b218830b98d18076ba8b32a196492'
            '69ef731e3caae1c71a17dbb50932b2d51fe7b01b107c2f072d86c605b856a59ab77e496de21e01d4ba695b68a34661ac30bebe713405003d39fcd3507c45a019'
            '9e246388f71a68f960b41a6921a1c005d27ff483afb044f202c7a1dc2bcd1fa7680347bc5bd52e1191dc28db41942b52d060f83e7a42bca99f5b71a25609de7a'
            '6120e8a60aabcc98d55ed427b9365918f99899ba2c561c330b97b37e73a485834683564c806d62e6b86d2c3a81e51fd01d5b765f6b44bb8df8020ea51515e616'
            'de21175ec101551a3f9b5416f2b89adc995f03c3a030b48c417006197f1f1620e49e231e49867e18c304653860468a8404ac4a0f71b39175d9fb14f1565a3fc0'
            '9432cadc2a4f83fbeb9b2483ef1d5cc1d9576aa9a884946bfa3b3d56332888b7ea9ff9f6910aa075996e2402bf6b33d464dd65ba5c3c4f151595cc65fc60a7b3'
            '5a69aaa875b768a8da70207e87e35fcf0780ae869253679e91a0b40ff7556502fbeada7d66403453d4f944a949413f0c114f39481a197750afbb819132202b3b'
            '9be3c9c90fe2045efc1e400019e5702fce9a3324ef2bca0894b4dcc424a0237681f6a0a3c01c6cd052be51eee0685c40dffe913c10ab2874899f6aff4403563c'
            '022f1f6010aa81d14ed5456ada7f1a74074473e7d796ac7cf5adbb6b2629643817f379c001180e9d2427e542939781739f97ef14c4d2b90852de88f56477a717'
            'd1cfc68462f461e650848c97dbe1d95cb5f6f044f6280cb3ef7eb7dc3ad17524929c66558aeacc3859954940e44caa1f0b166824aa00829b038b954b190a0dc5'
            '54752991b1a70eacedd619704945208d2de9604e781c94308435f6012e46eab483606cc7a154724f94241642ab82f33e9c5f87ee20b7512618e4230a2a2c0322'
            '41168719bb1c18d16d0026d2d35569062fe08dda4774a31e3ca28d60d17c9efd15b9fed57e98be05b8d4a8cdfea221acfa7392932fe88add36c9e639e1720573'
            '5b98551f9015272251aba83e680a795d3b15db567f76d42e55f50a88b8c6b58f36db0872b679d9221eba4636049c39358d75471a2a93ca6ffb3bad2ae27e484f'
            '280f879b148ba024721746399a9bb5a907fe706c7ce2e367ab3f91665a0a2c151d5c72cb1a9fa8b432cdda7a4f951074aa57e005087e9965e6419db0c7d03db6'
            '31a543ba230b69ef2a968b370a5ea6cf20db14672c463e62fe76ab4615441968fdc7b93bfbfbe9c9e47092116f38eb9a3e82fcccfc7e4db056d17a38ae0916ee'
            '147c6af23bce37f0133104702eafb0457e462ffa361180c6c8789b64990049248256747c11159e34c647aba153fa578ea526db8fff805c89399cf621ec772da8'
            '23d258eeb81fa560d25f346878f3692ad2a5a73249c0ea5ab3f3d12b093915cd1ee2f5b43cb54686f470788363a38d65acc26a05da454d86461fc92b20fc1b27'
            'a618a3ac4b995bb967136990ccfc05a0ad719ae1cc6cd679b24d64ded769026e9650a9f9b1763d2e439b943c5db118fd5a3f61b4d8bc0b3a6232116ea06fb05c'
            'b7885ea204d6d4d270f6367845900288437a4ad6ddf857ca96cf3c55e9347e5997caa2b5ab940ceaad4c1bee92cc43659a2ecb2d6d09446586d976731d76232a'
            '7d369ae33848ebe9bec4ed2fce06e49613079fa7fc36f37c6bcbb76de58d3a986c040052e0110d870e67f82b95df74392e836d6e9a965fc26a9fdc46df96309e'
            '5378605bb0a9203bff46ce27a58fba45ee7015d60561d472ede2ee32ec0bcfff40ab249f284c730298242d05ea3090d8f1f7216816eeb77a1451e45d90722a1e'
            'b44c6c7874f08bd3a25c797b8aaebc0e3f7c2ff7287b02d72dc59a6a127a2f76ad3dbf14847f1a702731a5b948b47192bca429d1ef91b545cfe1ae84b190665f'
            '57567380a6942d0f08c189345df11da94de205497d571fd1d3056772f790630c05a33dcabc7a03049c59682f8097da9db0e208790fab8779a5f35f52fc8f7943'
            '1f507ae8e47bf35f11f6eaa0ca1e320a071c2e9a13f94051b92e71800c6f4d500a7cea156232b72422cb0b3bf43d98f52a7db0de459a1117490661f74e306937'
            '2869c872161a66a3cdb3746878aa71d0818581476cd5a2d549166e2fe5a9c77d1cde8136ec4b461d4eb2da5a1b9c7524dd52d01281c54086bea8f74eed874522'
            '2ee11e00621450f39d9c029b8233a1160a44bdb3986beb5b5f20db4a6edbbeef871fd90cb600efee84848a77be856f279dcd282de8107b5371efcb8bbd66e37e'
            '6eae1502e0df057d7041597a9eec9472afb783be27ded5ef1b6523ab12f246624cb79511b174c310d989b887fd2075b7c3dcd0612ed2b1a14dc5b6ed5ed751aa'
            '3280d83423d5f41824d01fc7ece211eb20516e5eb00f28bc0616b48dafa619ceb6612800f4d6867c32e2f2c1f09be626116ca266a3bca7a709b6261687fdd316'
            '1d375380e8ed66761f1ddb0c6fc43e626eeb66260d3b5f3ceb4b90b0bd9a5cade0169ad46ac16416ecf72c8e56f8c250ed5d063bca795634e30b8592a6ca8eba'
            'ce1f48fc4b1273194f12a7700e8f2ecc1f034995a5493598817a03b5e22164e908923cafc3d7db83bc224b131a06a9d8ad2fe1a672c11dd437dfe1ab9b2854b1'
            '0a5531d8a4b1743f85abde7c4915548bdc9428247392a18131a31c97085be27148a8fd769a6729ecc4db8f381ab0a828f1486d9c14c01759ffaa803e141d1b48'
            '060ed564c8c371520ca61eca27fc2decf687f15df7f74b23126d7780dc921609dfa98d390216f49a47eae1c1d539810fad0b62792b9059ada9699e7b445a4862'
            'aafd961a48c8f4892aea6c5d830fa870b951ca21984d35a2ea9c8e7a8beb1336a0c379f22618aa4a05f0a87eb516b4dc99b50e5e4e603eb738a6e56b47ed9302'
            '2e39ecceb186f624a33e5246093b75e9d4b6320ee44c16b5446230418348d71ae8583df7ca7e96c11909619d013cb1102c15dc41d097b14ddefe0220eab99b62'
            'b3912540697caf23eab729f568cc1b314ba1ce3312d66601ca8a3c734d3046d4299a9e8087cd986f2136b3128623ddd8d5a9eaf7205efc2882fad9c20ed3f7b3'
            '0dd00fab1b387bee87f29bde5d983eea5d1f1ad6cb3c0b826a8f5b606540641715bc8274ef7da7c14a56ef7094b67c94695d47be9b18bcdcd7b80590590f3c04'
            '6f199eb2fdeea39e4c630390a98afa106bdbf3bcb66101daea75a3821cb2bd9a2cae208892586bd21090b8ac501af4532b77f17d43549803779b076b224fe1f6'
            'edda0f63315ae910e659cc0ca26c540c50ec8593ee638778d8022b41342e07d5bf96730a6045a40689591d07b3f59b2e68a26148561b05e55f34a029a71fc91b'
            '923c12f76463f921c6cc91c65751bc6f1e3758bbaf763f708ed9841a27e397a3ee5646181566ebb04e173456d761bb95dc79fee124222ae9e170bec16d413643'
            'f4312844b71d5510c960d2b17c77b746de3f6b483d693f59a013bad2a039a2caac0aa05eea870ee3ac6f2a62e48bf24b54ab4b6e65c11109bc8f85c8bf930595'
            '86ef822f2f2122437c6c5fbea9ff1684d75535427ea3f775e25def0358cf194777256e3e79a481ab343fcf080eef784591d894c8a0fdc7c6e4c0ed611b9a135d'
            'bc733fb0ed6fe63a105b65f4ee163bc6120fbd6d418ae90f794b80d8efb12e77ce6d8e9ad9cbdcf603ef6197c27ec665796e76bb16f344aa37e2c59e0b6f30cb'
            'ed4f525f3c82583477a44f61276a34abf3e2f5034ddd9babafa7b172b506e5bf77154e6b7b7332d566fd979b66d8aebe28dfe76b3a2ad38326118415e1200051'
            '5828533b95c3a3a7e2332bc6eb13fc59764536e55c5cbcff47c212e434b0cc55e8e7334c719641686f22f04737fbef93a1c76a4e99c402f24dc96cd0b9179d4c'
            '9debce809766aa12aa514dd58258bd8f2d9845c332d68dccaf7e17ae27a0b0a589c821bb751e01cef7a17ac165293558ac1b0ed631ec5a4e5abe7ad66c9ff64a'
            '6d1c0fc1d676a0b07539a8e9e34299eb942f7b2e6643f3ac4bbd93271ef500a562e37a1d7016a97248e250ea3269aebcc6f6f670b532fcebb8f045ae959a93ff'
            'ede052a4b5be12c2dc59442ccf16a0ce451b253b895c4afaac423ec7cc5e5c15b36ab97d48a24be5c8a7d46f39b6106e1a84bae659a91625ebdc273989ea7376'
            '30f63622b6ddc9745d725e2b1bda772b7fd14a44de6f3df78ebf677949673d982062729ca8097f81598854bea0e6bceca5a3e8723ae93c963c9c7cfa9e8caed2'
            'd6a3174e932d5c7df7727e61fc35640a0db7be87ed3cc4a795227eab2ac73596faeb4f616d27e8cb36601a983fef1b7769d908cc0bc23720c731a1a2c5723ce3'
            '320e16f11c99788d677145e4404e914105bee3dfc2a1d2e15956d56ae29170ef84ce8abb23a602d6682cbdf677592125c3471c6ca952f75208059f41104100cc'
            'dd17f9b4b69c14ec9970d3edc698c1bf72740696e3f86cbdc19808be997d846b1832dc4fa77000c792221ff5c23d1d0f2764a340442fbd06151fe7ca9d7a1dfd'
            'f2477edcf47f97939d8f1facffea373ff6cc83505f8f427e722a06d40e57ec7f080ac6d6a1cebee37b4bf97e12013d26c236bd1b355414932dc5d9cb1d7634df'
            '4ed8bdef11113ef8d5ee595f5ba9623ff615a2122f1ae242899f09a8cbd31203aa562da11cbb1a97e875f19903079b7733b39cea76fce624c2d001416e34302c'
            'b75036390bb4e5f7dd9053a34562a67df7fbc6fa72ee383ae64f2344050e426f7f353df2fb7171b94c3c143cf56cbaf3c447e397ca48713fdabc693dce786fc6'
            '905e205d74c21f20e14f31269cbae685072cb6cd224abd98e4f9728321668a29dcdd4c4245cd534eaa0fa056ac77c4b1f0f68ea163d252909970255b45034fca'
            '77c95852697fd21ad7b151fd6977a00a15d6f77390e5b9a5b24b127a091e2b72cedfd32c737a8cc8e03bb8bf044c598fd9ebe9d6b3313baad2ef789d793dac2d'
            '76cb05a363deb9ead097d31ed4bc2acadc0a05839a296544668bcb3e9f442e68c0f1c952a985b4f969fd375f58cd6a1ad8a201347a0900c554955bf504ae7943'
            '94e8b543732a3f3eedc4a284f0eafbe32a8556f03004d3d974c2fdfee934c1803c07ffe2b2c7b1c03f5f08d0f89c31abfb322d52873fc9c0332d269c91fed811'
            '734d3f8f7aaf8d8db11b076d0711227e9b46610ac38874b18d6b968a4b05fd600300c38abf6631f4302a9a1ed4753bcaca37743fa3ff660653b77f32571670be'
            'a18bfa1492e0e59d9200e212471b2af5f5e003ed4943ad77a4494fc991940711a102b7c3992dd70b51d341cd87e0c77e3e5cb2510eb8780d142be414730f3a49'
            '157f07f2c4c02faa8b677394d5c6f097684beb7a6f97fc2d6d0e502c9aad9794ada115f18fd61a818ec8b82e4f6329b8d6a175a16eafe37bab6f18d3fc8f59b9'
            '8a9732952b1a87cf131b89eea43d9f7b878a83d19b295b31bdaf286155fd4cbf1c4ff6b3b892a955db6cfe1f0b95b3dc0c0ccf6e09a7f26f2be06ec63b1bf4f1'
            '596b31afd8caab1ce4c2f7370ca058e1f17a3f2f0dc7ca8f2e7e3f08800e451b3f067ec85adbedb94d9346afaa20200e216622dc0245aea786da05134daa8468'
            '990b128825e37801174b5c6df99006f8796427fea09c6b8043038c04aafbb18ea3c6286e7e427f8f24b825cddb42a10a0e44d76805b110d99240007e4b68fb7f'
            'fc1891f35559964b9d6933d7092979f38f15cf954222a4650f4794a76210dae87efd2c1a2b37e0dafd57bd102d00b5f1b02220ed7af226effcd02a82a12eb1b0'
            '14404537fc9b3de89964432a475cf9b526be4023b3b9b29ce4d7c48646af564ea734df7ef4775e4fb52d8320cdbcb114e984d6f651b0c14e8f90040871390877'
            '33a1d240a10fdf0be29b98065964a8e5ef6c698e9b2dfd5889979b8098fc12514671b7438600a4dce47ce48596e7447ee6def8900d23250b718b70483c1bbc55')


# vim:set sw=2 et:
