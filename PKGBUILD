# Maintainer: runtime-eorp
pkgname=winrun
pkgver=0.1.0.r2.g84455b0
pkgrel=1
pkgdesc='Windows PE loader for Linux'
arch=('x86_64')
url='https://github.com/runtime-erop/winrun'
license=('custom')
depends=('glibc')
makedepends=('cmake' 'git' 'pkgconf' 'wayland' 'libinput' 'systemd')
optdepends=(
    'linux: provides /dev/uinput via uinput module'
)
provides=('winrun')
conflicts=('winrun-git')
install='winrun.install'

_upstream="${WINRUN_UPSTREAM:-https://github.com/runtime-erop/winrun.git}"
source=("$pkgname::git+${_upstream}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    local _bdir="$srcdir/build-${pkgname}"
    rm -rf "$_bdir"
    cmake -S "$srcdir/$pkgname" -B "$_bdir" -DCMAKE_BUILD_TYPE=Release
    cmake --build "$_bdir"
}

package() {
    local _bdir="$srcdir/build-${pkgname}"
    DESTDIR="$pkgdir" cmake --install "$_bdir" --prefix /usr
}
