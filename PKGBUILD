# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: 0strodamus <0strodamus at cox dot net>
# Contributor: Rob McCathie <korrode AT gmail>
# Contributor: n00b <dannyurvt (at) gmail.com>
#
# MATE Engrampa package without Caja dependency and with Thunar integration
#
# note: if you get "No suitable archive manager found" errors, you need
#       to adjust Xfce Settings > MIME Type Editor associations for Engrampa

_pkgname=engrampa
pkgname=${_pkgname}-thunar
pkgver=1.16.0
pkgrel=1
pkgdesc="Archive manipulator for MATE without Caja dependency"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bzip2' 'desktop-file-utils' 'gzip' 'libarchive' 'tar' 'gtk3')
makedepends=('mate-common' 'yelp-tools')
optdepends=('unrar: for RAR uncompression'
            'zip: for ZIP archives' 'unzip: for ZIP archives'
            'p7zip: 7zip compression utility' 'arj: for ARJ archives'
            'unace: extraction tool for the proprietary ace archive format'
            'yelp: for reading MATE help documents'
            'thunar-archive-plugin: create and extract archives in Thunar')
provides+=("${_pkgname}")
options=( '!emptydirs')
source=("http://pub.mate-desktop.org/releases/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"
        'fr-rpm-bsdtar.patch'
        'engrampa.tap')
sha1sums=('90865e0c59bec33ed899c3a0a8d2787aa09d526b'
          '219b05a979bf6f249aaae27964f02345fd81168d'
          '84f023a660c77cf046cff71d1d890f7de5af4110')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # this patch 'depends' on libarchive
    patch -Np1 -i "${srcdir}/fr-rpm-bsdtar.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --disable-static \
        --disable-packagekit \
        --disable-caja-actions \
        --without-cajadir \
        --enable-magic \
        --disable-schemas-compile
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm755 ${srcdir}/engrampa.tap ${pkgdir}/usr/lib/xfce4/thunar-archive-plugin/engrampa.tap
}
