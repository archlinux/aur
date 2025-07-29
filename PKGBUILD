# Maintainer: Vescrity <vescrity@foxmail.com>
_pkgname=yestty
pkgname="$_pkgname-git"
pkgver=r10.be9c14a
pkgrel=1
pkgdesc="Tricks apps into thinking that they are reading from / writing to a TTY."
arch=('x86_64' 'aarch64')
url="https://github.com/heather7283/yestty"
license=('MIT')
depends=(glibc)
provides=(yestty)
conflicts=()
makedepends=(git meson ninja)
source=("git+https://github.com/heather7283/yestty")
sha256sums=('SKIP')
prepare() {
    cd $_pkgname
    meson setup build
}
pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
    arch-meson "${_pkgname}" build ${_meson_options}
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}/" ninja -C build install
    LICENSE_TARGET="${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${LICENSE_TARGET}"
    install -Dm644 "${srcdir}/$_pkgname/LICENSE" "${LICENSE_TARGET}/LICENSE"
}
