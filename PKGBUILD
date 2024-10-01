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
pkgver=128.3.0
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

sha512sums=('3c6ef272c0fb653d030fe3f7f72aa0e1097b1c6759556166815cde15465330f988b3bc23df4b4eb753daee930edbb1ef72145273cb29d0952bd9d7c547050f9b'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'c435f4f63e4b8d77493c1bb2600e2e7a90a5b1771484773556ab51555943f594593e41ec76bcae35bddaefc8672832c3f16eec1702d5351933811c458537897d'
            'b07b753e88358519c00bf114ed8c4e271bb78cb8fd210894a820729e7543c96176d3530585b823130a31f18ff888f0d60c26435d735a6eb77cfeb75b1d848eb0'
            'abdeb21d4a534955a91863851c54522b00cf6d1d843a71cef8de135233a4fe9c9878f98ccc21fa2231ad8122b7ac601ab5cdfe76ca5547ab7ac3074d96de47cc'
            '587689d840c29fb7c0b0e0b7b9b886009c7396eafda205d7c8f47ced9002b2309b73336844038dda774196ea8685e60449f4d3d10ccff664aaca8f7d321be8e4'
            '461ae9634a8d97f0d408ec2f862245a42db1a9da0a52f57f65aed68d2608af7a620b884d7dcda6af0ef5835fcd4698451ab8fe25bd02248034cdf4d9afa5ae30'
            '9d6b3fa2d699f38e9a0bf5b2b2cd53360ac42e5c0ce49c3b42e31bbebedd223ce2471c5de9f5ea1e919cfce2de9f237202454dc71da54a7d4eca6ac11f8e2c06'
            '9474d97464b21c1ed7d76f3646083ff56b0a73cf50493a27ea784eabe696ba340c846d8ec236d200705a7ed59a90468718bbdd5e5c4d0dd44e9b06615e317e9e'
            '2bd3855c4f27595d954377f99684f60981b660165cd8718888b0e17426ee917bbc1c74c55b3737f1afcde50b2db9749a62654da2489187efade8c8632caa12c7'
            'c9f732963f5fe95b3719f4ec0ab40c823e4e3f01655033cdbb967c1c2488e21244ee22aa5fae42bb2d8d39e43b612a7ef743aea48f38f37c01b39cd9de3c91d4'
            '45210a99e2d69f4168b0e09b49c403263161be4ee0ad3b8f83f189cae7f281ad1e0d61f8036a73b96b12944c8625abd801648bcf45fee479bcbb84a1364cfefb'
            'bdf7d645850f60fc5cb42e030bf926fdc09e3cbbb61be0c0fd98d616bb21ae88667599bd58f5bc9e47feeff67e018ef4c2c63055fd3de25dd25103cd6c210cc5'
            'a9b9a8077c3f7b42933047e8e69b26bca68f112fec54289cdd30c9b8485d72fe3de05d74ad6446ee5197c34ce58c3b5933c1d7d48411cd544455d15ff479e522'
            'c9d12907b34baba1f6baf67e5a99260f073ce4ac31ccaab38aa51d37ee52563d1aa4029a5854b61f98523f039bdb7993e42fe0e268c294dc6427b97cd43cfdaf'
            '358fa7b4d9578b758145a852b1fd3225adc34f1890bc7c71b110e25b709d066ffe5583e3a23aff6c2eab547018f7111213d626ecaffe99445700de376ed43472'
            '88f9cdb5d24bc0a70624983bdcc88c391292a6b8af25b3c7a4b60b8c2187ef5dc0ecf4071f68de3b63f14b174b0e7282822531e5d81f7cd2601475248679686d'
            'b703529e8b53f5d29872c86dcfdb544be6c5e9e8ae57a2e38aea13842c55c808e0d53ece8086b125962a0f6bd40cc71e272f7cc276c2c0d421b9e6a82230fdc8'
            '44f4e6513d9df9b37b8a15a778f014149853c044de85a1d15820bd061e26b976bfa96f39a10f600eb52b803b4e395dba801ee66ad2fb28ce660c15acff3407fe'
            'db13b221eb98a5c13c6adf2f03fb504cff82b7b4f92f600c75247d15b1d4e1f1f34ae6123c4c47f1151af71f2427d35aa4e0f3978fe15db264a54bf2e11db355'
            '272542e1ca2fa4b099da8016f25436f9e309c02ab778fcef6afd9b68fd04601a7dd095d8ce9752cdb63dd2e747f72a99c0551dae8ef205c88d13c389d9aec4f3'
            'd157445abbd4715048c815cb8eb2797b61db26c5a2f7bf30daf568b163465114b6667f940b4960f1b90d42e4f7aee5fecd5358825e0acc993d8f0987a242a03c'
            'c3920672e19e3d26503781adecb463e97ccbed6203a3e987b28688b588d81250eae93529e2720839b54af7316cd6cc42bffa9a8110fed7825af9110a6bd10d9c'
            'e4a16429eb29624ad701210854efdb5aae89c983ac0381544c327428825e7dbab68f48396f44dbcfb36d9733867a595e16186917b3ea5e9634c2401327aecda7'
            '399f6dadc024a9cc30430b2185ab1f2e2d3281131973dcf64c520886dbeb77656d0ff39d4df5f74d51ef1431df1de8b3df46810a5bc8260f0be941957304e350'
            '34a7592660aaf216738c340867434ad4769aed14826126fee21d79046a70e087021b3e814e3171bc3eafd7cc8ea2a9cc7c171a18c9ed151d89d3a55887c3b20a'
            '501be6a3e84e7b8b5f63e8849a30bb4e9bae0012fefdee2956ff3308e28e025e17f4fa9cf9c386e80b6b85b95dfe100017b1f9d3e9aa89fae2ceea749d333b05'
            '1e6654a45adba0f9fa798d1d794b29273635a48ce4825d6f44fdefe9f4b4bdf0f7c1f3763deaaaf98f0b952319288b7f3477f5a4433b04da132da73b10ac1afc'
            '557d2efa3b2f0dce99847884957073f53c01796a0cfd3d280373e01312b5894624e8bcea2c8a160ca6380a7e077d3a6988652b3f99d4c98e35a6413609b2535d'
            'baeffffc8bdefac31b87730c6b1e14374b45efab6ea7dcb3252a19acd626a2b01995227fbcdeb87a8c75ae0b7dbab755b43a89bc01a262da82ef48f88ac70261'
            '0d53c4308bad868ce906f782574a47b74bcdc6f3017c9b938a763f225a1c9eb9756ef1768134c528c1fbee27fb86169fc234ac8b969eb5e1964077c7ad4df392'
            '5d40453c5803c29884c0d21328a9ea10956d0b3c4c2fd3f8ccd0d4651b1d230711482e91982dd9f2308be7f3d3a45dc194a4f2da2cfe60d9d3cd99cc074429d0'
            '5e559f646feb8f4ab6b76823e6c3c13197180284b963a019bed4521416cb8c0871891445588ebb09dd32d19edb56b0995cfc7e36c5f35290cce67bfe611dba16'
            '3550c4f69aa43d9c5cc79179f91de1158073ff3f1c77ccbd840f778aea52a595c36df254f7f16429d6492db2021a0e20108f1006501a5ef0d8d7746e8979d071'
            '2dedb178085408ee290e92a014163e68c21ddba9c69928ed5b4076eaced688bf1934dababb1fea82d5e199d75bee0118365fb34631fe270f054a25e6773a6ec3'
            '778f23744a68b8dee6e95e374153d2d88bc5e4c30c16ccc2673e7f050c025c804985f57183d6cdf946f50a7ea5437cbcfbbb833ba61ad35ffd5bda3273a6f9de'
            'd4eda1cedc8b24c94aca324a37cdc1cc911ded2e9f8c2e6cb8fafba5ae68d7b583ff7bac16f2a75dbb3b96cfd18c70bf7e6207aa512e7a7e61e466f59770d3be'
            'f8ca265bc63cccdd3b0316a60ce0bb362eb850455eb40f2bc363b171343a345480ce093fdecd2f052cdbcd64b4f3361d6769c47d6e1f1810e75cd5d4207aca52'
            'ab7cc5323809bd3f1ad17b4940943ae94f78dfe951b4c2290b744b05abe43be80050f1fe3addf4a74fb6b8fa76145f6f89ae7c85e67f31dc4d1b43995f587850'
            'b31a60c5c236a6da34ef59ea7710000611364fe62623695a65b16e5c2bc60bc2494564ebb30c1d51778953b13e5de8da5159dd0b827fefed11924f010b1f253e'
            '579f6904f42b926fab94dddcf27f3dba94ebd1f556430b47020685d1f9329012db7ec390d9d8e208c7085597f6bc3c05398aa1d0ae267abfee976fe5b386f7f4'
            '31f954d99615b207e2d9fb163c6aee521e3a6ad1dac96fa4073674c72cc8751605a2dd510fd2627cf7d7562e6b919ac6bc0c718214c92f81a299c4bd84c63a1d'
            '2bef702e423a098a97ac3e49734fb4d107f644a563bcf8ef14d31270cb036d1a34abed6a50bb9123d651bce7be06986b4a1dc8e92a2921672aa2cd53d49a2829'
            '4c1082320f0443e2743f7fab451b90676a680b7b963faf8c312b3550ff1bfe5839c5e80e3f3a68ce1952629d076065a0474d82aeaa9fc10a19c5a16500fab561'
            '95bd1c7771dd757d8feeae8fbd37f0553c2cd615f6f6542c149325434f1e6aeac01002b2db69f3a92b8ebcbcad08c04533d94b3516dae373452eb5da76b2130a'
            '152275d8e732a22c43365c5e0a4563e05df6d79f62e67e63b08bc55d08005f66eec0f7b0d9608bc35bfcbf272e55c680b0107f7bc721fdf355024b3658afffb3'
            '0f105ea22ec0b0d2f0c48441741cfd5260131601e7f3d9be6aa1539f1cc941783d067ca4b0c35dc8ebfa76976fd300e4dd5fa4340a63ac81243af01c782aeaa9'
            '701803155a70b7ee6024b25dfc205692cbe2250a1d3e59bf05bcc5796a98ee7fbb54b5b3a2857b571c0b95c97ed17df130c897267142831f8c3c0d7093e253bf'
            'eb90aeee793ef83f2025f02347a106c9f33065384ca0e29128f9388b0ddc8d3cb6d8d03365e62f1fc7c2a2798b471d4435b0d961704da8ef4ccdfc275e2a4acc'
            '5945d5e920539fb88b1f1fa9c16db5f804e25c6994a1986d7d8f596506149fb94fc0ec7fa1688b68074337e10c45112d48c804654696cc6a31566b334ca9ac08'
            '278cbfe23d3e6b179b1c12ae3ddef221ca831e9805c40d2cc4e21307f6e3fb827b9a67b5d2cb4f159f5442acfdcf06bdc0cb5c15d33ee8dc31ea4a2e10b58ffd'
            '6876b4c82539e00ad384d26ea922b89a6a4c5d4e068ed3261be817f6e58b0e94c24776f93a915950657553c3c60af59d810aa83dec663c14846e8954d017a540'
            'c20174fe919be6c0eb67d9e0c4652ff967e423f17a73f003cd577dc87633c1e9229a48bb232205adfd1710d8facdc99a028a598b52c0c23ca7a0cde87a0b69e8'
            '102bff96f0e23a468a179b4f334bcb4c425d9a86e922b717c3d60ab5a89eeb0946628ea96976de26ea7769965a8015fe2d13c941265959abd1512658060ae654'
            '8cc5f13e26df650f99a61709a6ce844ccaa9743046ee78c8bd7adc1fdfbad1cb1a907c5d2f5e43ca9413efd300d50ae46f15f27fb93a8149a258a5687341f74c'
            'ad22685c20e35c19c32d4988f151c894662bcd8c5d31dee97f0a2115df0656c9520c2b2061d3ef2b1da69f71df1d2620f25c0b9187934028d18290120e79291f'
            '8e25e22457066288fd580b8834c38a86450b79a9fc3d499d21129bc52af152a77a8b257eadb0820fbb419ee385c8471a2a25c02ede64bb40e16dcf26461728b0'
            'dfb0b293a65c53a52fbebc54393385fcf9b3e13e322a1430607bc7ca5be2e1382c529a043fecdaa6158442f7891c08f096c681127307552c8cfd6f064744eb55'
            '1f050915433b4a392516001a041cfe84956d4e2ec3320bf5af55174c85267c6a013888d606652ba47a4e7bd4ae979e7b91e08d3bf98b8baf7e5f420d2572ac11'
            '8e5eb19b2fb5ccdb5f080155585aac45efbfe24b0e7b046edf45840c40fc351bfe5b6a37132a9508f6070a26673df58a334ef195428401bcc414b6b65b9c349c'
            '67f53e619506c7506a658dc105921014c67e885d4dcd6c3f876cdaa381d0f0ec1adb8b5216556406265f9cc5835c74d2ef039727896ff628de4b7979593b15fe'
            'd0661e48729290ac63a4f3cf01463cd55612fd974ada80041a9b7625726a32d9f862a1dd2c99b99e2bd297717f65257a15bd4ed91edf9ae157c5869f9e78019c'
            '5f1ddacb251bc9cf7c6c4f8100780170bac4b8fff66dd3459b584b617ec2aa361c0c7227aa965ce5d23a49df2a3c769de23c6fb33a6b0c5c2a4bdce482339e9c'
            'e4740450ea46355ca2eda594fa5f7effae8806b88545864b0136bb042aa52122f4aeed69f5c0fc6cdfac3f491e03833b247d3e4c45644fa7986a78905081dd94'
            '437891cd9e5073bb4402a1c97d0bee26e42465bc73cf0028f5d0cffb24645d436f2fe72a8037748bc3dff7bbc3757acfbf7c5bf2b7cd46a5cd1028b604b4c4a6'
            '3e2f22d17b0c5d2a8c823bb16147fcedc4e56946f3db32f04ba420d8a66d5250ae4470843a9fbae6eb5fe14c7b915f43088e2f59ac28d20a92f62125dfa75a6c'
            '434c9ec932aae827fb20c49ea858cbadfc7dd88c66a1e376b4482419bef0547d6962b3a8608cccf88ec60d869ec254fc657072f64554d24a4717349cbdcf388e'
            '55e1d771c3b9ac57b5bf8765df72d766637a4f1c5445634c204a018b096d5344ec62de55e4c6e3fef4b0ffb3de4e55835667ef68ffb619bbab0252c24ae90bec'
            '1b6d6ab3cb942f1a88ad1362ac90850747e3764b40f796cda29eec7e6cb66aec8c1a28340fe76b58609277cc36c3a46ba33bbca1132d5cf386acd68f380d4980'
            '91502d5328306ed9e6cd7ab76db47ff077e7b9f5edda0f9d0ccdace91bf5e68a851fd545c2db6929ea02d75a4bb39d006b4b74769ca796f566c30f5314167173'
            '357f7509521e46d807042f459d121d881f72e59ce14b845a9d219a61ac283750d272f559cfe6a75d26734d985bce5d2a879441047d4239b031fa62982a1b71e7'
            '649d3e199ca4973551793476a7aba07d15f755ecad1da66e31507b667f3fb9ebdbbe57e53aa0876d0126dd9d5cc1864d35d661e910a38fcf3ee40b1f8f810ffa'
            '787dba82a9d549509197c38e9d394eec9d87ed8cc8b5840c7ad94fa68940663a1e8fde2d1ecba2ff5b2215fc7fed20ea1916670d5cd715b68da1e54a9eb13a3b'
            '298890394576ffc7de9cb9bbf2b3e3f9498cba8b2ab929a0b4d4fcd8f109d011ac4882f5b8a73647afcf6748d769ea41744ab1fee791895225fd1b623e8d6ae7'
            'e3b6df317ee4a6abd896bb61ec2d11f4fb4c49aa755abe3a29fcb756af4c735a0199d7b8245d4d31fefa1883fec3115ff30c387988f5df7be9584e61aad6eb04'
            '15d1652a26f4309b1d6707bd920c1fcb18deb017948312bf1be7cd4131a75c335fac81f180933d9a84b5f3030122d1d439c8da7e6649eaaf4d166e70575fc0d8'
            '2190e286ba017bac33ef65511d6ab8d7417bc85eaedc245ef4419dbba97b7dc56fb4b7219108c0e08f695a7642d75ef78e60bb8eee2c89886b171aa591264ead'
            '125fe4e2f85ff6ad8380b63ab764a92499c7d68ad6e3c4c332bfc09c89ac4f9c10acec580521c885381f84b6e38d79c42d23234fa47de580f2c9c8f668cb6775'
            '349292774fc959fecf6c2bc1d38a1d68d3918e720f9e9c875cdce22bfeec271128209a4659cb0c48ceefa5e385af97fb04cf282a6d91820c17ef601500992752'
            '214fd6e90da63ec6b44c157abaeac2c6e1eddeb707ed4a79e8f63d2ee24be91a44c363dcae2321f6438c9bb96c64315b854c9e8d3b6676e335973d92fc031786'
            '2098d64b4669af013878af6df1d1d41821dbcd51794e98e2a5c5e4a4a08760243aabdec3c2e25d8d544766746b03c77d6491ad15555f67b859c21371c0931c14'
            '9faef58def42d1a4e84016150a5aa01d2077dd65febdde4bd551577fec40d73674f073e6fa7ed262ebd9692921b3a7100f49f166b07eeb5727f894865e56f214'
            '5414764e551f3f3cb295c7fd311f0a25ca5ef8ed4117597a9af8182081cb30d1164d0973b91d8c6e082840e86429601dee4ba24627abf190445a8d45a7fab44c'
            '127d27da0566d0ecc55e909df9e8c2c2de8f21e34c045773cf75c3dcecdb5f438ed8e6a2e20daf07457f00d49a51f0dc03fddb5b509890fbb0a4c12fed45809d'
            '2296dd25333af9202de3b54045d2eb82f207f6be115e894709d6fe87931a17c4a8064fedd9532a96dc9a14b39418b0dbc6b3acc0f6b2c3938661a7a963156b93'
            '44963f324e5432a7996d3aeb12c12b6fc2aa91f5b110749efc975d4b31dd57dcb5a56746ed51409cdaf99ffe415bec62b78d9b5eb326bde29f241360493d9269'
            'c300a691d645011374d9d26cb1fa3c5dda055ff20127fbb9e29f8c0ecc2674409498151e3d48056c25cef39636587ad4c9254bea57f8b34772bfd85500af37ac'
            'd07d3bd003d0d758e2faaa9af2a9a6e3b90141818c6cefb36e064efb5220722f552827a8b52dd8420a0f7b4797e5b31a0c0251e4515a7d9b195176e0a4cc9367'
            '1276ad048af1d419317d4f6d201405b740f1c943de9166189069eb96c6d9263c660a0c47bc7d13c275f0e6365092202a85bc50879a49f7f1658f1c4aae4d8d24'
            '034c2e240751d2a9207bf82b1f53e6a59a0774991895679738a20472273355bff982b101a97a1dad2aa0309ca04b7c78d314212ed47e302e701ada5e872cb457'
            '2bb3ec57b203351dce319ddbd5a3764d806632358e883ae7b74dcfa38537919f4fa91a1e7ce8c92e6a7523f309fb0f5b1628846f21c5dae7a440709db6cab107'
            'a51e6cde0ec143518773785e5b63eb433acebb3b5658e1c9685b86c051c87c9a733c1e090ef6c728962405ff12451c8d7e9d3ded096868ba1aeb0bcb28ccb65e'
            'c70cfad73344eb836b8cb53c69e9f067320e0b810e186c89a1ec623b05cdb6160ba59191ae2119ee7a293138e98dbcb6cb11f02c6fca29e021b21719f4f67d83'
            '30304d360ef75c55314707c469a64183925a1019f17a1a98f65781e94ff803f50011b629cb6e22ed62c57027fc92ba9fa5914db69009a93c6d4f4965cd1674e8'
            '1f99caee056f450e0eef444f12c6dd724312e370696a62f65dd9c0ba3c88aaa78ac64b5d7e380b8e5e5b92df252ba8481cf23629edc8d4210603fbd08e57ab38'
            'c9ac5525843dca532330472ec5a2a7f3cc12e857e6ce07694ab108764c58bdd6b9c7791afbcc6eebb395453e5f412f357b972fb644cf1c0a2ef8a4025bb06d2d'
            '0df66f8c593ca887c22b84ef75d91035f476a0325352673106b58ca83a7ec1875601aa5491bc565d3e42cbcb20799c6dcce7feb723dc30c57a1a2be0f4d05e60'
            'dfd8e0f86ee5d78d77ef68a97b6030afe34db6c338c0a73288a68a2a6bb864a0233342f5f79b1ae043d0b97f92c35fec3304bc0a49310e66fca8b6554a389ef2')


# vim:set sw=2 et:
