# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.17
_pkgbase=engrampa
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="Archive manipulator for MATE (GTK3 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('bzip2' 'desktop-file-utils' 'glib2' 'gtk3' 'gtk-update-icon-cache' 'gzip'
         'libarchive' 'tar')
makedepends=('caja-dev'' 'intltool>=0.50.1' 'yelp-tools')
optdepends=('caja: file archiver extension'
            'unrar: for RAR uncompression'
            'zip: for ZIP archives' 'unzip: for ZIP archives'
            'p7zip: 7zip compression utility' 'arj: for ARJ archives'
            'unace: extraction tool for the proprietary ace archive format'
            'yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz"
        fr-rpm-bsdtar.patch)
sha1sums=('90865e0c59bec33ed899c3a0a8d2787aa09d526b'
          '219b05a979bf6f249aaae27964f02345fd81168d')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
    cd "${srcdir}/${_pkgbase}-gtk3"
    # This patch 'depends' on libarchive
    patch -Np1 -i "${srcdir}/fr-rpm-bsdtar.patch"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=3.0 \
        --disable-static \
        --disable-packagekit
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
