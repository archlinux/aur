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
pkgver=153.6.0
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

sha512sums=('3e9f1f8e7c14d1994f4896702a50b46c1a3c7c7b696a080112f5ab3fdf0fcdd41ade4e81f9abafe2d3824cf1dfb16b5c09e5eaec12a05a733906f1483395565d'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '2b06a2398e862fa4e61ee5e41971930a9c50a90fad4ee99231fa9f8d94d07e3f31a044d2a306a73e28367f654ad5568bf4a64ea42898a5001969022e3bc8e992'
            'a6cc78085550e14570a7613bae9ff92eb6a3f9629945f1550daa2e3af790aa68a62a8c8339b531e6319265935372fde026898bfa931031ffc78ddfb05aa045ac'
            '7ed7933b4a2f46645e395628326ed797ac9bc42f63bf2e99f116eba4b561970028d8c8efa9e90b5c614418c911eeab074146a48aa8cf3b7ac306e34ead8f0bb8'
            'af5a468e632f6a961d612f63d8df303a9572ce6a2825799ec94a7dabcd5a2e67ca3b76826feb7d8ead334f08c77f5d91ae1458386c69ad0c198370761572b056'
            '85cd244792084c23157d4f54680b8ddb90ab901562906e9f616fedcb03779a7fed6c82994bce9d6429caf0c9088c2f6ae43ba401ddd3094d95b10f17d3857e0f'
            'f69ba426e5250da481badea87e09c8be4b39cdc94b946d52c458501a0f51e4d533ce0cde56e5cdc28af7d2050d24ad5761d17602e013a555581a7b7287a96702'
            '540235388e9a72b228b0728ed3857354ee188efcaf9beeee03fad39f2549241f787096ca20e990f5bab5157566ee6b286e8b22557d79d2bc30fb7f30b46fdbcb'
            '2c2ffbfa8d0a46d2e8faab343afade18f6d0fb2478b9eeef150957d13d3aab5c2be3b29849963ad1ca20212983cb5d7983a8f38c24c4a63298a91a63744fcaad'
            '5ce296d766d30dc34445bbef2fcd3d0e01fcb16c8e3f8e2fbd5ddb3e6e244bb4d92b2433709c9b6f914b70969f14defe40d16a029feed9d4e1dd401c983291f9'
            '339ddf0495b1436aba6ec2bfa152f5869e9d6755732512cabc5d1170275555c160e05f596b0f0c584a2e4986a3d99e6c34c388217a4ff3c0d810aae061e9417b'
            'e04f9475e17927758b2c6c99ac5dfafeae076421fbf396581c3ca3a62cde978bc7dba48f929175f9a4b8e39388641d4164b7552e1a27bdccc5212ce51dc9e474'
            '94eff8b3456d13c6c6796350c99042e307587538fc0542075b1eacc4d4551320166a98709e64624eb0bf685b21d6db3b85fd4aaa5fbd706fe970528cf786173d'
            '005fe7d182aa7908001012b40a270e44e2042682b5e19b7fac48c3f852e1a0b0e9436a0e821ca772e457d3548ef21634cbe0becdc0ee1a70faf93f421e627001'
            'b587efcd2b57902f2853e951993b4dc46e08750489910e9f84771c184ef7b3206e5248d0a2bb2d405d48581cb4bf02e9fb9ad9ce926dfecf387de1c319b69ec1'
            '0baecf939d95fd8dc449b969af85adad824af4f4afa6817aa21d40a72bfb405d5bf4ff3589df4c8682b6960cc3053c2477357b9b1dd766e658eb81fd40876542'
            '53715d33f4ad5233814485b5c4945c17bffadb676387eb92c11e2949a845e17d41b0f3914dbb4aaa3fc3659867303503d4a854294e6142bd02a1dc7438ff2da6'
            '1c8d4ecae005f9fd52f0d941a0ccb9e07713f75e50b748c1d2f0b91220648b1ec164742861963a2da46fd752b413bab3e5aa34bf22e435e41da9ec4fe76478fc'
            '9d18ad93ed71f22ae2a5f2377c611c490f7253b7438a50f5fc03019b9620669bd6271488ac7b8d62a6077b9161996fc775f7e9c601cb0f22d72c2834c0292641'
            'b8a25df6fd27bd0d10d1d1d5c5801060f25f87bc8906129361194e31c6d1a6ed1459d1e176f980392b02cac3146422d243478b46fe4e120596e97ce9bc4630fc'
            '918eff63e8c0e0f6b6b03953f0bb98fa7625a34263ab5ff9ae154c9026e09d54ebc054a2daa132dda3fd489a42dfbd20a37e91e1f670ef6d26f7ef3a5cc05370'
            'e1f6c2ed8807392d10076d73eb7bc845b84784bbbad703ec92bd5a53e67b55298481b34172755280d557483834148e089778ffd5e781888c4d26dc8ef99924d7'
            '58b00bf8e451397f9bd43090eea4d54cba62ef8a42e834ce6154a78a4ac3f6dc2fc27e98c91efe914f18985c21a4f0a09ca4f416c204c6a0c720ec64299915b1'
            'c7fa8d76e541d021a22f558ef549918f19ce0ff3bc5947aa37eaafbb26a0520e23ac93a77cb18feb77642912cec4c9e91acdee3c27f3b1b1a76eb760f806ba44'
            '73b11efc474c8c90fe281668b8de4acd961246a747fab9c13f107853f18ebfe6708fffc0bb9d2ca5a2f8d32b1d7a7b6e0cabb724fd951c0121c2eba03b92256b'
            'd851d799e1f4646f7bffae0803e410d1d1ee35b889f8add5887f109c66de93aec8993a8273b115b019a18a3cdf3976c8e08b6ebdbe6e62b2c68b7399db136879'
            '7a68d5c0d2f128727c7e33fe69effbfeea591e84b99019fa8c071c125801258d52030b87c87121d2afe9517fcbdf75b3b5c3ca3687934475f674bfe8392ba445'
            '944e2be8dbc9c1eba9cfd78921160c591c318ce85c77380432ac120ffa0bfa14dc3483c71ca5c84ff012bde1e2bac9f09bdf1842a72df46c64cd82a089da1b4d'
            'd082d1e9c91f163c85b455703b6b174f3e29ad63f7c0ffddab8304d632a406ba3ac317e5754372205ba13fa1d3054cbdfecf6bbd5a8ff279bdad3cc2f4010b68'
            '72804ab7cdad247a0675b28904356bd2351b78efcd9253171daf1eb4856a89e2f6f06a26c7c403b32a4de08096673e558df4ac974efd180d5146a260aaa8e645'
            'c9db11cf00b69cf2013577d3bbd1b6006a71830de790903b21de63e3da22d18f84fcfbdcad91ad25d7f73d5ab97277c6da70a50e6259407cabf74d226fb4becc'
            '0078fc6eacd71e9f66071a0a958f70cc91bbad978dae73378654e0a0cff4e9c1f25cadf7e9dfff7179fedd36674bf7faa153a0b101f0be7fa70f994288e232d1'
            '0d06c30f338fc1d2dc64cbf96c065a1ac96c5e4ab083efa2d938f185d745e9ccfd9516aca9c90ed1d6725014d743104577de0140494c3fc7061b320885c749a0'
            '732eed0a283eca806f1852980af3cd32cccc63d7d242473c555b7f24260c1d14325f5cc0f696acbb8b22e85d66094d31b2f24c73bd3aa7a55f6494c5ba343e9d'
            '458b88102c28f2b21c5030f0515bf6cb62e7ae2729600494ab7076889fa2460b3e63e15c39c8feed7d717c67ba14d5782e5ba2880e6510d77bcc0d6ac8ed0d67'
            '9d2a13beb01c618670edf008a50adedee7afae9cf96ce31b0fddc395bce793c5b32551e82faa97ee0d965bedebcebfc109c6a8b05d03770cd0122b7077404126'
            'fe0ca06d69f2abca33f82e4018706e1d5384011412d187fae69159a6f65a7f1f3f7aa54672c271aca38e55dc4dc95ba182fb51bce8df690da217b341e5f2da66'
            '75675e608ff195dcf74ccbb5c50d43c3a12d8559e7f9a49e07e76f19d8076c912d499eaec56723663cd0ffe7c855af7c5f98dbb7729d129f564e545a5d9ff455'
            'cfe2294f31e76ece16b92e1977f6b15261a51c0159a6ad37de82e6b2ed1892c44e55d0474296ffd52f8faa48339cb880f4590ebf3231ac130d3a71aa96f27f02'
            '6be26abfc44da49ddb1e9d923b29d4766252719b30c133ce6b3fb70fe9a304386c8da23a6beec5c73195de4fde314373e8a955dc92deb0db1d6f0d8694530cfd'
            '89028ddefd20ff3046684569377e9a52a8443fe158065351fa526b5e665559745921d9f707104dd93439670650cf08e3d9b04774d9f23a86b3e06f91fae71edc'
            'd862c00a5b50d40b108ff6704125f8274837b7b03c763d05ca47370bcb05f193f7eaad07896a67ac932a38bfe3b475f6454584c747d97289fee2f851015ff11f'
            'a234b26f75d4ea819524066e78f0775133bcad376dd5538c0269b4121b352b6d846af5620d95a16d898417c2b300bb6b8cf81263288dff18c54710ae3293d7ab'
            '6ab94d22fcf4a79a239d05f6496b0ab4be9f3700af1ab0e06261359f83290a782906cbc94423641135c9dff0c1e99ac2cc03f5cad25cf128d5d9c77bda8ed2d4'
            '5423b30eec176327adbfc38377d7b0c547783a29760562bdf762916e5bcafccb63dcaf0f24476c68ce4e5d20f30d8f97596f713ceb8859a16366ae2e8d9f2fc4'
            'b0342aab7ac6008edddd405a519fa41b1847033724e434a26878fd8e6b0d1aad96b70754a39efbcd6cddb8cbdf916a5c5602c92271cc01ed50a05a982a6b8f04'
            '76e6967913917eede3d5dcd1a20cc15ca032054fe2c3edbb628008ecf0374b4316dc7cbcaba355b379cefc08ff812e75aafb73df236859982c869e52ec75f4e7'
            '3d9d84e92f03ae97cb1e370164eaa5fd701565bef20e620c6b27e0bf45f9604b9c9d0173374c45e82b2ac105a4b3d3019fc37f22859e93abfbc7fb59018e3bdc'
            '970bf66889561417a63b27788783980cd6846ab4c1932dfb445cfdf81c78bd6f90aa205d550b2627ed221d7968e3fd2608ad6d075bb493b92a740bcf03e500af'
            '904e254ffaa462bb7575df1568391a9ee23550648d7a645c9d1c23fce5a70695a592cdd51e86727ac7b59502b73084bd4a292653226571a474a8a48c56ef294a'
            '8dfee8fd6b0294e5b6761e77e9369858fd013cddc0c1412961cfc5275005d75eb5496839845860060f38a577269356af3e23afb7752435866759166b4dc479d8'
            'ed2bae5bd5e9a3fd70aab2820a288ea6915a977e37162eac44dda27d2fc12d0b25c1727809942f7987c67183634a0898122ed7a15a0ebd92f413687c1daf7a87'
            'f3095e33303fe4b5dae1ca35d80f97b01970f59284dd228d325a5b3b1266b73fd6c793bebca500a60efa219fe81b42bbc0448f5336a3f6a1cf428f6d4f9a8cd1'
            '4f6d427b1edbd36ed854f6d792146969a98652b8b00d85304ec13102569545dd6c6ac327a7efbf9b7c56e6af4878e30b6e7efdbeb57b7c25be8d29f06a194123'
            'a83ff790d7341879f7bdce6f1e3a8c74b01e64a25f4b01e2eeecb5b62c5e513eb64a7dda8ae57eaae5877993e7603990c062d35042aec1b1353fd67d5d32ff0d'
            'ebe915829ca94a3e489d13eccb233166f9826fa1b96a59e2eb685cd376fd56bdc4405db05e0c4ea0023a539d8af0d921779c2e2f2a561974b361353707976294'
            'd4218af0a8159cc5afe7a668dbb61606350a37af95dc0b6d2893f8bfa9fef70c8c68ad494acec7f19ad261dc6afc505d05588e5663fbd577cbc6f1a903434920'
            '0343093729487d3ea0524b98ea7afdef3a8cfce38984ffeff5f01327398d395dbd119cf59456586afc487a32398675680d91e78d5b555bb9d455e3b89970d386'
            'ed989adce8209218db5468a1929f8cfb1cc847bf331c0058afbfb2755f9359940fcd1b2655b96d586128d7e85fe53f24484d36e023c9381eb42800ae8556ba56'
            '0357d4d7d743db1dda30b565643eebc6f94fbdcf2e01a32dd234d97dafda6f3c16e6e1457ccb83f83bcfa7b73f12d9072599a5f91c1f9ea53f152c92db3b3a43'
            '6543baab494193c36811a046223c9dba1456180d291fd6fe91bb8683de10d5c6344574afecd9414e8d115d14ccf4bb423b1e6c4093af63dec23a084d2eac7023'
            '4fd4836e6841d1a9b000425d9cc0f69e6e5322941219aa778639572b4da3b758515811423a408e1a29c3e8e5c731731664d1e467ca56cb4b8f213db9d3d70640'
            '70ae8041c265a3ba602270e063f009e77684fbd47314fd615ea3371e375fe622b4a3c471a27ec0f6a76a9876e2e063c3b39cf140010c85ba832bff12a5c100bf'
            'b74bc659e4ac1ec1d91322330312091f050112e6173a848be76ba87d5a3a2f161382c617b228bb88c7a5fc31ad629cf067045cd6ed87a8aa1d1bcc1c24bc59d3'
            'b211659511090f04f95a55d653e6ffc3b1f58a76d28f9eca7abb612a1b99ac666e47ea107a2ef63210edd900d55d3d4cc2d2ce0d9cbcccf9bd2c31c22f08d025'
            'fdb9085060cfaae63cb9bca8eaefaae7d63d85e117069660da493b71962ba64b7c6f25ad256a2333ae1128324d1702dbb74678459395508ef97955c6d1347f99'
            'bc6ea7a16f74112d2f6e2fac6ff24ae686a311493057918967b2ef514c3c1ae684c06956ef2e1e0c3c9c406f922662654cc96364336f51106b456e46d90dce10'
            '4a2e4b5233d2787770b8c91f9caf4b44fe37e663cd255ae76b723d0d08d83742a8fc5b579948f1524a91e73bf812f12a58a14ad984390a3132a313dce0cdbf5f'
            'e463fab2e0420205b5dfff7ebf257f7712fe4aeb917727fb6a06c96cc572f3e086ed3aa5b710f7a7871dc436f4d9b86a98a842974ee266bfac03fa03fde62595'
            'b365e2614dc84ef3db6a65d893964c2b58c95afe526e389cd588bbb3d66b04b46a61349eb3477488a82060169f0babb588ff497791ef04f1f0c93ece37e57f72'
            '6edf18dd1b0fb813f7afb1c6e37b7bc6ece1550def2059ce10058a6386dcbe383c654a510a08d45d9b044839be69459955310265347cff687aa88344c4f89bb5'
            '465387c1cb3c9f964d0e7914f294d23d1c24f91da46f4a988d9b2819c051ae8221b805db36ef45b6f3e3f5436b3c50369a51284ef657dcb3bb96f3b2aa2bd32d'
            '662b9f6dd19f4962ded851fe75b2a6d219cac0d68023d1ad976d77b2d55480cb8baeef6211a3ffda01fc7ca84cabd95037d148c74d73a6bd4293094a59c1074a'
            '25e72343d9100531841c28d363783127da45733f117f868d78d9635264cdb1358656868677f8585b075713eb30a00655d2d3d7b101d67238dc118fb0094436a5'
            'b9ad7cb0c587c8c32f7a4cb477f0a7a55c83e592d97f85f69e91c7b5f30ff029424db3c1bb1d4eeabc31c085d7d39bae1736719bdfa86c2004c2dd2b77bd075a'
            '2b840dedd35669f653687266cf22d4dc9a0df6ac37adede6be94ae0d7926126febc7353f7a8caa921f186d3bbf8165cd4c1139288be2acc768fe4066bc346b89'
            'b3aa5b6107d0578d1e9fde9e3b51011226cc4d2d536d1cbc1d4ba61750eb337310c9b5f8e717929181e072028f666127c57945fa65e47262f9d6d1ee9fd0c17e'
            '8c0620b6a3a7f76a203193f0c357880d24bbda783860c12dd2b2f976ecaf34936299fedbe9d84cf6405be88d7822d8116eb9684efc6b6ac082f3e58d967b24a8'
            'cd5fc4c9a70afc62a80354dde7e80bb7c7e67f226c4aaf501ec6ef3e1525f6d5484eca4bbd4063b49288a93b42ed74a38eec3b6fbc563cf68726f0a41124a141'
            '1721230f2de4bdcb42a821fe43550ffa650bee028c00f7b98d439845aaeaa9443226f76e22c0db6d760961f05e4655c65dd691c2fea2bb50a2e5a6d36dd21527'
            '3afcb88f225100ef65a08bcdadd2528dc7003eb536b730227549894da97674b1492508e7664fdbdeedaf96d2f3f64b12e32cfad173d4c2719f443784c94c018b'
            '38303df20b5453741a15b94ae3a9c1cf24d28c8d36c1a79a3921168c1fa100008921365b56305d68ba123500c02a14b6667703f17bccd507d483eff3c3263d6e'
            '0c3a548ca385e70d8cd35a9e89db321eda4bd3b639dcb032d0d36d4b5551f0222dd0fa2fc9735b91e30ae7643af2453f66a4fecb8ffea49f0ed315a6034a0463'
            'c9e26a38821f7883e8e8d598c6aa5d30aa345db5fd09d734d32a67d700d064ca50f0c2f9cb242bedeae68a0383e1aaecee37398f45f1af11a6246a60f6f9eacc'
            '6ee87d4ef5cb8b658e45cfbf18ba16b9f523d8a75be011f8830b6d70dc560f18c5132addfba49c8f0077ac361a915347232ceca999c72e365c7677ce56afe075'
            '9569c24339704e23ed44d9605537823f431a2f5f3e9d6ba6181b50685cbe94fb1157e23668c0469e0e37db792d4f516a1d942cfddd26e831e4aab4a629590e83'
            '519fe45b1b0791705415aec62047331864e23f862376fd7d219d2786dbb1c1a20c19f3110f679db9cf1f9212ab683bf0b365397dea7efbcea0f42ed39277ae1d'
            '38dbbaa16148f55ab42d7055b3438b296b92620bca0cfa18691835bd1141e9ddaf0291f411731c5dc56c8bc7448924c0d8739123c4f7c682afecd3741934d87c'
            '90809b702e8bda9873fba982ce1f5d06f5517b0a435e816e806f361c356d5759db907f7da25a8f033de9d52dac0454133c6ecc1f7113fbf7022b33e01961d48d'
            '38aa4a949835b00b055011115a93e05986fc7f206a32f347df52afc07d1b95dd8edc30add5f23e97081c8953b32f2a1e4acaa6cf279899a2372d2531f2bae343'
            'b77a64acba61af6e632369996d592ce177a8e289de33a308081bc52cabd092c835ff5697586671a959d8e1603506cbbb7a9abeef65053b8ace8f950fd1c733b5'
            '7fca41753fb1cfe3d37d5984bba9291759bc2a54a0907fddbad1025f194c2c407b76cb5b2d13c14d83011e3d4d409c24f64dac48100e98faa6ae410ec13da832'
            'dbf479f987c83292a32b2e4c3c24c7bb57584647cadc827b5bf97036f4a5cf408c330b56aa5b9c1accc226e69ba298e9f86b27cce63b243c2ec5b17ce79da8f3'
            'ec3aa2d995cef5683c8e87ce3109df413ae6dda6e155257177660b28927597a3a1f8dcf7f310f68075313987b5d772d6eb2b138a32931e661ab8950a17063b12'
            '8312fafa2d95d4f267b997d8de1084c2142481132a24f9199c7c1a12f101e3086e502b6f6fb72653325344c213c621784ae9114eecb13e8226e1e2bda9f840e6'
            '0ec2bae999d4ec408ec3c9b38002f59180435b65fb667154e47a99599310cbadc2ed9e3afadad9ab255f121a8899fa8f4a8190acc4e03a4f94c976542287eba5'
            'dd19bfc19b675b3232b141353ba7da20caff0e62d4ccfa69e8df80ac784d8a4d84c94c07dc88d2449fc0bc8a21c0d6a767ab653cf5bceed043a490f560d0a2bd'
            '3bbe270c9280011aac266eba790ea8196ff11352638e5fe34d0c715811d793029db232d6a548cce59f24c7f565dc995b374d1eb282dab260061abb00d156438d')


# vim:set sw=2 et:
