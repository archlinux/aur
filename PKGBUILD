# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Maintainer: Pau Espin Pedrol <pespin@espeweb.net>
pkgname=titan-git
_pkgname=titan.core
pkgver=8.1.1.r40.g6be5a7f23
pkgrel=1
pkgdesc="TTCN3 test automation platform"
arch=('i686' 'x86_64')
url="https://projects.eclipse.org/projects/tools.titan"
license=('custom')
groups=('devel')
makedepends=(
    'bison'
    'flex'
    'java-environment=20'
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
md5sums=('SKIP'
         'ecccd5d48359f5f0bdd81c8cc036e806')

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
    echo "TTCN3_DIR := /usr/ttcn3" >> Makefile.personal
    echo "JDKDIR := /usr/lib/jvm/java-20-openjdk" >> Makefile.personal
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
    sed -i "s#TTCN3_DIR = .*#TTCN3_DIR = /opt/eclipse-titan#" \
        "$pkgdir/usr/share/doc/eclipse-titan/demo/Makefile"

    install -D $srcdir/titan.profile \
        $pkgdir/etc/profile.d/titan.sh
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
