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
pkgver=115.12.0
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
  dbus-glib
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
  rustup
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
  18d19413472f.patch
  6af7194e2778.patch
  b1cc62489fae.patch
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

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  # Unbreak distutils
  patch -Np1 -i ../18d19413472f.patch
  patch -Np1 -i ../6af7194e2778.patch
  patch -Np1 -i ../b1cc62489fae.patch

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

  export RUSTUP_TOOLCHAIN=1.77

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

sha512sums=('d98475061d870e0f3aa920b7c0b9b0c1cbdb3f4102f760f1d1c5ea3e45e216c673c8d3662501e7e78af4950a003a519e94b57e9b1eda8d615c159cdf62130e89'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '0078598c69c232ff4ea7b4d9fec8e438b5d748b8ece993894859d90d3d4c179814a4f1e6fdcd7f709ca5e2273602001b2a03cccfbb105e7c8b401e1768c9efd0'
            '2f0871f46ec3c8e4b6aadf12c955ce85b2767f951b6a3e59ab01137ae318114d85012ed860ba3268257d9a1174ac5fa0b806d29f420ec75a7652eb3c69766b24'
            'e79af42d8118feca5b96a35b8d13aaf8fd88720fc425bc5476ee96854d420c7071949b3c752af8e30c3f154e2613aeb2785c2841ccade07b0fa2966d4b896029'
            '10006c2ac7120eebaa0070e067d48e5d841d17f66fa8dc6c7b1060888d9db324ffc46cb112c4924224b61812bff232fa852f75f5addc910b2240a83b30d7411e'
            'caf804b635bccc5943c5884bdfa377a91b219e0b896fae6bbe1f087841e5959c9e3d452837f6461f24dc08f660105a0c950dbb639f55f6b6b1d18b6fbbe687ac'
            '7128bba55aee22d753ce5b06395f920d5b389b4f0ae73c49458ba6ccfd20c79fb4a8cc4da670f4b7b50666b9d5dd8ee9983b28feef80d211cc74f83265a96d5d'
            '9267276fda3fcc8d189d3c5885b1b748401e634ec5e9c6a70461702058cbd85d385dc479a89168311783662eba94e3eca2bc82f5c2e76d6efd1e96ffa5a440d7'
            'f68b577e9118218c4a3afcdc9332efc1f6acb1522bcdf062f8ba5fba471305a26a817fa023af03e11c9df975771d23453ac63872fb113bd5dc04fbddf2eec28d'
            '6eee0312d977f6f7666a7b1da08ec1bc169f53d195b1b72e3022731f1f32b24b4965b96076d5dfa9522724931d7d4b92ceff94ac1e89e54fdec695ca735b6e2b'
            '39bdb8c0641c3a47df9191e6a87f24bcb79ce253d84493b97a1bf2ec96a07da8d21ce079e20d78a55a2652e10b53d55b0dd7d0641d6d11577ffe772eee03adec'
            '70c96aa87b62cb5a62f398d8da8efcb2fbb48f3bfa1ca863edb1805830d09e0c91e2a219d0ef15ebb450376cb4f2255a96ef84014ddc5545797e41759b934fe8'
            'a21d7cd4c695510707e669c7ee98dbf39fb6bcb36f396d51fa42913515f45f0fbabd011c5cb0a649a877580282426e1226c93b45995a6c5a6a399c2b64dc50e7'
            'ffc2e8c1db04d1c60c797322a685b3dee07cbd0ac9a0baa177966191b4ce01990bffdec8e9f224fae41f22ac57b895018a4c1696695179c6b6a25addc5d762f8'
            'd849e3b61ed2822a4250b874a386f9a348431318dd4ee60ccf3dc3c6c28be131a0f4504b8f2ce07a044216ccf310d94c4f359937319213d73324ed39ef562e64'
            '08ab75fcd349c4fc78baba779330c975908625cfb5c0dd6bdb70f35a1b261b6276b9898291bdc7fdc7153faf0d069f466c0302b0dc360d82c40e21b09a5ba1c2'
            'c73b56efb677281e2562cd6ee1101bdd2ba02480839463a759611f80cb32285904e9714163d9d646a2e0c13cd52c28c22952de70efa781d5d825b82afb49be86'
            '544b1e77224bfc69b4c26893d996f0a9ba85806d592f7abbe945f3ab970fe2c4e2201e3c24f6f939a408e96d44ea40744c01bc11df722ab1bdd1196340ee7340'
            'eff4635f9a3e96e143c171d6a8f120631c0244824e1fad9fe3cef3e2d2ffbe1e2573e9f4134622ad67d6de87cd9e9a429688024a8a3bea200c9779a7f7f5fb04'
            '77dcd57b4a8a4d630be5953f51d4804676eeeb49a3817756d6b967504d5cdf62f79481c1ed64930e860b5ed9cf5244bd90e1caf01e4ee3115920bb290135e4a4'
            'f223ba174cf06d04d64893fa5b11123f14c8c8d8de584a15a574842e5b7dc9a3478363b14260ff7f98427b5fbec67fdbdfa19b00d12058393befdaf734f97d70'
            'a5c7a3938962dd908bd30188064f878a307fa182c30bd38692c66e6076221afdbac917e365230ede4695d36354b83dcd7f68976221c63feba24b2a90e5f054ce'
            '8e890f3e900ffad9bfa3052bc083350c67e7e389252df5e8acfea3bc2ad9e1977273f02a13aa3fc2f17e49f7f5760e17a13b588c4472598addec5f083b389fa9'
            'de8653a03611bfbc257cd7050fcf5367fb69d17af2845a2ec59a94a7d708831cdba4020c377b3daba59e401985bf44d07fe3584c8c01f4254a05a78f589c28d8'
            'f6a455a7f5ecf80b72d58c1b5f1931d6461e9ac186e304486cd16c993991f7f9e58cdb4105340ba7e824be3877af4a839d561ebbc2301cbc0f9b30a7d770b7ed'
            'd165c1cc1a28862a469e96e9a292d3df5a7a2e55613686267c716c622ee17e0a51491ffc805064563b828bdaac34d689da03ac87f84786a468f12efdeb7cb4a3'
            '4749686d1f83bce5b18a0bf3ef3d0f8e32a115e5bcaf221e4d14cc80df8c024ed5d6fa7ee5a9d57ce1c60b38b583beeee826d34cd203e6edec748d5643f8bf4f'
            '10dcedbf2c40f7661d3165e48529e6559956c4b1ff8a146614d3297d11d9629ace243634612050c251fa05bc05a9e5ce5bb5bf7f25c41a0a7b9d383044e64c77'
            '61d3a34021e9e41674d8590dbc6577308461d1ab67a8835000d05f5d791479cdd0831a76bb114f2f9ecddf73bff5460e4d22ab59ea73b8f685d107813d113326'
            '8353bc5ce2b62c76875cf85acfe4554392d976f6a682a3fa1e80dccdcd77b61276bb6b714d6a540950967a77a246dbd60002741232affa6d7b6781e04b0c3fc0'
            '3090a0c5a749c4c9a35c481d78cc326d740fa8362e9814128ed32ed1239d21a578165ae7c3049824178c66b390d1693a5e38af3482a231c96564392cbd9ef983'
            '55b11e012d4ef5703629c303b8e0fb54ffb1729a15051683641ec9f22abd73e6b84c608487a39ac264548f35fc6d2673e1d922ed67ac5166222ca17927fc3769'
            '7297dc581a658a33dbdecaf5d070aabe45125104812a493d9516f3fea3ae83e134a7cd9e7afd80823bf23d5dcb614225ec53f56cf70eeba2a4e3ee86cc887ccb'
            'c7fcbcd436cb93e919fe6be78647746489981b8c6d61a3dd8902d37bea4d1f4ea44d31c9b1c5690d1d874d5bf1e9bfd4c7b572b5abb92afcf2bd87aed47821ab'
            '5821002c5b37aaac5a33663ab4f19edc09190d78dad3794240f59b0ff7c971fc35a0ee057f7d8d1bc44a3196ded72a4891270d9e5ab316118bacd5407daab420'
            'c52b2b92982b6c7d98deaa825754061ee157b72a43d0aa9cfbf8a38e4d12c6ffafa8a61513eaeb0533fe4a86bb3f3b40eb28b1d7148e7c23d10a4a15703c600d'
            '18474b986f7e18581ad6a18024f95535ce373bf8b4cdcac71642350df035f0ade203c3ef9ab7fba2496f1090ce9a13253a9b64e88cc5a6296999350c827a320d'
            'c8f2419e3fb61402e2736cbe8cc3b9db7f1ce7e13247f7290e43609f7427620624d2828ebf9417641da6b44c1f883853f0fbec5499165204cd85a01ecba2a5d5'
            'd877309f75c8368f3dc2b3a890ad92b4961ad6212b9eb43675d4efd49425566b264854616f2ff98a7496ab783cdff91b8ca1ca324ff2ddf981c6255d840a5da3'
            '0b895ba289902d318d3da95d9319ed481cfca4720ed7bb13b7d3421e076c167cfb5da7af30d5af107f497f75d0e511fce9b4c3d8b38dbdb922a5e39c335ebc86'
            '6658d35b8029bf432fb843567e52ff6cc061f100ce25341b0ac7f3a4b566c9219b72c54053bf7a2c69ba2597dd72f868f27203fafb06ca5eba0029b8b361e37e'
            'f0bc9c0ed2f9977a01895e61804d095a3e4ae99c355c3395b0ca289b274806c8bf008f40e43cb85d1dfc1c491f428fffd3e4aee24fdf955b3344a59b6d8faf7f'
            '5bd8ab0cb3e1c723a7bad96f53abe0cf6aeaacb2b09a529fd6ca5182e66439b1e14a058d221ecd185dbdee12455fe87a9d583993b6b107264565e37325fb7075'
            'e48eecc85c79b77e511981026dc30e6689c30157384b3e710eaad641b7f0f7201ee2f0c03b21e2794304846eb33398ecb3b714b1c54fbebf50bf8272bb7e50e3'
            '71986c5dbd1968f44637f0907cd26a4c260a23e6152dca6d73861f9567ffc400a2be8dc4c23bb7f37e57470314a600d4e00adee88b5c2ce8f29ad93c135e4d9c'
            'd9d1bf8fc878bf77fb5413be8cd579b520bca8ae22dd61a656bf2c85454ca240f2ec71b4f4a4fd269e79ce550c18738a4de10de537ffa6190d3f290d770a987e'
            'da176d51f5b03958a6355361280533e0b6fff627028b5f559903965ba5813926155ef6fc8f58c940d8cc781c74dfd708a339c12fc019ca280e0746cbf73a5159'
            '2f956505757ee6de39d2b95c889736a5a4c1ad9a4dd742ae569c648e7528c3e5157f126326451755a8a6eed0a761182d540f0bb31cfaa29a14c91729f900a1a4'
            '12c9b1c9edd025261ceb4860b26a77895dcf0766dffbf41bd0a6a96673d9ea58990e2586682682cf64eb90080b009dce68a1ed4fdf64ec11f2d273a24d1ec554'
            'dc12ec1a589ba093d1091eb29b2b0b48bdcf1155bc051592b9bbbd26cd2afdd57d358423f132cfe46f45ff44ba4b4ba7980a3355fd9545d718e69f7e0b5b5967'
            '284bc4e2251947bcd820cfce92b34c0c9c728d8b4f4221919229117bb8699650394e27da16b51655ab13b97652f05bcda8055646f227e570ecc10f8c2da42b67'
            '5008d1379e40accbafc9db3c3ae3d1d45548f0013077f1e7ee5fc1c9b56df27d1989a77c916dba265e3ec5a331c77ae49f2752d35699fc5b7794503379619528'
            'fa92ffe6001b56b3faca98625a1e7fe5a222a44de2b6e83a321b66bd7dd39e38e3a0f36d3815cbad462479ecfecdaf6f902d12321f3ad1b81d54958fe5d99f14'
            'f3a90857b024bad26b5273abfff622c759aa68089b5d00794faa07aaed4c2f49082945051695a5004de2a9a8bfbf5b958aba5f73704461e76910e490ef7036fa'
            '26097d5a04755d60fd6f18bfa1cd27c8c2d351ab92d287b62e9180674b005bf39d7de5b850eff3e103a741a7109e588f2d94726c989abb4a82c2122ae06340b7'
            'a42cc532659b8f3e1372d4d98dca251ba47c64278d926e0cf8068946902ca51e323ef1bc06c53687eb4edc105af2caa56047635bb3908ff6ebcfc6ab3fa32e41'
            '48760c6d052e6b8eefe3bda730f29d21a06c06702a150402278e41a9320482969554121b68f4fa420e8f061286b8d76522b7b35cc4931c02f1c02b7f6813cde9'
            '6ae8dd80ca2ba6905063062a70bf427f73ca60bab7bd9517da6e06ff2f9e524cb92dc29de0ff10fa47ce6e9b2826a3f543d468eaa64e1a500a05cfa3cd7a72d2'
            'bc548615441db4483f5637bda5085edf725d325e3697f083ddfe9155cba0c5c382e71359f0891267f16a2aefeb0b2c01db1380a05a7cd33bcb3f689e87f6a6e1'
            '3d43878e8a3c0d8260c55ac65d7b196ddec38702d822f8848b99bbb9cd3d525d7e1fffa16a434bffde69af1b7f08375df2b9d0ef7e0a1eb218a19bfdc46cfe98'
            '6a5e1ceac7eabe9da1024b25f75ffb8e23cd4a367cd13924e7b24f4f171c2c1c86ebd52919f9ee4b769e4b08370ded8bfb6469ff2135cef80a65ca85d0132952'
            'd23f0ce15355b957aab07fa7da1fc2f4418880e294c8ff9bdaab722219f846cb16eac59966e3695f1d18652421815bc1c93c6c5560b9b0fc98dfde0f01b640eb'
            'dee4b2f5fb4d0c38bafd1178dc02d667408d78960a23a6d787d40f65b1f417019ebdb1f846ef1613c6aea169378295192db3c4f419ff6d4286069bd2313a49a0'
            'dc3e3551982561135a5738010e487673dec819558a058d01c03732697c41984a289c0e32c5af99ebe583ccedc0d1c7c2f125e9cab2474b7be7e0d1998352fea7'
            'c6fb94e1cd672f86ef5aa320b53e43af954b201ff9dad0829e0041f2cfa12f42b87b5a939d81aff2951731968b6bdb8420d2ca990c0a58c2bb0dda5c9cb4023c'
            '58447231c8ca153eed5cd326595a71f96e3c0898ff176308dfa033174c8b00cd7314052905e606bcdb75e9037fb995e702cb5e67ecb680c763ce75cea580ba6b'
            '67875307c653525c6b4b8152d9132ab58bd50f326b65fc292d8d93eb8a9dcabe9892e245ae2e064796260ccf0076c3bbbfea1a5352f9b8001abfeb537850c854'
            '1a68926827a90051d9b8eba1127bab25602cb2cc918d0a6a45289829a86d9a5c9912c8908f04408430340f6837f73d99475529b531cc0ef232cfdc5ad235a32e'
            'f549f5b04bf5974968c4c84e695d7e77c9706050203e54dd33b68a6b018a759e4dff43bda5c3fb3f88181d3e5e81311ba4ec14bbe408c6f7cd25f578d0559c56'
            'f7ebe4ad55d10c5d8276dee7ffda939a714ece6e2cf298353b30eaf0da30736ff6907f4defc657b6f6cd4d7695d9a4597c5b83db6ea5992a23fbd4ba18e55c21'
            'f7e151153abe0bcec2574e4e0893171d558313ebb6a8a14154fd715542a19de915fb9e1bd13f9a65437a78d48426b970d80660da7e7fdf68a7afbea2d8965a7b'
            '467bbb01f038d794a93d25c2bbe54fa3751103709c4c98c1d0f25ec95fc66423a92ed277c74246af4bbe19f22d3119c0a05fed9782cc415e8d198e0aee45f182'
            '3210afcbd762ce8195c8c414310ab57c40d3f0a714997bfc563a5ec74ef24230a813014b7f32a914ac0af18f3d9387ad62eeabd8fc6f193f6568aa1824d13351'
            '3e96a6cb5efba763b0cb5ccf8cbae0bd0631159652fcbf9773cc2a0461fa17153051773844c3706a2fdb048996343745d86f805b38ae61aece99a4197100a7f7'
            'efd22b8d52c1f62397587fdb0d5c1583e2b3401f2fc4fa22aab8f360c617e158a026c973523a358103da38eb32497f977922fdc9cda1fa359e9463df03639fa8'
            '33da0f635add28d331d45e39657fdbcd19fbed34968153e611da549adaf4a050fce645f57e5b4afc19b8e37b7c5176e9a9b7eed7a5283353700b769fe1403e10'
            'b6db207cffe7d70ba2ede24e6abebe20fa2971200e4a6366ac345f855de49eaae50186dcc9ec4a5058868fe5df6a5f3040904c1cb83d10e5f8606e5180216360'
            '6c944003c979275afcc63026fc6cd7a9b2c7e6dbfc123a41a3bb3a9a0a3aa9ef28c693434d8acbccd148f258a855987ed23d0b70dcedc4ad63fb98da68763cc8'
            'f960d840e658f94a7da8e93971ec6e848ec29ab8ee305033b8ac16d4b4f6531265e14ac6e26d494541ccee661b8ec34af2e18f65f05c5720a0fbaf2c0576e099'
            'd099f908c2d7fb5d1fedf128a8249990e06a4307f2d039cef7a330a871fca59b353c648ac2ee4e1e4fe33469a0184f67a1b41f1c3d45dc5f9684e16f99732590'
            '57a7e1b0e7a2925eb0923c23fce5118502ed5bf6c94bf936e2010ba67154f3d2d3b87fe4a27805677aa860eff520cd1aa24b37c372f6df68795218950ea0e1b2'
            '58453df0e6ec94de901d28ebca0f42dfcea4b7f5473ab24eba7665ee4b5e1d270a9b06f34916ee4ebc5c6a6cc7fc6cfadb7257c022355006041af0a00beb7d3f'
            'e90b83a7b034ecd686a20e61bb13a75eac7eb1b1754d3f8fbb212b5c5ac56d8e3850726ade8783f718a9c12917d6eab8b3c0ab90b6c5935c7ddc70ea2c1090f1'
            '0af418f711b55a30f23628e1e6a30a2d7085f9387d94a1846a058c0a65ec3e9fb5eb3538787e7dfcfbfb21b0a83f68db171af12fd86c12e389f54b68083da330'
            'd820013522cea7a3f1d8ca0f01bb10ca54a60c47bcf0656f3b67ca92af20c16eab34de0b959549955893de7729af756141685143a201a4ff3b639ab75e5376b6'
            '4bec34fd8a9ccd06e4879ff91f26d930d23b596bf687252ebd22041380785bea972f80b78d0c7e916279e83ad25ff6919b4d520036fd889a4c2c48b580a859a8'
            '959840826ce6045a04538ee2712f41ea412552b2eaf7575a9e740c577c617b0a654c56b2d3004e31cf82e6321e7df788a6136d084b3f8bf6a25b0a8a9001e766'
            'be02cfcda94b55b1db43d26fcc509721c0874d9263d5c43c2bf7b4d9669db7a82857a411825903ec0888a4f12ef92c6bd64e6678d1b3e274b2411cff36a90a3c'
            '6805b0b6121b3477f093bbfb397f3996b05a2f27cca82b8e1c9514db9505bec1447e9f6eff9985f47459bbab1c8e44c1dd1155a7dd1025dea8a3876619f7df9f'
            '277a35fa8da2fd5c38a974c957113581c3a02b745fd42da0d9f363881a30c08b7f170d9407ca13d6320d145551dc1af1d15360f9f11b7931ce54dcd8cef92ba2'
            '2d5f64549ee181fdd631f5c44a3a468f3a6e2c43ecaaf44143359dcd57564429403dbe96093ee4745241e9de175d9ead74815f843c88551a73f0454bf30d2fe3'
            'f386ae6f20ed68bd1230cbac2234966a3f8143abaec13ab3e7f715140ad8eda0974f0605e533b9368a48423c6104954ee7699bf718e8cbff98d91ef52bb1c675'
            'f02b761eb806cb41ad0ec6b34b9b21f5247bde09233de9121f8ca8c65685a5cacf025f0c51ed1c771d8fa91623aa5dcebc8766caa72649dcdd52a2833695e207'
            'f202a7a81b9d83429e81220447cf5c63aa421c27284129c058bae4caa4419e4fb776728e5205b4ffa5f42cea7ee8d9b927f6507c70b084ab77a95ba79bfc5455'
            '6ce12a4b000306c13fd580e44d166f7436ad8fa6e7dd1276e415e7282d9d883cb72a1cc909cd40f43c8300c620c27a89ee3225be191f2bfab6a6299fe8f327cf'
            '4b309b2da6c579ed58d5d15fb2983286eda8289e286157d95db9d18d735d19462a5fd25371cca64dc93c8d8fff4f60a25a1d8a38fd71851c819d265d0e60df31'
            'e44259032dd9a1c49369a74746dacec494d111316593ff70cffa1904787c7c973b23e66ff92c0abc496a0fb3d100ae2e74ef7377ff0675c39e62e9250ff4cbbd'
            '468c745bcc6ee0e72c057484ad6dcfb84d715432765b1aa7071d8a08d4c7bb15f8a86cafc32b3d60de32f5c61b8372dd3aa0fdfafb4b5c2384e463419bc23979'
            'bfa4cd5b8ca8419a0ccb19ffbb7fc7156283bbb784944bbdf1102b631cea372ceddb362cf8181a57bf8587bbaaa28deed78c0ce288b4d8a09145e047ef82ed95'
            '030d7a603010447d82d9670babda138f44f39b7c1370c0447124dcdcf4bc90086b973ee8664406b4d97fa292cfc692ec31732e9fead685a4fe1696c324431045')


# vim:set sw=2 et:
