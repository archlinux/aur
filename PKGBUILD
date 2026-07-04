# Maintainer: Your Name <your@email>
# Contributor: lingzolabs

_pkgbase=vibetype
pkgbase=$_pkgbase
pkgname=("$_pkgbase" "$_pkgbase-fcitx5" "$_pkgbase-ibus")
pkgver=0.1.3
pkgrel=2
pkgdesc="Voice-to-text input method backend with IBus and Fcitx5 frontends"
arch=('x86_64')
url="https://github.com/lingzolabs/vibetype"
license=('MIT')
depends=('gcc-libs' 'glibc' 'python' 'curl' 'alsa-utils')
makedepends=('cmake' 'git' 'ninja' 'openssl' 'fcitx5')
optdepends=('wl-clipboard: Wayland clipboard support'
            'xclip: X11 clipboard support'
            'xdotool: X11 key simulation for auto-paste')
source=("$_pkgbase::git+https://github.com/lingzolabs/vibetype.git#tag=v$pkgver")
sha256sums=('SKIP')

# The three package variants are mutually exclusive — each includes a full
# backend + CLI. Installing more than one would create file conflicts.
#
# Build picks up Fcitx5Core automatically when fcitx5 is present (makedepends).
# The ibus frontend is pure Python, no C++ build needed.

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/$_pkgbase"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_FCITX5_ADDON=ON \
    -DCPACK_PACKAGE_VERSION="$pkgver"
  cmake --build build -j"$(nproc)"
}

package_vibetype() {
  pkgdesc="Voice-to-text input method backend and CLI (standalone, no input method frontend)"

  DESTDIR="$pkgdir" cmake --install "$srcdir/$_pkgbase/build" --component cli
}

package_vibetype-fcitx5() {
  pkgdesc="Voice-to-text input method backend with Fcitx5 frontend"
  depends=('gcc-libs' 'glibc' 'python' 'curl' 'alsa-utils' 'fcitx5')
  conflicts=("$_pkgbase" "$_pkgbase-ibus")
  provides=("$_pkgbase")

  DESTDIR="$pkgdir" cmake --install "$srcdir/$_pkgbase/build" --component cli
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_pkgbase/build" --component fcitx5
}

package_vibetype-ibus() {
  pkgdesc="Voice-to-text input method backend with IBus frontend"
  depends=('gcc-libs' 'glibc' 'python' 'curl' 'alsa-utils' 'ibus' 'python-gobject' 'gtk3')
  conflicts=("$_pkgbase" "$_pkgbase-fcitx5")
  provides=("$_pkgbase")

  DESTDIR="$pkgdir" cmake --install "$srcdir/$_pkgbase/build" --component cli
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_pkgbase/build" --component ibus
}

# vim: ts=2 sw=2 et:
