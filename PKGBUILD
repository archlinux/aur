# Maintainer: karboncore
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-globalmenu
pkgver=153.0.4
pkgrel=1
pkgdesc="Fast, Private & Safe Web Browser"
url="https://www.firefox.com/"
arch=(x86_64)
license=(MPL-2.0)
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
  imake
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  onnxruntime
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
  'firefox-i18n: Localizations'
  'hunspell-dictionary: Spell checking'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'onnxruntime: Local machine learning features such as smart tab groups'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !emptydirs
  !lto
  !makeflags
)
commit=https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/raw/94c6383287095fb4b69da0a267faa90821856d9d
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
  $commit/firefox-symbolic.svg
  $commit/firefox.desktop
  $commit/org.mozilla.firefox.metainfo.xml

  # Make different channels installable in parallel
  $commit/0001-Install-under-remoting-name.patch

  # Support FFmpeg 9
  # https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/work_items/34
  $commit/0002-Bug-2057577-DOM-Media-Add-FFmpeg-63-support.-r-alwu-.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2026/08/10/updated-gpg-key-for-signing-firefox-and-thunderbird-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)
sha256sums=('f7aa83924c66bb3b04cf139b3b00612d388a9f024c92fe7834161553a6028a48'
            'SKIP'
            'cb00ea359d6daf37900102307be4f515f1b7ef9c98825c64cc55bb562449d0d8'
            '2a51d57d98fbda86f094bc991e1ad4dd6e8a9d32fd0836b1183bf70ec4b68915'
            '4e01a62e20026b67466943bad9dfba47874c5e1492375f8293aeb85ecedf2288'
            '83311ecf83698f2739ac42f26777df2e5df3fc090144480d10a9c203076b8165'
            '55aeec4d098990e91f881de32126ea91576b0d185e322b561241c513ea5b9fcd')
b2sums=('f5385a9383c449b3e6971366217f2edae15a3809b1d2fd6052b7942c1edf0f9cb5e98e67bb844dc6067f7a9577c962c8b48b464601bf46b00e5d3ad91218a3bc'
        'SKIP'
        'f2a9cfb758692584dd8057ab30d0ed9d22f5356d0021e1c8111a061866ee66d6b2d891351e11064f904fe8c90032e78f9def61ed54ae4208c8be4de6b4226277'
        '63c62c85ee70e22b02e9ea34e69f04f50403b7634b99fb0e996a83c963916dc4224041a0b265e54f6c224bd1777ddfdeb255037e3e30fec288695f3050278b05'
        '607d592b164a88a11a1041002d67339a9a0001469cd979d24d0fda547cec472f602f6299c198f626f2c854df3ff05bd0b1fd84ae47ee52b97a7906575f5a5f36'
        '20b287c93a43bbd08373af81d626c167a374700a5318ac83546c45d4bc54ff335c12cb32584f66ca61b7509836292117f8622feda56983fe72d6a4f3af3a5613'
        '3a613f8534d1895b2e683e91155f990502f139dd49589de61589ce9c223e43d07782e1a8c07e1f82b2a8e74c313ec545e4851075cece927326f8aa43b2a18c57')

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  mkdir mozbuild
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
ac_add_options --disable-install-strip
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=firefox

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

  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross,thin
END
  ./mach build --priority normal
}

package() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local appdir="$pkgdir/usr/lib/firefox"
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
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=firefox
app.partner.archlinux=archlinux
END

  # Link up system ONNX runtime
  ln -srv "$pkgdir/usr/lib/libonnxruntime.so" -t "$appdir"

  # Install desktop icons and metadata
  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/firefox.svg"

  install -Dvm644 ../firefox-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dvm644 ../firefox.desktop -t "$pkgdir/usr/share/applications"
  install -Dvm644 ../org.mozilla.firefox.metainfo.xml -t "$pkgdir/usr/share/metainfo"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/firefox" <<END
#!/bin/sh
exec /usr/lib/firefox/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/firefox" "$appdir/firefox-bin"

  # Use system certificates
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/firefox.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=firefox.desktop
BusName=org.mozilla.firefox.SearchProvider
ObjectPath=/org/mozilla/firefox/SearchProvider
Version=2
END
}

source+=('https://github.com/Lexi-Ewald/unity-menubar/raw/9a69a0967c32991d488f3b47bb287ecf38aa1f55/unity-menubar.patch')
sha256sums+=('8ca5a55119f42a75565e8803a130f21133d285df63c0de58dc5d17babf20ad64')
b2sums+=('07579b32e1527662325b37a3df2a6311637cdeaecc1b62fb386051dabdb5917f3ad617482732c97b167e3766ac109dc3e5d59c525dec0033a0f8923a1f44165f')
provides=(firefox)
conflicts=(firefox)
