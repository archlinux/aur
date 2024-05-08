# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Pau Espin Pedrol <pespin@espeweb.net>
# Based on https://aur.archlinux.org/packages/titan-git

pkgname=eclipse-titan
_pkgname=titan.core
pkgver=10.0.0
pkgrel=2
pkgdesc="A free and open source (FOSS) compiler both for TTCN-3 and for ASN.1"
arch=('i686' 'x86_64')
url="https://projects.eclipse.org/projects/tools.titan"
license=('custom')
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
        0001-xsdconvert-xmlGetLastError-fix-invalid-pointer-conv.patch
        eclipse-titan.profile)
sha256sums=('09433cffeb64aba1a97331ab5d73aa5e9c03455815310440b89e23eb15c20711'
            'e7f0c46fe6398dfd0fa96cf0f67f9e0f429e147750bd84fbbb6a5058bce0c37d'
            'ac28aeffaa7931d2bf1945778b088d6764e566fc04aa307d1bc3d2fb95f558cd')

# Currently we cannot build even old versions due to broken dependencies in
# the TITAN's hand-written Makefiles.  Building the 'dep' target first helps
# to overcome the majority of them, but it still does not compile due to
# various compilation errors.  Disabling 'buildflags' and 'makeflags' helps.
# See also https://gitlab.eclipse.org/eclipse/titan/titan.core/-/issues/595.
options=(!lto !buildflags !makeflags)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    echo "TTCN3_DIR := /usr/ttcn3" >> Makefile.personal
    echo "JDKDIR := /usr/lib/jvm/$(archlinux-java get)" >> Makefile.personal
    # fix compilation errors
    patch -p1 < "${srcdir}/0001-xsdconvert-xmlGetLastError-fix-invalid-pointer-conv.patch"
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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
