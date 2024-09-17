# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Maintainer: Pau Espin Pedrol <pespin@espeweb.net>
# Contributor: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=titan-git
_pkgname=titan.core
pkgver=10.1.2.r15.ge86dfd732
pkgrel=1
pkgdesc="TTCN3 test automation platform"
arch=('i686' 'x86_64')
url="https://projects.eclipse.org/projects/tools.titan"
license=('EPL-2.0')
groups=('devel')
makedepends=(
    'bison'
    'flex'
    'java-environment'
    'git'
    'perl'
)
depends=(
    'expect'
    'libedit'
    'libxml2'
    'ncurses'
    'openssl'
)
source=(git+https://gitlab.eclipse.org/eclipse/titan/titan.core.git
        titan.profile)
sha256sums=('SKIP'
            '6ac15bc40cbfce771ca828d2402e82a43c72fbcb4f2afb8714340bfd4133e9ff')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Currently we cannot build even old versions due to broken dependencies in
# the TITAN's hand-written Makefiles.  Building the 'dep' target first helps
# to overcome the majority of them, but it still does not compile due to
# various compilation errors.  Disabling 'buildflags' and 'makeflags' helps.
# See also https://gitlab.eclipse.org/eclipse/titan/titan.core/-/issues/595.
options=(!lto !buildflags !makeflags)

prepare() {
    cd $srcdir/$_pkgname
    rm -f Makefile.personal
    echo "STRIP := touch -c" >> Makefile.personal
    echo "TTCN3_DIR := /usr/ttcn3" >> Makefile.personal
    echo "JDKDIR := /usr/lib/jvm/$(archlinux-java get)" >> Makefile.personal
}

build() {
    cd $srcdir/$_pkgname
    make dep
    make
}

package() {
    cd $srcdir/$_pkgname
    make \
        TTCN3_DIR=$pkgdir/usr/ttcn3 \
        ETCDIR=$pkgdir/usr/ttcn3/etc \
        MANDIR=$pkgdir/usr/share/man \
        DOCDIR=$pkgdir/usr/share/doc/titan \
        HELPDIR=$pkgdir/usr/share/doc/titan/html \
        DEMODIR=$pkgdir/usr/share/doc/titan/demo \
        install

    # Fix reference to $pkgdir in the demo Makefile
    sed -i "s#TTCN3_DIR = .*#TTCN3_DIR = /usr/ttcn3#" \
        "$pkgdir/usr/share/doc/titan/demo/Makefile"

    install -D $srcdir/titan.profile \
        $pkgdir/etc/profile.d/titan.sh
}
