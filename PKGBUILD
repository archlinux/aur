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
pkgver=153.7.0
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

sha512sums=('40eaa7892b910d1b50f6eb534a58e2c191067af160b33691c7c6925b81217f376d39da8ef5137720cf16a6d88b8de951ac986cfb71cfaddc9dd067ee72dca0d3'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '2b06a2398e862fa4e61ee5e41971930a9c50a90fad4ee99231fa9f8d94d07e3f31a044d2a306a73e28367f654ad5568bf4a64ea42898a5001969022e3bc8e992'
            '4d901d68841ff99f39aa3e8820b0e8202bf45b1873d29775d71b6351e7041178db3abe30899e88ecdf2796c36cc7edf3ae6cccea0e62d3f69db65663375e01a4'
            '442293fa65d33a83b2120b0e7fc0a020d55b4a736884a3bba7911faf69175cd87f19b9431da6ef189be33b2eaefab522e4b029236c639065f0242e25d916a412'
            'cabe46ae5f93e9825d32ec49b13d0a159877de66c671dbd8c2ebf86e2c55c632c7bafe8459aaa9f9384608db1aabf786ce0435398b518fb94050c59724733148'
            'b7a627eb32ba575a74fd33f4ec9c3a783373df3bf8c75bb07bc35fea61f77d13ae1334a424634764114b26fd7fd7e974c1732e12ac69f0d880e37a5bbd83bed0'
            'aadba9bc47b1d41a55a2c6a28e735fa3174ab24dbed61a557f87f2d9780f9e815010c7bb1ae50b0096120a7d2e839cde4670b382b427f4f54125dfa7ba5fda4e'
            '71c27ad1a590651402b6d1b33bb08944e70300767856e1a7f98b12b9edd7098469b84c5093972db383461db865a35153e900e3e937e75a454b451a43264f97a2'
            '293f18c523a6cb580aae75fae81fab7388eba0db52ab5aa59da7bc127c7cc43f0c5c9f80d1378cb971a4d512af1e65b5a32842e0cf94a637fa87a329cf37758b'
            '81ffe2856f86cb2ecb42fc76e164b4d6d20b41245f8f35d6d3c5c5085ec6f1a1f95bbd7ce8bc8f1dd58fe1237b6d198b0248b5f1fda2c7a34727e08657e5f850'
            'd787c5043521fb3ed2765ab8ce851eee6c6255a5f235239910713dbc0a8ecd07ea2cd1735ba9ebdf226987e5aab6125979a316c5f75f777cdf4419ae17f6ee18'
            '66d09af006438c85d0c96b42a8047d125e41a5a1bc72c94b7472b1918658d177e71f7b25a68840030aa3e24c56a4abb94d35fce9429ae07959453413a90c60e9'
            '48d65bc4a44a949453c87711543a66cb7fb6d9e7f63c8a3dc08f63dacf002326d6846851d97a0855a2555cea1b3a7748ae45d5fe9da8c7d20b448c81717ae4d3'
            '81b2c56cf08bb69d3853d38835bd2f609a7e042d096664fa5c960c037afe2de329b418612bf76bfd0e469ae7d66445332ef8980be6c09fac55ed6382cc903c02'
            '131b04e43496e717743149c078a4e4d497839ab30e932062bab94b45bae03e62593531584e2d8c4de785816d87c50f9c269b212d210735ae9aaf0bd76807737b'
            'bafc49db72afd0a80d0e445751e379253373b08df11ae36053d9c3880ff7a082b9e2ecb357ab606f121be7d387a389819ba037972ee8896cbf8485738195ed26'
            '60e33a071a721c324ab5853050dc9c695e68b9267d01b42897e39f019a8e0a04430b371ab2ab6d4413842c7c2dd2691a5947a41acd665b8e024dd86780723c79'
            '13b743ad458ff3e644f7818851ee489e636b0fc8355f4fccecf84fb83850cee029df053863cde1e3ca40da49a3132af567fe3e2df8f58de7b1fbe86999f28796'
            '0af1dd2ac8d4dab35789e5247f60b860be8f409aa3fd144db250576b519e5aa08be59d8e5e6773258dc41f43f06ddb581ac1acb4e6a588be63465f8caa79003e'
            '91039ce0ab8bcf82a8d845b2ac6745edd1ef598caab8fa75519a6ec9209f6547c57745e77892aea108ed40b1aec9240e04315fe854404a167b53a247a88a9cd1'
            '3d0520697bfead2c598b9ddbbe0ba2f8a0e32b5f8b40bccf07478e0cc1450da50d96757cbb8ad77055308e4b89fab6a032bd081aac8a000b36d0f8d4e9c4ba90'
            '506e7a61f29b0b4460768705ee4214c10bc25edd7cc4a3c6b37d95c5f117877a528f4e5577a4b666285001434e3494568b84dd257df6a890a0693d7866adc85a'
            '92c7bf82528e7c1f7dc2c395ef181661b1794da70a3a39a7cfe3095258d8083cc84c0ca43445898fb23f5efcdc1a4c397e84ddad739840d5b2a08ba85ad4eb1d'
            '176aabe9c3f9d5ad1f7a857d5e3b1f970c4fecb9631b3e3d8bd4662692030f35a4126ee41054d5baba0e6dc85c4a1e220646c519c543e70ba1d81407f77cccd3'
            '13e945a3a9d1a2d40276380b9b4a0e2ad0401664cde70a8af66e669227eb79a4f333e08ab47c10e7ce42b986541ee7349dea04f57b8b5bc98fedf90efd35276f'
            'fdd15c6aba1ad2ac87ea86227ae46e2fc198f152f182456d301e4f47a467fb3ba38abd5d5a30af9c46b33a6bddc0b58deeaac1d56c5ff042aa83771f06dd58e6'
            '7d4d851ef65150c704bd3d1c62a119d234efb7b262fbaf3c64c163cab6a07c4f021a245b76c9a7af132792c7bed88118655d5ebcff9234715450fb88ec55250c'
            '097d61523bb2a6221db9827cf1a2c126b62e6655e99685a537b7e151aef52fb2f1cb273d970762a91e250540203c7ed01ede50d4d62d8bd9044bc8bf485aa59e'
            '48a564e467ec57618361d0e6133f71de39eac52b0e8e3dd9563ae206076f1efd8249cd5ec0b13c66f764985df98928ccb5e35b78202e5e282f13e8bcc1c88920'
            '88170bfff80fa750627d0f4763f324d12f72e24a22873cfe5f2c1e72354d32b69501b09c547ab806420d8d3d2191f575baff27727e62ed33981da58fac2e85ff'
            '15d8a1fe7a280988467f8aefa011a044a3b25959a08ac502ff5e4bae80712d211ca88ac924424e97c095ce8f9f918787585ce12c6c9a7120c500d50a07e208b9'
            '3f21ba9a2eb041c75569dfa33f503cc3dfef0602831949ab0c104cb29342477ad1b8883349474f57d10b6cba0ddaa6d9ea2e86f4b88da8699d9ab69e3a429956'
            '1d466c5f9d1ae97070a04689e19e77fa9a0b7db457ed3656618d5a4838060e34ef83cdacd1317d457fb920808c3a5505b7d36684d708328e1fed4a3932943cef'
            '605f219d6e82e86d5f00efa9ca7ff193f45acc728ca8ac7f4d149a70566628b099a98e29aecf0abdf9582b545fd144e0cd480846734e78c28d9828f98b7db38e'
            '9aadac9d45c3b29ac610fcada9c5366d0d4313befd23425dd2c212e53eea3584d7b7ead02e3fe563a1b1d2c134b018e91e4b94277334c1e73245c5558d1f6802'
            '759ed51158dc10bfe4adba1e895bd1c8183f71723e8fd5e6f2228986aaadcb75634e5f40b28f23b7541a182eb85810b412be69876c1010ac84b3a658239d90dc'
            'aff48da3709620c212d62af781b48fb615499123b5084bb2bb8eb5dd712eb87005bcf41fa1bafc5aaa7358c61425a6ec155d6c93e8831346faa2b298dcd53218'
            '788ef2197150fd0e8ca98f579da5b4893056eb91ddf72486333e1973b45560fce9838951c3e50c8489eeedbefa9b137ad30c903aac0a446cb4479750f73241a4'
            '5fbd66ee62cce3552b8e839cdf867520d0937ff2228621e707aef0e4cfc457c2df1aba5b7b38111b08a4547a1634e2319bee58cdb326ff3e979f2628601b942b'
            '6556e40deb27ccb796d6fc4393116cc1156449140c26aaffcb137a1d935d2f2b1909148830a15f02f1ad2816ca4c9d075d136ae0e1020e468b86d824e8939b34'
            '44dd64aaad705aaffab38b7eceae78af132c9efe058f76549746c9dd29f64f25038ffb31f269d70ba488ac9f0b0e0e584182088529606ca50f0346fa33b46899'
            '69188bf327318321e676b1a7d2fe2a82606191bcafda900b481f4e5bc0d2049dd8d2efc72a748d8dd1244743a765c9a01e11b9ef66c595a05b98b08005bb1746'
            'b334d1cd289a5c5dc31ae8f90df09b0d76fa3e941e39eefff69b9461213554b6a6715942e332186dfd243f2eb5ee2c751a7c6bd38481485a6720a8b841bd1f20'
            'e18549d42b06ec87e403ebcf6c3d170928a6b2e96667a4bf975c301f68c64ef201029907a9c70f1d91a227dccc0f8efdf7b315e504352a8a512950d4820ad728'
            'd7dcc33ccb3da70cec4de291500882dbede372caf218672b7dbf7787eebdb9f3820d28c2e19564eacbb883b3a4b7332a249f3d8dfb00ec62f183e0a21dca4d4b'
            'b9dd142b9d578e10577d86be2dc69de231b1288c56e532f9671b13877ddbd8cd9e05c36e4b1b365ac10b007f9acffaae46857f420c0a7d4323fe2091c9186408'
            '579d5f210fa1b07d7964edba2aae7d5f4142c05172633b6354db27adf1edc8c440cf15e848fb7ef7561b620be40f5c64e6628d9583d1ce002b1c9ba429e8371a'
            'a3850bf6b5c14826209b2c1a53f390d5a97946091120b4657ebd51e5fdc22109d3f107ae36f787329d42b2aa4e4f7c664d1f2fb6f524ec7f41cfb30cf057983d'
            'e1c090ebff45e834f32a4d4a3c1ed517f682049bbdc31f55b88ef7d6c52021d703e2e391bd26d1d84ca8b954fdfe40a41e822a55830c40577da898703ee2026b'
            '195cbfd8854388f3e5a2d5d174c70752f1abbbfab9e0f818dcea187aeaa05256cf28dae26844d109c3a2d1c86fff525a24670b4039a8325c5ecd7c0c113e0e5d'
            'cba1e98f8ffc68c7644115c920778b70b1594b10dd786f5c460106bbff0e17104610eb793a23634a339e78dc628bb626544327bbf1c46bb0d2125b40a2ad70f4'
            '86809101fe521491ef6c87c9176da050aa005a54a5ebea2f038b3327c2070c10fe4eab6b5fda6c72b3cfca4f8cfe69f0ec2275dea1d75fbcbffbd6f9b52edf56'
            'de798327a5c13a50479e56bb0a4a7a36399be729d1741f57c99b1e550e0867d75089680db080b3515b629fd9f199d64d02152aab876b171dc917b609230c8fac'
            'b56150167c1428f7bdcb54097ee0d291925e3a26c16f478d61c40bb1b88c7f59aca52b8497ed7aa1e1c06a8effa6ecafe2d15ffc2ed208d758525bc00c86d225'
            '636fe3f75a278701e52b19a6dbaf6c86766808f47626edd3deb6dec3eb5e775ff3fb06d92092ab8cc566ef528f0980f8614e8548714d27919d654633c3237aa5'
            'a1f3c81f56ddb887093ef50b33487f475853a8e9c382620cbd57bfbea7ded84e3177b34b2a83d2556da68950324ae48dc2e828df10dc3c48f17c648a2090f789'
            'ac2d15057056a6abe566c04c68e43bc915e5e100b2683af4f44b25880786a20e16f620f83635f514155f4eb57f0245524a8e265fd592feafec4d680d44b317e2'
            '2f81d894ea961d7203065899921b781bbdee42baeb8cfa62307d958cadb8106c5b92469aff99244082626c47fc84b313ee6191343594fd2dbae9e308cd07341c'
            'c1ffb152b93e2bb7267c696cd50deaba384333f1faafc36d1d9cf6e544f7a1d303b5ed4527a94f1ea982a07534c06bc2a9a44d6f499f75f015c9327ac4b3f36e'
            '3d671261140345d00196567a132b253840fa97e87cc058ce7fe39c73bed558261bdea48ab2390f290ef3a42d904a8cf6bacf09c886a9822977384770c9b1d81e'
            '71b78ab1e6e44a9f86884aed52b0242be807e9732cc09ec127ab75d5838b024f6cbb58c65c75ad41d9620a8ac54a8f07453e0c0fc64bd71ffce095ddfb0f9874'
            '75eed3c8f466069ec24b6f96cb3e8236b07846a5b25147ac53e883adf02bd41c9ab9b528fc0c98a5a91b0e069384c2502c703d2579a0b98faaaba06ed25c2a27'
            '8cd4769e963ea16b630cc7b31cbf2797151034e64c310d08c4ebe5c3757f2e3ee62e2f864c31ea09307071ff2afd7e432ded4da5b66791a96ddb795827ae17f8'
            '2c74e19d9c683d7de81a6579c8796b1d6e51a405436eabfc0247fc050c3a035ee12102600ce357241d174189574378cfc277812d5c764bfe65b501647d75b5ac'
            '0a1c5aa623398507e246cab4ae68772c84b696c3db0534a525812ed53af4ce0f575303ab80d987123b681e610dedcf1364466fa8fd7ac18eac8be6bf2d17293f'
            'd13289bae1373d53d0e381d481486dbf0a50614fa71ce79f49c1ab7f25e73a6e531007ff195d987301f0eb4954a185a9850bbe4bfc57eee400fd86f0f115d1d5'
            '6121a85d245d830b019d7899f7c3c94fad56471f2eaf2e1c46c67e50c21212e8620e54bbe1d159cdab07c94c2b477f54d1edbee38b456f3104e7abc6e30253c8'
            '21f49eb27eff0598c37e499d7b179d9242eb52abaef4316009efe0b431a71275a96aa03c3d873890cd695af9b3851f516e4c5952656f2e9ea258312e239c57b4'
            'a72d11380460fc1d7486971d68c09cd62f701a5730733c7b591c47d77be5b99c3b4bbdf7ffbeaab6a13d6a11fde59bf58bc32f4012e1b97c59cf9a4f862bea49'
            'e8d05a0ed783cc9617f70ad3cc32176d816ce1077d5167d08aed082999313129628ebb8df46aed509dde84266d09abf632b9f1172c12d734b654fee508a3a85d'
            '45a198c27330eb12a9f0a78317f98333e2a47af62ae195e444e451019c03b7763d18d25df60d2e3a16cb4b502580f5ee2c89842f32d881c62d21d046812bf274'
            'eb3289848a074e88d34b9c68512a1a48939730dc56da0fdd371431a806630180007c70b4e2be5343dbc681180fbce265eb084ce0801eaa3913dcd19d6a684341'
            '6a3faeaa7c2f650d172330c675cd9667151ee1b9cf781cf4c2eb110696925923ba535e071c226b89ab790676bfcfca91803ab0d21fa28332322df0b85c6a5213'
            '6ecfce5b3e37983627db977f149c307c4d9ed583abc146476457ffe85f651ffcb1bb77e3c467876653e6fdf30c74d9ff59a4f11f26ba489ecf1734597981d118'
            'a71a966b348e345102a97d9c7caebfd9fff481f8ecd0e9485bf2b40c6c5f12191db08e367a1f18f85a7cbfccd6adba405a4e64ec7ecf49fe945aa45d42c5e9b4'
            'b627808a7582d29e98f4f0901af79447fabc72cf63831584894b64f8dcf7fd8ca6d6ee8f3b8af0e18026b61f8c8d144eeb6a74282c3eafb787ba3f67d62e1ab6'
            'a6e2feac0e8e7752d8cf85f281c837bbad86c95e6a177f1b90f26cc31e77c5fe71035720017449dd6992ea0a8773a5a64c0065952ebf6bbda81c37780d3d0b50'
            '2d54e863d4aa551e9ed3d49a251b0c6ca9cca34b5d96e643a64716882c35ca1b2e1d2f5a53b3f3427f367e69638f5523da7e5214a517fa163dae2d92ad1eedf7'
            'b9860afdb7cdd3c65b92644fbffd335e8ba2b07f8ae033346debcc648e41202ea4062f5e5bfa235ceef3d7c88290991214aac078423e7cfdbdf3ea45e114a83a'
            '91d6a337223cc74cac788d74a03fdbd6007b79b08f8fa8bea9bb7535a71c320bac8b455b41830ebfc1aa57a8fa70674321569d8577cfc2c0548d2f63255f4447'
            '34b395c7ff703ca04da970c82f01ded2be3eceb17973498f8594ed26d1a951b6bca76743c5cf6eca038179eef1595f1e29b235d45fd57ab0d935777acbd4b724'
            '653977c9ef545dda9043d8215e65014e8f59f34b3690c213509550721ce803ed103fccca3fda4c85200080feccd8e2ca4f37bd03a6d7f3b64028f3e99f6da362'
            'cda82247eb67729f59e8384f06ac6e18027876e91a862245613f6d272369eb07cfd0330a4e3003d038ebdac68d3cfe65715cea1e0299acbf8e9b4cdc08822193'
            'afd4259159ecf457bdd1aee4824c74cfbada72b7e8a8949efa8a7f95dd88d9ee9057319d10632c231ae2580d31fc5ca4c01d9bf8c89ddc4575b5069f26b05b4c'
            'c874f88a0977dfb2ba91347525d6cca562b9ae4f5bb0199d2764e9199d38394d9cad9d67e80852be720a97d023df703bb19dc5ad947b6b84bf3641f3d3694619'
            '8e85964cc1cb123da5cda352829ce730d67053e3ac4eab69053bd39f6de798e57a7605afa98b5ea208df6bf0e12a013fdc5ee732b874c9c512b439e05b5ea4bf'
            '69abc7de69911c6865cda776c8b732c4922e3ed06e32ef87e6a75b23cd95ad0baa9977ed686d48a3647a450b73cb0388a17410bf52403fb4c825a8c6c2a5907b'
            '82a23d277c5094bdfb2c325f5c7ab6ac9dac5e94b53d3a34a98ea0df1ba874d48d5db8d5436d676c6476fbbbc302f45f5a9b32c751870e081a4fba74186ccbb4'
            'e702939e7997753face0d661852a300c7269a83661cdd26b0c99875c3929738f75f01b623b94607d1fdce7fa44f11d0f0f0feecf88e809c3a596286cecf2e9e9'
            '79d1406ecadcd3f2ff14901916f7731c21f0d3e176d1b361082de9afe6580917b2692ab4b45040dc4e8ae4ba5f7c2e7ae7deec7463bcaf428b4c33f21875cae5'
            'c5468108e389bf85a61be56150f0fe58fe6ee427c2ae0e4d77cc2b86eba39a0883d72887ef72ecf2102b34fe4b5863892f436475c46fa8f2cbbb324637f79446'
            '5a25f8302a356f63ee9dae0aa732e6a7f4cc9e4803f8521805f5a2174b591ad07fe1f03f4ac994dc8750409499116ba0ca34b8e521b8453e8c77cfc3a0464a37'
            'c684661c77b821b11dc7a2c6358cb1ad83f90015459ba53e9a82f788d37b02b875712bb52c7634038d3fae5bbb518d574a580af1eb7c6f570088a686fc113c9c'
            '431d50105733f39d975359f96534345aad5a8c320951a5013d3f5bec163b82046cd323e779ab652370e4feab702749f1514bcc31717c362a24445162b1d93cb8'
            '66f2176136aa1335387314cb832aca342c7939576c170b80ae7d0d867181a0485b4840c031b73e618aee1e2392322fef863c0dcaa35db007756ce1d714c2c513'
            '0df13611751b3dd7f42121f3f6c9b7da22f8f3495893569efa0be5de03fe527a0c8a646c03667047fa01253a4f46bde5014b231bf8af6a6ee2ce188803b9cc9e'
            '1fda9cb9b835b3241413591be8a6ba86cdad594c8a0fdd5258083f5c4b056a5bb40786c7b07b72f20e797b3ca6dc6b8ac69e0c4e71ad1ac14ec93fae5f44065c'
            'a2ee27067226f6a2008c6d1b8b3de60d82f2cccc3d00c21bccc614a74c9573b17cc97f49fbe4210503197a0c39ec98883c1b53271d40fd5b9cf5346c0904fe65')


# vim:set sw=2 et:
