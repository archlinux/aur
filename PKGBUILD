# Maintainer: karboncore
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-globalmenu
pkgver=156.0
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
commit=https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/raw/5767015918c870ff607cb7f86bd1909eddb5323b
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
  $commit/firefox-symbolic.svg
  $commit/firefox.desktop
  $commit/org.mozilla.firefox.metainfo.xml

  # Make different channels installable in parallel
  $commit/0001-Install-under-remoting-name.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2026/08/10/updated-gpg-key-for-signing-firefox-and-thunderbird-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)
sha256sums=('1f2768c043510009abaa3f078123664e106d3ab9dfce75d1819ad96b2145aab9'
            'SKIP'
            'cb00ea359d6daf37900102307be4f515f1b7ef9c98825c64cc55bb562449d0d8'
            '2a51d57d98fbda86f094bc991e1ad4dd6e8a9d32fd0836b1183bf70ec4b68915'
            '4e01a62e20026b67466943bad9dfba47874c5e1492375f8293aeb85ecedf2288'
            '8886b9f6109c1ec1d1f041d786e6a431766e2a06359f930ce07aaa6b84c6bef1')
b2sums=('19be7acf988ee6b7bf27ea292ce36a3a491d7cf4aad2f0c6bdff2f333cf1da540c0fcd5904d5618b7f64624508d0457bd7418b570a8b72d3ae242d5e40fea4d7'
        'SKIP'
        'f2a9cfb758692584dd8057ab30d0ed9d22f5356d0021e1c8111a061866ee66d6b2d891351e11064f904fe8c90032e78f9def61ed54ae4208c8be4de6b4226277'
        '63c62c85ee70e22b02e9ea34e69f04f50403b7634b99fb0e996a83c963916dc4224041a0b265e54f6c224bd1777ddfdeb255037e3e30fec288695f3050278b05'
        '607d592b164a88a11a1041002d67339a9a0001469cd979d24d0fda547cec472f602f6299c198f626f2c854df3ff05bd0b1fd84ae47ee52b97a7906575f5a5f36'
        '1a58067934e3309d25e53504006f1706bf6144f8a2ac7e446cf62680bb6ba856c832580624ee41f4ae8c012bec7e1c7e7eec376d9b86054d2601eec2291adce4')

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
