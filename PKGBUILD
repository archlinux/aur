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
pkgver=153.3.0
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
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
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
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
  $pkgname.desktop
  identity-icons-brand.svg
  # Make different channels installable in parallel
  0001-Install-under-remoting-name.patch
  # Fix build with Rust 1.98
  0002-Bug-2053518-Handle-the-oe-linux-rust-targets-added-i.patch
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

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

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
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=esr
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

  local appdir="$pkgdir/usr/lib/$pkgname"
  touch "$appdir/is-packaged-app"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
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
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/_}/SearchProvider
Version=2
END
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

sha512sums=('56a5e092f0aba91febf01d227e8068520513f632d09c5ffbad4cbb2de307d9066425f353a1b7fcf5648733e02a9b17cfc9aaed5e39d7562a6b143b1c9827a668'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '2b06a2398e862fa4e61ee5e41971930a9c50a90fad4ee99231fa9f8d94d07e3f31a044d2a306a73e28367f654ad5568bf4a64ea42898a5001969022e3bc8e992'
            'da7ecd2cfb729a532126569eada73a54086e140fcfef7e99189988e2a06e7911bb7c1b4642b7b557053718dc9681ccaeb17a9880aaf6d6c637d1e2b385431c99'
            '2c5380a03e89302a89c016a8d3d6ed0ee5fd50a67dc27f59d1f64067fb24a86c24168fd665ee0bce616858fa7404c6d8214d4b11e98867e22b22aa0c0fc45975'
            '757381e09e500b9c51775e3f8cb4c509c70c152f8d68594d849b4c702dc2fa9332fc6b38536ebfb59109dba2b054c7dd11dcd8c78a4d185650d9f90828ef79e0'
            'a872d0dd27718879f57a3c5ded2f3d4fe405bba8de2f808ee0dddf1bf01238cb697cc49208ac259b3d6b77a4984cad91d541ed5ee33df33e2b8a56f9e54444d5'
            '7d49537714f2f83364259b071418d3b21257ef6269720f0a45cde3660fb5c11074fef99dc4659683917bc9d6c11489ff1f8d5504ee9f597ff40c942ba224a017'
            '78ab433c52fb0a7003f1f568f92762d6036f99e6d3bf0e87cf87cd679752e774c2f8ef52a67f9a2bbbde8dd81c5596160c15896d86d29cb25441b4dae49de1f5'
            'db15640a1789d9b7837f309b66e292e9df962a5b0ebf4b3c2b00c29f127f66dc2c42ababb135a00fe20697b595b9c271389eb1248d2d2c9ad00ea0942ca396dd'
            'd36b9182eb59284c845839b4e768669a946b5832eadeba1378a00b0e39035440f873813b60fb28d9cb5288fe2e77863ca379d37286fa5efcd27e63e3de57a70b'
            '9297304b94d1f85b4ee96b17b9c676a29fa5c5414ffefb3d7b40233743dedd6fa43e61f123f2d683d5a8163dea4d69a6a96d99031ade98cade296cc65da75ff1'
            'a84a4899ef09d12e01d871df73d8a18d1677fd2509052dd4c9f05654175962c9d07c3625947c320bada6f7013d16453bb79d63ab6444046f550ed6954997f761'
            'a0b6a1b0ecc5255dce5c9f7aa142f5e85673e1547efc93ffaaf6cd2fcc14b3c24134428b105e538187d0393bd4e788f0c0e49bd156f4ba4c80077189d2081426'
            '64e0a5b1f4cd28d84fa5ea646d4e53443062f14a1235ef4fd622c690a51361fb3cf474425df81bb837460a5f3bbade398cf2db0d3a80c4e81e6970be999153d9'
            '2037d4fb2b5967351e0380ea00642a81df4cdcd0cd00fe673d7a7c45c542ca2b69cc726b0a02c484f98fde088fc5a8d6b12c077a6a2242eb3819cb977d92c195'
            'f5f5cdc9809f0c64584cd76afb00f0731c9a024dd845ca4208c690bafa293ded4f463367986cdb33053553a1beada7e7353b4bab686de6e9fe71af9b9df0c793'
            '98d92fc5f8c38cca8658b03b6270599b8a3f2aa678cdaa89281a62fb4ba49cf1b21b3805e33a5baac7fc15cd62e09db34c70c43d0cecaff20252933ba954a82b'
            '58587f51c30495834601d2760a99896789f4101413cca6a537bef8ef55484febe9372809c80961a4bf54a75b2d97217b355ba7478ff7109a15b1c26199192423'
            'bb17a0f626b56590187364cde57ee6be80150569e8bc96884b262c3e0bc69cbedb4e6c0e215a9d40ee6e42624985d9c01cb07e9d31907dd0c7c33f59a067f11f'
            'a4f2f721310c95e7e7168bcccef3b8563d7ed8462d7b050f4721512caa3006552779c62883839c15e96f3702bb294bf442d0a4bdac62bba4e7ce798f7457684e'
            '657579806c60ef25d09131df434a488318a4d8322452a0fd497ac3e480ea542d6a7f10c23656f7729edd8ad37f22da14c49dd5b6376d558084bbffdd62d498ce'
            '4b3313b383e44487e6a9ce8c1844403791f89c67424f07626a5be6c43c096e5c75093d0e4e79aa6d36c27da3b6bd39e6b0371008e29538e2fe17a0234e185cb3'
            '97bb4ecfbff1a254e1c2bceddb394c9ef92d4d38d758fab552c0efb6b0529751c4854e4813c8e50ce097930e3917f6559ef88d868c963f58e88935b863c75d1b'
            'db67f6da7da1b9e396b6b9b96bb8787d067531dd3d88feba5e4fee8fb56741618fffd78e2d11dfda67c1290d9b3d61776ad46cd9dadadc7a48b8275422b8b59f'
            'c992130532b5d79fd0f1e266865b757b827654acbed81a49e144abb077d32592c9f4e293afd705e07e6d130efaa575ab9a5ecb68da731696892aee89d4a4f09c'
            '3ba826eee6719a20447d50c63216c4ee86c6226395ddfa22c8723c76a2bcba05b9175b417ca36fc9435a4723de2daf852a558032b4e945ef4d124acc5c0d5495'
            '8817383d33a90324c8316a11c4a68ab1b173747dd1020818a9bc1cadc55d81fa1c2a0f4301d99264f093d8a3b8b148d7d2cb9679cb0d6710b2a4ffb7c2036ec2'
            '5e82be7f64c06c58d5fce3009d6e7a439f369ee41cd3f52352f02141cfc084e2b157481ee271dcfa40e36b2229c77c00483f514e89eaa3cbcb03493b36e6fb78'
            '44e07104f3b100e93cbca03ba69f98344d1ecd645163c5efc46053dd8433048181a49e625dc07f7af63d5fdf6c9689a011a1e9ebc7cc46edbdeb3870cff27a18'
            'c7de7e05f3300616dac58a5f8edd4b9e8753dcba89bf72ed2e644f9235d86bf219dd1f0279517d5242337c408ec6470bec98c5239e889a2a0ad9821aad266a71'
            '61b67c726806c2083acaaba905be9fa5fa2ec2c93f8095db0caff30e4e4f9f4998d6a92a59519fb136289d3161861261b4dcf3afdd090db729611a94ea6b5f68'
            'c72626586efa3c7a670ff7b03216eb9fb706e9f454b6171ac62f5e1bd1ce4ca6c388b92c5faa13fdb03a630e96bc77fd5c771dc52fa72c5e662a5f0ee216613f'
            'd2d02db7aa1c079aa66917aa3742a0439f3ed052ad6cb22cfa4defb842e3663552e99bd35b576609508061d08e16c889eea01cc93a0e48c3b5dfc7bddf8cbe6b'
            '82b0c3f2e5b9bce2c68a302b7fd22e78f9ff8d02b6db228d244b0e76dd4a08f8b32399db291b4da666d6f5867a72886f2b65c000c34adbdad758b0952a19badb'
            '2670222f4094a0d84a05a7bf9ca52c13f7de449c81eb32a5b567448d903faa2141448011c1f7b79fb902c4f96035b5215689806c4847ea181864f4c49a5ca4ac'
            '31aedcc43472cb2f9ab5375f85f1e160dc10a3dac6b23953732a7b68f7dca80f672fbc82495da1e6fab0ba38b6af8808176cf68fb42f23e5e4113fcae19b75b9'
            'e6bfb85ce0d87c44a312c0db0a8b4f49892946fffb907386e59c5492e7cf38496c2c17066cf0c1c49d9aa54a2c6e58e049831fd27903b365bb865d5edf1d60f2'
            '0700803d32119b78d3440ee7b1621c4c171aff4ec4702dccd505342f40032690d9080879286e0573f5b98dcdfb57ac692be352e236c3b9180ff313ae5aa88791'
            'a2c89a3f145c6f3c5022060eeec1dadec64d19b063309b968d3c24678b7fbc31a0a999694fbdfc10a6f4443152c90f3e3959286bd1f1c80151504587a8c8e921'
            '641ddf471cebe528a51098c8de19b32e87634e28e24fab413e83ff739b11e61e8b5a6c1aeb55c946b543a030f5bc62dac3c45cbf4d7f87680909fcba75fbadeb'
            '25585b5bd8630fdc445ac6e013ab58ce350b816dc3745c529e2ef928fdea1f2febd3dae4ea37bf13f51418e3f547d6bd63be68ca2ccf5b1df0a09e40bf97c2fc'
            '075a8ab8a84501c136d3ca62bcb0e625e8be72cca25964a3fe38342a36f5923d8368736481226d89f4fd5e13c68f80fba031ac63c0b85959d8a4e0dd434db559'
            '7388aa1a38fb6262c72528633c3278e3bc2fae5b64dbfe694bed6b84161897f1a9a8e7890f9500136b410d8ec4ba04090feee719a5687a4b1f2b2d7b6ccaf7cf'
            '471be466b4a215f2c9bbc47ca166c8ab02f3fbdaf46cd0c36f3e7bce9e651ff21d20adfa6b83f1d5c629cb7786e3e732e8f2d37f6a9727bdb8a60cf37728a05d'
            '3f98f662a1b9d845b3aa46090aeea1434e450ef2e2214bfdc9aecb9f3cadb2ae48132f1d113ed4895e69ffa07fbf926bd935b5c07786dd00eba3b9b233f5c714'
            '6d3b9fd6aa446c7a6d4daf6be7e64414c2620e5b9478a688d63bb29d95823816b07b95d7317685aade1ae4e9bd14c5c88731343448ce07115716b9ed768a756b'
            '3efbaebf4730e5473a625da713daed03f51805524e19c8630f2ad695280b8f32f3a7504244c0a52684fdcba6aea51b988efe24476d1d7d3889c3d61034d9ba82'
            '69d0bb53c87401e9c8fe03cc77d31d6cdd7a938d1c183c99a8ac2b2b78767b68470bff7756f01ca3c6cb28662be094290ae927119c265ac3dc949fae67aaf09d'
            'e4bd1e5ba893d72a525540d5d24e6a04d5baab2e5cf385c240e81c2fb83205cd374b1b73853302278e5200300b6b37d09c6b7cf62ea156601cf334a0b3afbad1'
            '124f0a9958ec789d1895dd38697ac08e2255b836112d3469f78bf0b39525248ee6858c3c4be1abe6d5de028edae82a7cf4f039abdad531abd282e1b18ef6a5be'
            '0312675cdc3570d09c997246f6d44ac953e9a5851ce143c9c7c3d373efdd091613a576f2a93c465c5dc228da9b0d32939b7f5f104121ee299d88c26d42d50fbf'
            'd4ab28820bd002beef508d94ee76a246bc0cebaed3a6cc5f4980b5efd4018c52c63ce9308d7e7b89cc19c73e3363ef295f73e07431247b522e4ea17915d32fe7'
            '29e4b99643b71fb0cba53c817e832db68c66e46812b608af11bca408f4eb1f1351fddb95e6a1e766d762fef3fe63aae6df914ad09a30c7c8c13ebc7336d6a075'
            '0236c3b49d2196c45166ee95cd9bf8a5af324da7c7b2dcea300e484a629b22884420efaeab70e48ef8871d03e2e0346efb7ff59c21ffa19f495a5310710c8357'
            'bf17d8244c9f9565f4a4e2c466a86d50c5793c8c4fa36ebc45f187014f2489c6e1ecea50517e8c1243eab60727a2d91e72372363a2769e6be24bb2878edace7d'
            'a380bc30f25236fdec9a40ca4bd8bb09e5414466c760d8201dc18b5edd0ef2c7f22c6f043c269304d8590b089d253488d56a5827d72d9f28b3dc9f05834b432c'
            '51b0273135b89a1fe9092a256c79d8e7c7166b9b6feadda64c911cb6d10fbf9ed1519b02565beff993f625291cc577a58f37aee98d78a5c62e14a8abf817d303'
            '4f2a8d0ad7ff123b4ca60f9a784f2fda63c748a9ca65fa5471d95acd03906d5004f04e85a8cd1eb150e4a299574172154879b337518cbe59f308b41e61a2c52f'
            'b09bcd5dfe3f3420ab8c9671284f56c82540a778e3e4e8febe727817e99135a78f38201595f28b65b3a487ddb6dd865853120c5ad05dd2a235fab2717869403f'
            '3beb085eaad3480d6cf8de53341fa05960aaf69b0f8ec6eec4a7c6de52914942ecafaeb8fde5754c4ad1f315b88502ec62a53fcf794a2e7af23296aafd44c184'
            'd6880f1b25675b0a21c0ff2dbdbe3467d324fc915f3cc3ea16599fce614ef0afc15f571c56fef5efe1ae03361446d986fbc1a6fed7538ac2e7b9325452e8a9fd'
            '4d9c4b11cbefccfe20047028ef17f7e5da801f8db4d74cf00dc99d0e16845b91418deba2920d0fd82d67eb796abe85a3bd70b4a688b276a39df7f6df8dd88b0d'
            '48d88ce416e0d9d2bf6924dc097c41e5b5a31bc293eacba832e407321c22c0be40508a88a89462dbee4d11df5e75b663143a29b26bc5e39039c7be741235b10e'
            '4b607014eeccff5b5a40c0cff3bb191443997767c0409048c450535b355ff4165722ca487c9d9e4da60b230d584efd1154bf687419cda8e80e2d4fe64c456b5f'
            'a11cf79ff958b7e1befb810778e5735a9bd74d6005348c622839daf3ba053654cd2b400974e8401d3689cc69574dd10812f35e23b810539bcbf176340bf07a49'
            '5f563c3429577faeada603c73f1abd8ac69df1fed85196fb2d6f5eac5b09697cec56b1d13ef4bfcfadb1ffdb4694efa090eae6445df2240b4ac9efd8abb37f5e'
            'df7b5de2528c4e07320c512bd9104c9a1ceb8c3f7a3fd5ac44c2fb91ab6c38f025fcad80e295d76c05c9fa5250556dddaf0fb93e278273110b38baec61d8d6bc'
            'a2448977b03fa63f053ba23f4233871526b7c7b96bef5a0c42d9cb420be49f1c647c6fa4c7d5cf38d15d2ad1d7c3d156a4c04185e68b369c93d0b679c4c88113'
            'c37567557751be44d037410841ce2722c3101f9b226adef4ceb34227e019acbc3a5e80e2abc994c3b2b7badae10bf70b7a5373a58c1a14f1f7909e2c67030635'
            'b4ef840dc8718cca4093e77c5e4cb721904bd4a4bfe7efa18b95f9dbe3c5bf353fe373944cc2774580947a8d0caa693b53cd1c0c21721abf7c25b7f29fa4a335'
            'ac53d9f225c17e0e7a143f339a4797dbb9b9435f479ffc3c23bc95f0fb1eca91f9240733733c749ca73782513f257f3a5aef1f1a7d1e5f54bd2b3e15c1e81267'
            'd0040cdcc3922c1249779d5eec7e43e50c24b2994746623cc0ab6bf7e28ebbbd0765d98da58803f71984cad3b5d7e9c333821d403b9a6de8d729dbda807f389d'
            '1aba4f146afa610e832da7fd89770be9391c69b814d060453897b8b34dc0df124c9b71db094e603bb5ae1d748694edd33faec5d0b317143571860544043f2ed2'
            'c949d815438af124eb7db084f4a4235552c8bed4673bb8cfd72337ed75a6e8b328e2cffce2b88fa6610ffe341abb98dd0eb0f058975f1e80c569b7d4b7d1f3c6'
            'dfa5cc001ddb432d433e69454a8896d6be9f6ce2d89e72349d871259ec8718fafb0d08031440559c18c4230a7ad0719b7f519f188a16adc9d9433d7cef403f7c'
            '2b4b8fddec1bcbe1e7eba0b50332cc61fc0b86b997a9a99928cde114e9998565d51974e30f4cebb9e88ed3696911f2170388dc074cdee7e1e1670dc2ed56b4c1'
            '73c5d5b3cea572f18a3acea6d4f6babf0e2645d852a4d6b52bb9166ebc8e5df3aaa2065aa9807ce1ec3cbed872602dc43102898d9f2d3f5805db36a83e126403'
            'eba8f2fedfea9f05c2eba78d79f289eaf3765a4673888b1d4510575fc286603948dc247f046f9890a5f53da19ccaed2d98a4ff630c25462b09aa44a812811769'
            'bf26f7b08c8053966f8c331b9166fc46c0a31b485e1413b4b91543786d9a32f0b769e2de29fe9818acd9c557a02caaa762a5e66ae5427513a9684b6fd6e92cf7'
            '9fa50f9e9310ef37de28b5c7980b68a4484d021c38d3d9b7d8923620c552b416c79dc4629d8f9341efc0ba3664e26509863aa3b4fe3a143c2cabdd735c26809e'
            '7033be59d159cdf0fd0a5c81cd32ec4f1164023c7542775869f879b1ba96456e7615ef524ad2e11326ac1a33f93a1515a38d7893d31d14a481bd833ef2d1d0bf'
            '9731c2e50b79fdf33313ea69759c5549f62fedfa8dab87eefa5dbffb96eef4513f295da14a129892f8a43be65bbaa999fa31e0cc81c170a46e7af8cc40f8f80d'
            '3e14efc290fcd1347aa0d43fb3878952a2cc259078ece550bf20050053563e164a0725eb85c2939bf3902f79aa769745d3dee41f6599f23d5a2baf6719b1ae1c'
            '01c9a6809715d082ec25687ce7e23307bf79d8cb254adaa1d278659445aac62c2a3ef543d9ca57c0743680a81b8e7b0a76c9331c409ab852c31e3735d15a8f55'
            '31f29415a17746165f7f3db0db6362354aa2e294e9b428a1b1c857f96d652dea6347f194603955753b86b62a1082f3e09ceab2c68d1d206c35ee1087911ab50a'
            'a917a06d9d680a1cbea2137614a5f753728671a40eb47c3bf810cbc7dc79c30f717fa97049781906becd3d96d4c096ac85b89b61f11244a5d1bbc7f4930f2292'
            'c8b16a5cdfb3f6e0bf740bf0a11cdcceda863d7891c6bd70c7009fe1917b88da6332f095c8604dce64961861b6c3e2686414036aaeaa15a239c87af4da81e424'
            '36511e17819ef6c8b756d6a4bc02eb81ce3d0fa5cf589db1e5614b15a7abb9d6d30b341e5159175c15d350b3e3c67b9482476ee86b298166949437c45448328f'
            '005c86d5016bd42842be29dece5a4c075eef6378b7c859361edc8f2d24998714188212a686f9daf1d03ee2708dea445694f1a53f279955aef62d4c078be7ec7e'
            '0c80bb4f2485c2b8500cdaa36c1875152755c16cadb5c480d2d5dc65233146ea07a1d221d9cce55b79d97859914df3e1cece3c2a7571a5d87e402987c7d106ba'
            'e6182a4b28b3c5fd8418c4b8d59776f73f88cae1ee8d36cc528b46b21eeb37066a1fbb0d4b3a98ae28063685beadbe2618df9164812217671616bb95c946960e'
            'e98b988cd9a6d5e1d1d3b6386e94dcab3932aa85bbd652e31749cd48cc48c6404aa38ec117c1c6250e51dc8cc9403ac8be9d4c5463d85fe784f5e6221b6298ea'
            '901bba5e6e0ffa395e07987c4b0c6a5c4ced90dc2f2e7a765310bb3ae9c14b72c3e9783b6b6d7d4543ba99d37e0ccac5df13722befe7281f24fd717b21af82fd'
            '6d5ea1d9074810adb029e70237627c56c2b69c1702474675dea02882a55f1c5ce40475c2bc652042f99ff37c3091e12f47f28b50adac8bb41b203014e40f7816'
            '42cdb5e17c0ac4911ed3f2e2df582df19d38db2914ed06870c6602359b08aa01ea017632b6f63f707d2ee968f9ad1c7d291327379f9e7e3301a0e148dfa17d45'
            'e7e38e72a04abbd72c60ccb20ed61eeb826c6260e209445194cb61317da5d823ae09ece95e2dd1c7267081ca42a58ac761141b2b47757cd05f8fddc77725d62a'
            'f54f5dfc3af2aa75de0dc81a85c63a63022c1cddbcad6d285c358a2ab64ec78338ea86927244c0f331d23c96f34465e2f6b328da6f8261b8f52fc458ec3092b3'
            '7b4d978e388177d7e1183db7507f756beae3eb05e14ebe6d3a3af876d123861b1954d83b9e0e7a043f6642cadd198ce2693a7edfc9272cac466e137a8d7b1e8f'
            '33d46693bd165b61cbfb05becad941f977c00d8b0e8013a95cc29792a5209f329c1321b4e2a67f045683393a96cc54720e79fe1d162d31cd69cd3e3f6c142a21')


# vim:set sw=2 et:
