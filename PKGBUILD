# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Pau Espin Pedrol <pespin@espeweb.net>
# Based on https://aur.archlinux.org/packages/titan-git

pkgname=eclipse-titan
_pkgname=titan.core
pkgver=10.1.0
pkgrel=2
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
        0001-xsdconvert-xmlGetLastError-fix-invalid-pointer-conv.patch
        0001-Fixes-for-selective-code-splitting-feature-issue-695.patch
        eclipse-titan.profile)
sha256sums=('68e36e23a64cabca780650f82331fa4ef0e00f1e75ccf02fc82f97d46c18ff1b'
            'e7f0c46fe6398dfd0fa96cf0f67f9e0f429e147750bd84fbbb6a5058bce0c37d'
            '58f3c4d08496fc756eaa7561233ee92f389505e6751201b2065e85bcc070954c'
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
    # https://gitlab.eclipse.org/eclipse/titan/titan.core/-/issues/726
    patch -p1 < "${srcdir}/0001-Fixes-for-selective-code-splitting-feature-issue-695.patch"
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
