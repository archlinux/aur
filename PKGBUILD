# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.14
_pkgbase=engrampa
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=2
pkgdesc="Archive manipulator for MATE (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'gzip' 'libarchive' 'tar' 'unzip' 'zip')
makedepends=('caja-gtk2' 'intltool' 'itstool')
optdepends=('caja: file archiver extension'
            'p7zip: 7Z and ARJ archive support'
            'unace: ACE archive support'
            'unrar: RAR archive support')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz"
        fr-rpm-bsdtar.patch)
sha1sums=('1245f5203b37b842cfaf818781b17cd22f1234b1'
          '219b05a979bf6f249aaae27964f02345fd81168d')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    # This patch 'depends' on libarchive
    patch -Np1 -i "${srcdir}/fr-rpm-bsdtar.patch"
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=2.0 \
        --disable-packagekit

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
