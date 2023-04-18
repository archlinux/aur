# Maintainer: hexchain

_pkgname=passt
pkgname=passt-git
pkgdesc='Plug A Simple Socket Transport'
pkgver=20230329.b10b983.r16.g1a3ade9
pkgrel=1
arch=('x86_64')
url='https://passt.top/passt/about/'
license=('GPL2' 'custom:BSD-3-Clause')
source=('git+https://passt.top/passt')
sha256sums=('SKIP')
depends=('glibc')
makedepends=('git')
provides=('passt')
conflicts=('passt')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --tags --long 2>/dev/null | sed -e 's/_//g' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make install DESTDIR="$pkgdir" prefix=/usr
    install -Dm644 LICENSES/* -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
