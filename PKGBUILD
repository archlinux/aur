# Maintainer: Petar Koretic <petar.koretic@qaap.io>
_pkgname=binfmt-support
pkgname=$_pkgname-git
pkgver=r232.1e28177
pkgrel=1
pkgdesc="register interpreters for various binary formats"
arch=(any)
url="http://packages.debian.org/en/sid/binfmt-support"
license=('GPL')
depends=('glibc' 'libpipeline')
provides=("$_pkgname")
makedepends=()
source=(
git://git.savannah.gnu.org/$_pkgname.git
binfmts.service
)
md5sums=('SKIP'
'0000a524a3d97583563a0d1d6f6b1ecb')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    ./bootstrap
    ./configure --prefix=/usr --libexecdir=/usr/lib --sbindir=/usr/bin
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
    install -dm0755 $pkgdir/var/lib/binfmts
    install -Dm755 ../binfmts.service $pkgdir/usr/lib/systemd/system/binfmts.service
}
