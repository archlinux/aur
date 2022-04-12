# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Maintainer: Pau Espin Pedrol <pespin@espeweb.net>
pkgname=titan-git
_pkgname=titan.core
pkgver=8.1.1.r40.g6be5a7f23
pkgrel=1
pkgdesc="TTCN3 test automation platform"
arch=('i686' 'x86_64')
url="https://projects.eclipse.org/projects/tools.titan"
license=('eclipse')
groups=('devel')
makedepends=(
    'flex'
    'bison'
    'git'
)
depends=(
    'expect'
    'libedit'
    'ncurses'
    'openssl'
    'jdk8-openjdk'
)
source=(git+https://gitlab.eclipse.org/eclipse/titan/titan.core.git
        titan.profile)
md5sums=('SKIP'
         'ecccd5d48359f5f0bdd81c8cc036e806')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$_pkgname
    make \
        TTCN3_DIR=/usr/ttcn3 \
        JDKDIR=/usr/lib/jvm/java-8-openjdk
}

package() {
    cd $srcdir/$_pkgname
    make \
        TTCN3_DIR=$pkgdir/usr/ttcn3 \
        ETCDIR=$pkgdir/etc \
        MANDIR=$pkgdir/usr/share/man \
        DOCDIR=$pkgdir/usr/share/doc/titan \
        HELPDIR=$pkgdir/usr/share/doc/titan/html \
        DEMODIR=$pkgdir/usr/share/doc/titan/demo \
        install

    install -D $srcdir/titan.profile \
        $pkgdir/etc/profile.d/titan.sh
}
