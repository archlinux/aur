# Maintainer: chiconcota <git@github.com:chiconcota>
pkgname=fcitx5-lilypad-git
_pkgname=fcitx5-lilypad
pkgver=2.3.0.r0.g3f2fe1e
pkgrel=1
pkgdesc="Modern, hyper-fast Vietnamese Telex/VNI Input Method for Fcitx5 (Wayland/X11)"
arch=('x86_64' 'aarch64')
url="https://github.com/chiconcota/fcitx5-lilypad"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'fmt' 'libinput' 'systemd-libs' 'python' 'python-qtpy' 'python-pyqt5')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'go' 'gettext' 'libx11')
provides=('fcitx5-lilypad')
conflicts=('fcitx5-lilypad' 'fcitx5-lilypad-bin')
install=fcitx5-lilypad.install
source=("git+https://github.com/chiconcota/fcitx5-lilypad.git"
        "fcitx5-lilypad.install")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "2.3.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cmake -B build -S "$srcdir/$_pkgname/fcitx5-lilypad" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Debug
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
