# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Pau Espin Pedrol <pespin@espeweb.net>
# Based on https://aur.archlinux.org/packages/titan-git

pkgname=eclipse-titan
_pkgname=titan.core
pkgver=11.1.0
pkgrel=1
pkgdesc="A free and open source (FOSS) compiler both for TTCN-3 and for ASN.1"
arch=('i686' 'x86_64')
url="https://projects.eclipse.org/projects/tools.titan"
license=('EPL-2.0')
makedepends=(
    'bison'
    'flex'
    'java-environment'
    'perl'
)
depends=(
    'expect'
    'libedit'
    'libxml2'
    'ncurses'
    'openssl'
)
conflicts=('titan-git')
source=("https://gitlab.eclipse.org/eclipse/titan/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        eclipse-titan.profile)
sha256sums=('50595b4665f85632cd6d459c0cdb90fa42ae9ee57a9eb1b4886c438c251a9ae6'
            'ac28aeffaa7931d2bf1945778b088d6764e566fc04aa307d1bc3d2fb95f558cd')

# Currently we cannot build even old versions due to broken dependencies in
# the TITAN's hand-written Makefiles.  Building the 'dep' target first helps
# to overcome the majority of them, but it still does not compile due to
# various compilation errors.  Disabling 'buildflags' and 'makeflags' helps.
# See also https://gitlab.eclipse.org/eclipse/titan/titan.core/-/issues/595.
options=(!lto !buildflags !makeflags)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    rm -f Makefile.personal
    echo "STRIP := touch -c" >> Makefile.personal
    echo "TTCN3_DIR := /opt/eclipse-titan" >> Makefile.personal
    echo "JDKDIR := /usr/lib/jvm/$(archlinux-java get)" >> Makefile.personal
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make dep
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make \
        TTCN3_DIR=$pkgdir/opt/eclipse-titan \
        ETCDIR=$pkgdir/opt/eclipse-titan/etc \
        MANDIR=$pkgdir/usr/share/man \
        DOCDIR=$pkgdir/usr/share/doc/eclipse-titan \
        HELPDIR=$pkgdir/usr/share/doc/eclipse-titan/html \
        DEMODIR=$pkgdir/usr/share/doc/eclipse-titan/demo \
        install

    # Fix reference to $pkgdir in the demo Makefile
    sed -i "s#TTCN3_DIR = .*#TTCN3_DIR = /opt/eclipse-titan#" \
        "$pkgdir/usr/share/doc/eclipse-titan/demo/Makefile"

    install -D $srcdir/eclipse-titan.profile $pkgdir/etc/profile.d/eclipse-titan.sh
}
