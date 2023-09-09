# Maintainer: PisonJay <PisonJay@outlook.com>

pkgname=libei-git
pkgver=1.1.0.r0.g82cdbc9
pkgrel=1
pkgdesc="library for Emulated Input"
url="https://gitlab.freedesktop.org/libinput/libei/"
arch=(x86_64)
license=('MIT')
provides=('libei')
conflicts=('libei')

depends=(
    libevdev
    systemd
)
makedepends=(
  git
  libxkbcommon
  meson
  python-attrs
  python-dbusmock
  python-jinja
  python-pytest
  python-structlog
  python-yaml
)
source=("libei::git+https://gitlab.freedesktop.org/libinput/libei.git/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/libei"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson libei build \
    -D tests=disabled
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    install -Dvm644 libei/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
