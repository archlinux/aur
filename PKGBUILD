# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: Rob McCathie <korrode AT gmail>
# Contributor: n00b <dannyurvt (at) gmail.com>
#
# MATE Engrampa package without Caja dependency and with Thunar integration
#
# note: if you get "No suitable archive manager found" errors, you need
#       to adjust Xfce Settings > MIME Type Editor associations for Engrampa

pkgname=engrampa-thunar
_pkgname=engrampa
pkgver=1.12.0
_pkgver1.12
pkgrel=1
pkgdesc="Archive manipulator for MATE without Caja dependency (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bzip2' 'desktop-file-utils' 'gtk2' 'gzip' 'libarchive' 'tar')
makedepends=('mate-common' 'yelp-tools')
optdepends=('unrar: for RAR uncompression'
            'zip: for ZIP archives' 'unzip: for ZIP archives'
            'p7zip: 7zip compression utility' 'arj: for ARJ archives'
            'unace: extraction tool for the proprietary ace archive format'
            'yelp: for reading MATE help documents'
            'thunar-archive-plugin: create and extract archives in Thunar')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname)
options=( '!emptydirs')
source=("http://pub.mate-desktop.org/releases/${_pkgver}/${_pkgname}-${pkgver}.tar.xz"
        'fr-rpm-bsdtar.patch'
        'engrampa.tap')
sha1sums=('76e2ac2806c6dcf6744766df6f9d0c056df5e301'
          '219b05a979bf6f249aaae27964f02345fd81168d'
          '84f023a660c77cf046cff71d1d890f7de5af4110')
install=engrampa.install

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
        --with-gtk=2.0 \
        --disable-static \
        --disable-packagekit \
        --disable-caja-actions -without-cajadir
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm755 ${srcdir}/engrampa.tap ${pkgdir}/usr/lib/xfce4/thunar-archive-plugin/engrampa.tap
}
