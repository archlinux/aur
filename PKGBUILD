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
pkgver=153.2.0
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

sha512sums=('a8cd4784bb52ca89c0fe37404e894c044f6145c62e9fcdeffe621fde81ae4602078be575e26c90d83e5e47f26675d3ee897cd6a20027d09d4ba7d0e785ce39bc'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '2b06a2398e862fa4e61ee5e41971930a9c50a90fad4ee99231fa9f8d94d07e3f31a044d2a306a73e28367f654ad5568bf4a64ea42898a5001969022e3bc8e992'
            'da7ecd2cfb729a532126569eada73a54086e140fcfef7e99189988e2a06e7911bb7c1b4642b7b557053718dc9681ccaeb17a9880aaf6d6c637d1e2b385431c99'
            '3818e98bf76e994e0968f696537e0638a62b01b00344dbc16c1321966807b1950d161302683cb41ff256fee4753b2f9b5a87fb4250e1aa6bd941e2c44b69be36'
            '018948f56dba0ce0475bfb2d1261679edc18311e799f5787f1718d27c49ba554fb3af5f4d21b67eedd446a9df71cb8e722fac83e939f93838b4df2838e4a8470'
            '04a1f47c2e60ce90696a989a0b3445005ce1885f5606dc18bb6624ed1305b64c0b759ca08d9f670fdca373faa5bef7992e9c176ca66f64f121295a056eb17ff5'
            '6ac84bedaf32d80e2b0fc6031c2a425b9513902ce5ff230978ed4652d03af81257d2192d7459441fbc1abf6eeb092807c35ece421d59d843014acceedbedab21'
            '02e7391f297744a178e06ee20490006bc7d7414b0e5aafd14111c7b73de9daf4dd5b0c9dd82aefb53b7fc6a78b344063595386bcbcc4203071dac081f1c2297b'
            '6234c75dde6f3d170cd6c396667d0c916884b32897eb560ee32ebf0fa5014da8e32631aea2688a806821c68717f1afd101b34787a6190932452ad9f88e1e3f20'
            '57457129d69ec3fdd54af8036a66788671674f39d8786ac61918b105c42ce63c7840cbddc158457195bf91872090e1a401d03e2ed3a3818a3b6b58315f97aba6'
            '27ab89d17512d3691bb0452c69c62adcb2b5443fbc6cb85ed7db5cccb0f5770553a1202a100401b963d7408d32d28da83a0416316a12ed1261b4c457147093e3'
            '158894c647af3c2fd759b36afb12e2396afbfef88392e476758903ba2baf1247249c93b5303d6be3b59b1395ead69f6e60f4eac7199ae48ab84b385c82c04c09'
            '5fa84e098f8c5747ffbed0f8c91552a1a94e70250b21e473854986c318c5f0aa2afba4601b4898d5f219ab39fd82d8ab0690e85661fa1463da8f900c1b5514f5'
            '88eaad9d9c035224e6e548a1a3b7d72baaa1d099ae8b7c2025717b92ff86a646f39bfab04070060cb32a7df04961f38eb209aed453fb953022c44379581eb048'
            '664d695f712fb4a2cdd0e70a6d61b329a5725bebc3b88da8b812536f2ae276ac252968bf28e6a7eb2165fbefa4d58bea7f53bb7dd4f8e593bab5c253e5d29518'
            '0b6ea0845669fbacdca2e5f83b26a6fd199237467dc80fec4776c7af703ac7cafe0d4b561c82b12977eceba030daa9db8f1e4684df07aa4ef89be029469f14ce'
            '2be7a152498c50ea8bf2aeb8c93dbf4c05d5e593ee2cf000368e89829e060bf8224205a22c4cbe8350f775cbec4ce7f15ba131c98faad68a2dd22aae16d52fa1'
            'b0e323e68386212ec50c93b0ea8354c5a6bdf1bbbff5050a2e5cea0b6bdb79f85147a725d78f37db1d6916578a31b8eec476b154739153fe45b7c5772de95fa5'
            '8687ed76c8a9ea5c2a54cc36633878f8885a215f94a7218a54f38d14688fe3480331a8d18897011e52f967791f6a75f0576fd77f3f47d8d739af676470309dc4'
            '2afbe5a8f2725c67778798dcb34a819b3b19dfc6c0e7f6abe976541f61a1449c1027d243386702199d76a80b519d5667a1c06746cb94598bb1e672eb7ae01224'
            'a2f3df4b98fbbc69b7f14beea6a852534b7e88acf7635e180303223ea065446529ebcd69295471ced0df22bfc95eb478e1a667b2d5c57187856839c49a44a85d'
            '9904c47b07b3031b8bf56ad8fcd89f98fe1c00285a1c1d6e5620639980f56ec3258256b8b844f99aeda581cce657eea4d8664c5ecd6a2919ed448fe1d1e0e853'
            '31da75d0e17b5f4e3531b5a880431968f937680ada96016c15b489d55514e306b6498e5bf4e047749776265ccdb770b65e14b0cc84b05a439c11fe63263fba35'
            'e1de693231bd5586f4e89818eb92b5f32914b784cf67e759f4b2bda8f075139f01a718f0e67eb276bb6d8321cd023a0a6676a7d3e92809bde3619b20a2608efd'
            '998c39c64d2a3774e0037715786625b8842f3ab0a274691f63780818250a36ede54fb925083f81d02d3e1c3577dbaa4ccf63854970ac329a2642fb5cbe87c259'
            'e75faad97f373a08d62b2047cdc490c08165e13ce8a123cb1fa8fd3fa31c0766dbe1e0d79e922756336b44cca48496256e5e1b7da4c58ab6d8edd9b896c86a99'
            '8bc57a47b017af75d1985236ad1743d1838a02168d3bc895a1d40d37c631b6715a62fd1bb105d085e7b708e7ace075a24cd7743bef6414245efbc8d038671326'
            'a9f89994a8781004d7f228789c64bdb1730e9c5678f2aa6f8d9ff3b66954a39027c6e790093a990c83713497f0baee4ee4f95cc19f8ebc578348f09b12006073'
            '582b7ff29fef7da621535adfc7a2dd9700cb48384ee2386c9f50cd1a343d7bb0d2331f1f378e0d025154fbc8297ea398e9b3b6051f4f145e194354a69ea0fe74'
            '0f185a954948fb2505ab6ea0c9471b0bc7f90263c74ff724e3286ebeeebd8c84f2d0b94da06e8114190b4961311030c1a2ca3d02f6e120326f2148844da73cac'
            'c62c98af94f643d8f52ac9faba49044229ca2ed2b1a70f42b3483f2f99a7910b2d38fadba7308e0270259876d5d1403b5e44530dfad67a35a2261014a9cb27a4'
            '2713c4cb959e7202fe6c2118e28390290cfd227eacf1d1d54f084d51d5a46a08f4a4b334a2728e8e2897e064d85c561421c36677a704e50d085dee33e2d2e3fa'
            '4b4d60a4556f3434474b3e66481a6da9085ef2b2c08750484c6be1abb68c74e9bf26f147144ab622df2acfcdb6eba0bfce5dd24be21a3b9335b39250dd88cbe1'
            'cc85e61a8f8c9ac1d3bc2ad2093e3f9cd0b4a8c4b73e62481daab6651302aed41c92d6417b4d0910f611527281d3db80d366a272794ce49681e4c3aff5214d80'
            '9e3f549843a572c5d0d2d431d58f78e6dfa4e81f77b32f215f30f734e53205370920da1905d52d023f70f665eced6ce3e9c0ca3fdf1fc5e8d448650a91416222'
            '458ee325832478b6d9bb38d210c16b61e8c0b0b84b46b5742bbeea9e1441c0d5a019243607d1066f1f1530454c2fe8f6f50a8fefd1db66a983bb55c289f1f22a'
            '3e8d3b8056f3af2f48f7a862313e6a5e605019c320b9eed05dbac264fcd06624b265fa6b4805975b6eb2ba3d0ddac43c28c81a518727cef38bb8f07af9363b5c'
            '21fe07e41cde2e032199ba77e6a5d4a4b4267e2fc412c7381dc7e6d505c0fc7fd4d4c85cd4296db3da406d478834d844e1b247dc0bae4060e67ff93943e52c11'
            '209bc1deaa1a9021809ebe95e72d0d21445887d1c150adff750f36dd3eee4a85e949d2ab79ab98c7ad3ce787f20ef7ca79788c876e272f1152060fc03c8a1c45'
            'a3736221db1734b7571d7a0090ccb70876a208d6d72dd8e0b0039f2c87772795c14d7631c54c7b3d59a24e44e330f234cb81ce3080fefd4925cb3793b6e37ee2'
            '96570d4961d313422a44e36332e93efc0a83cb6155c5ebde89b1221fba3c766d13f371087a32bfc4ddccb0804492f626154041fb6d8a854c2f4a445b0dcb8261'
            '94f3f766b4f64e36a39154c526fe5156187b35683ea34ab9830b985a59c5fc2172674e77501ad82a1fa4aa87d7e7408c365f218eacf2dc2de6fc5d89c2595521'
            '16e9f726187bcf2831be355125851705fb7482ad6502a72a1594b82863c2affc032966970900c342afb8dcc950a05f4afbf587677e76e3681dbf21ba13678d41'
            'd33738e5aac2b474e13311c2f78a256e95aa5489848fb59879e20dccaf89a76c99f8dcd99399feaefe4463109b25c0fd6ebb826b1dd7b69bafb1cb5f508b399f'
            'fc4bc5d0e47ad971ef4aede12e2bc32d3e1d760b3c104a9f6976d77ae42264a70013b654f16dad4a89f076f3ec2ed529eb5a8aa85ca9c7f82115b5893acce5ca'
            'ecb078686ac254d39673f8a78586630ca726042209602bdac957a134103e3ca9e9adfeed84aaefbf801fdedc9ef542d13462483708b45852bffd84e222c41921'
            '66f9b7c33b7081e51e6b3a1a579e3602a192e16ec6ebcab1ba79655024096b2678e96bc1ebe29fe8af0d441c815e9b1b2e0a2327bd7f2d3923ece54fb394af6a'
            '9fae76c8f364557a48b5975ad159c5b737d87b12f908e1ab985e8cebfbc841c3eba65bc0d89967e95fb5b3ed14a51f391a9befe6b479c63d18734ffa916244f8'
            '56113a07a2c06de715150b2f5ffab9452e53ef0cf63bb99101637e5e62d946becb20fa0f1636347f564d26e43fd2e7bebeec037ddb13b1b26f3a266b991e2e01'
            'a2ed9c38cfacc0d0aad382323994ace498fbc5eeb4491e4e39ccb8eb26331117270dde7b146783a688da675b5b72e1e918cbf5420e140e6a8c208065aea91d4f'
            '9ef91e9eccfe4d2da6d210526887644032d6be0a87ad5efe7c1e4eb9231ca22196f083c61ea8d3302d416e7b788af690b14430118946e7a0f04d9f17ad98536e'
            'a70e4339bc88dc07de83ea3d17ec3417da0f282bc2de2a6e715873e666aa8108db30a4bd6d001144394c354015ee196de53e912c45a823422a5061006e9003f7'
            'c360837b60b09c5481e9a594a6634057a3844803f7f05989201ee48de7ff0a6caefde9b2b4f575005e7174283620d013974617c73da3d54388439b315c856929'
            '681f3f2400d8c1473ed195f6e2a0ee2304026801ac3349511e400ae0af4c5b4f312df05064817f1b746594c6c3f75af7ffb38aaac21f94c458df7fc523c0eb4e'
            '3cf581d7887fda26791ad1916cba40c23edf5cf358d33d6bea60a310cf9f48110bb84185b9b84f9b7651355c436d942307c191ad25af695a934060b28cd35682'
            'ec0bb742702011374eaf245b0fb1f6ce9697bc968baec4baac913660ea8dd827f0f5e57bac8720e3caac18f4a67a014dee69548ae3b7bd4755ec8ec35a9e0248'
            'ec82cb8e0c65473bb0f10353425569c602d4f12b03291eb7bfe5fe9515680d15a02cc5b4b71c260a83fa81cd7c11ec28d3dd288582abd5c26f970668001e42b1'
            'b56c07f6c4acf932860aad46a2042e746d14a38230eaba9b52ea5edc998296788d11b8ad8bb479fec45b10356740938e5bbf087ad129b3c6fd0ca5daed7b8de4'
            '32063effeb1347a54713b48aba86a49193755ac5e6f094a3c85adb5d0ac5628aedd54a572a842ee84eef1d9ae8f5915417d3255a20640b84aa67acf744d56e5f'
            'd0c57be007293997f6448961653a4367857b08216496c4ac04204a6fff6acb89dd814b7b3ca13af34b38f0a70062665262201d40e1fed184f6440d19e4edefb3'
            'b0d7c87570fe6011d786f7c13f340d80390fd78a8a8964242b17c4d804a16a04f632074c425ac8f007d90d376d85ce1e784e8d748e5d33ffb7234c4ad0a414f0'
            '349b5827852f1287a2be21b517960d15a6469935b6ecc6a9fe78d3c544f9d88e68a26cae6ae3f4dbb0ab65687696381cad413ce5087f0f7b3a8401607bd347a8'
            '04511957d6a8ca10954d6171477a1ff340c7e10be39b6b77f337a64270d4eb355b6034da370a986f412b1db071e9e9c72ff7f515d56b05d15a1120b8d5c3175a'
            'fc7560cfc83f14919f6b0e009706508985d186ab3493b9229d01f07bf63be55b93bee98ec096f6652bf5993cc1633bc52f5b3545d8002441b36b0a3cc1d4f644'
            'b52470d57178b0ad78fb913d4355e82c1054ce6e726185a890ce7299a13d6a0b9f4f7d215e13961af0ad882ac81abb6859b556027f120f2821a794bd5c12ef71'
            'e133c3661b7883425caa8e611b0171bc813c91f2a328faeed7ef75ac2116c27803f9e80f06468d76514d9839b3783b28524c615886a9578fcdfd07b8a97f6549'
            '089c638caffb4dd7e6e0f2750bf5286f0e8b8d7a1ccd4764b46c99745b22b62f240d53fa1dca3903b29c77c213e5eb51c8bd0bcea29ebe64c5083604162220e0'
            '1a481ded3df87c23eef5aa756d4330a26e959ed0478d532958509e3b88ba2f0fa189185f897aaec118a75ebd570e6fd3c86a33969e760d26b043803e7d8da0c5'
            'c5a5e5d0e83acdf987a052bce2e3d4ce4bc9e650a67389c7fdac90a499463292bcd4a8e609dd129ccb03cc96c90f0495bd6a4a3dc5345ae563af57de050b38d4'
            '1dded90f6808718e370db803e95250f18c9c198ecabbe0f0b34563bc1777abe96f9118873cf31975815b53e15e6b80be1e7fa81367c8735a51036233cdf1b1db'
            '1f26d04c1b08d0e327697cc98c465be051135195a26358a50f424aaf4ced0028908ee1c7c99c1964aa7f20c20ffafaa2a7d16adb710d40101ddbc66839134f85'
            'fcf2c24754c134780c9e8032607fa10916127ddae02c94d11f7b649ff17cb3f2f09f9f9e14b2afb44d8fafbbc64f48d69ec5b6960ea606d674d54ffeb8483c4b'
            'dcb7cd96fe5c7fe74328806ce00423842ec36adea2163cfee84c4ccfaffa1bee88f02b3bac12e70d02b55f3bb75531933d9f675e91db2201c0f5ac6d6992345e'
            '6fb2a48d735e7ee139fb730b98bc69a347206ec82e455f304d31ef3290841c1d0fe793c2bf0240229b88972d6b3c7c5797dc6d021c2ae519b8a688d413398b0c'
            'b2ac0a67702f1c4e5b1d054acf38ef30b6fd44ec986b6f388036c18e445154b7a63958a2f30153aaf95c23138b105eb7a9470dc57399f0671562f46e0d91be7e'
            '09d646f4d5e9b590d82bea273143711ce51bfb92ad98c2f550032a4452139c90e32b01bb30a54a14bc262ada9c2ddafe53dccf3f44ed66363ef6ddeb5b5e688d'
            '4b326e0cb2a246d5b7f20bf07f342026c7f6133c2dc2cef3157cee0cef533bcb3271ebfe45e94067b79f92d946bb1e7eaed0df7e0e659fc53efecf8e0d9a1c6c'
            '337d3356b0d5af9493e860fbc6b9c3aced3fd809e8aaf50140f7f81b670e787153293c45375288b093dc7e402701a113d33470f631dfb5cb5d2b7052d0ac487e'
            '59d8450164f3946fa1a9eec397d8b7babb858ab0e44f1169fb093a049f51a80c530c9fecbb25749b6004b5e1fa88c66d59a7012a1519e84a832eb40d06d3dc77'
            '1c30a486a6dfa580d8e07158ac80afeb502873032dc6967e17c3f5d7c9fc9553beb078a071ee438e889980aff3d4add863612961bc4923d610e0f38ae693e4d8'
            '509fc44bdfb4afefc398fe6612187d8d23a42f210cbf1ac44a05359e506e17ba341b5172f216119fab3d758720f6e879f3efba5e9050eb94c4c76ba53a3e020b'
            '5963aaed13b06942c2ea65fff0b5ad4b80409ea69d4818a8b67b9735fe43de4f27e41017478d7ea52923f0dd66d4c05a08bb5c7e3a9f67b8c06e1cae99013af6'
            '14882d3038a9d8b920ec784a85ca8a45230de173d82c6a767021b3139f27ff1e65c956f5ab5aa4d7e64d1eb548bceb51724d59d713200c8478653419184dca05'
            '74cecc5e2cc59b94b1f8a2be301090cea28f1385daee60eed2a7934725e601cd4ff4ca8812b5ca43a092326aba68524dc501c54466f258b38249bf2f0362e62f'
            '95ef70de142af9b6ab9ea1c6d569bfc3e2b4a08dd9629a93a11a630ef16a91d854f448b87101bc900df11aae0c8e5cdb54ecac395c38b1242a43344b9ed18397'
            '349a105bb8ffc97d5e7cae34000f09dae506820c45dc894212272af067e22903cc3ba1c8931132c17755068595ecd43a0460d5ccb5744c9fcc7eaa73e1f5a77d'
            'f24dcc1eac95ac984425d2d269810fb7cca86b8c388adac16635227e27071cbe7f40c11572926b8734c710a3c383dcba23ee6ac47eee29760840c88bddef426b'
            '49c4800b401cc950858ae41ca09610f4c4339a1ff14624639647c31375f2c97c2f8d325a2d950ed0e8652c33aea541ba71d213ce430dfaa087df513e05ce488d'
            'c7aa745072d6982c13676bfcad62b537f8ef6e3c624817088151622ebc25df4fecabeb5f6f3a82d8dd7994fb7cb668d2520c9f6a8085b44c68ccebfd3775c3ae'
            '9f20a30c3eb5b116177f326701dc869462e0b52d60eef9c8b209c9440992e61e32893e7d828820db27541c65f104a645458513eeaeb6fbeff77fdb40ba127437'
            'bfac861cc5c3cc3e64841863163cd2b0244a7a29c74a7e86fc415bbf772f69a7df02bcf097202cadb8e29d87b51544aa38014fe23e4d7815038f7dba71587ee2'
            'e61e1bc7a01433c28f664f9e78242b10b766241b1ad6081c704178752387b895a4bae936a7df0be862586088bf2969ee1ee826e3e67e2660bd9c6349de48961c'
            'd40151b33ab41c74117951101337dc02fa8ae628a7dbb5f2895af912f1bdb83f83472d593e75fdd724506145dfe07d4119c888093cbd6b165f9f4b00797017cc'
            '3eff81973cac86ccad789e2556a8ab9e9e38e470c73a64be8c02e2116aece652b42a35d8ab5691f3fa1379313b926febb2d13385793c3a693223ca148a62bbae'
            '93ad5ef9615fee19961a71e905447a993d16392e82db0f34374ef7800d495d0767b6955f9249858075bf13bb51940cb963bfc00a9b3c80d29fadc7a41991676a'
            'aecccf13b2b9e02bd88dfc303b45ccc0402601eeddb230c376d5c037ccaa4ac447cb3f4ebddf0936f7d412ec804c1ab4f908d3ac76e916de36e34458d7eb9ef5'
            '3ad49a67fefb3ad2d204adb71f8a280df8742cf32efd507e026810fa17c22099796f6c82ed487e7fcb55f297c6aa99c1ddf7f621a2b3e9081aea3ae85921cf3a'
            'a29d363ce4134fc319a2d50459f8548d1adf93d537e9e792286bc2011736fd93740458bee81a80db0f6977c5b40491c05f43817955fc05ecb5b33f0ddbcb6a4f'
            '4da9300c3cba6234b82fd7f7a565cc0471f5f4167665022037ae847cce6a69bc4bb6358331774279e03bab5c8fafcb533d6f4862bf6e424c4e5a4ece8e7df4b9')


# vim:set sw=2 et:
