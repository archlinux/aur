# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from https://aur.archlinux.org/packages/libei-git by
# Maintainer: PisonJay <PisonJay@outlook.com>
pkgname=libei-basu-git
pkgver=1.5.0.r25.ge8994df
pkgrel=1
pkgdesc="library for Emulated Input - tweaked to use basu instead of systemd."
url="https://gitlab.freedesktop.org/libinput/libei/"
arch=(x86_64)
license=('MIT')
provides=('libei')
conflicts=('libei')

depends=(
    basu
    libevdev
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
    -D tests=disabled -D sd-bus-provider=basu
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    install -Dvm644 libei/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
