# Maintainer: Lu Xu <oliver_lew at outlook dot com>
pkgname=xcpc-git
_pkgname=xcpc
pkgver=r596.9368d33
pkgrel=1
pkgdesc="An Amstrad CPC emulator, git version"
arch=('i686' 'x86_64')
url="http://www.xcpc-emulator.net/"
license=('GPL')
depends=('gtk3')
optdepends=()
source=(git+https://bitbucket.org/ponceto/xcpc.git fix-scale.patch)
sha256sums=('SKIP'
            '4213da57166360c206c855f4a24e8fe0c949c86b85bb969b9c8e3f484cd9f1dd')

pkgver() {
    cd "$srcdir/xcpc"
    # main branch don't have tags, use revision count as version number
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    patch -Np1 -i "$srcdir/fix-scale.patch"
}

build() {
    cd "$srcdir/$_pkgname"
    autoreconf -v -i -f
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
