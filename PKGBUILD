# Maintainer: fitu996 <fitu996 _at_ gmail _dot_ com>

_pkgname=dvdisaster
pkgname=${_pkgname}-dev
pkgver=0.79.6
pkgrel=1
pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches (developer version)"
arch=('x86_64')
url="http://www.dvdisaster.com/"
license=('GPL')
depends=('gtk2')
provides=(dvdisaster)
options=('!makeflags')
source=(${_pkgname}-${pkgver}.tar.bz2::http://deb.debian.org/debian/pool/main/d/dvdisaster/${_pkgname}_${pkgver}.orig.tar.bz2
        ${_pkgname}-${pkgver}.tar.bz2.sig::http://deb.debian.org/debian/pool/main/d/dvdisaster/${_pkgname}_${pkgver}.orig.tar.bz2.asc)
md5sums=('b9e95850df4d344c8ec7d6cac89b6feb'
          '8774967b1900ae8dee590233e0aff3c4')
validpgpkeys=('12B31535AF903ADE9E73BA7E5A590EFEF5F6C46C'
              'E3AFE70396CCC0D9E5D8381CB0DBCA7D64F770B2')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's/dvdisaster48/dvdisaster/' contrib/dvdisaster.desktop
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --mandir=/usr/share/man --docdir=/usr/share/doc \
    --localedir=/usr/share/locale \
    --with-nls=yes 
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make BUILDROOT="${pkgdir}" install
  rm -f "${pkgdir}/usr/bin/dvdisaster-uninstall.sh"
  install -D -m 644 contrib/dvdisaster.desktop "${pkgdir}/usr/share/applications/dvdisaster.desktop"
  for i in 16 24 32 48 64 ; do
    install -D -m 644 contrib/dvdisaster${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/dvdisaster.png"
  done
}
