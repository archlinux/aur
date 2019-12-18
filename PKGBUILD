# Maintainer: fitu996 <fitu996 _at_ gmail _dot_ com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=dvdisaster
pkgver=0.79.5
pkgrel=1
pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches"
arch=('x86_64')
url="http://www.dvdisaster.com/"
license=('GPL')
depends=('gtk2')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.bz2::http://deb.debian.org/debian/pool/main/d/dvdisaster/${pkgname}_${pkgver}.orig.tar.bz2
        ${pkgname}-${pkgver}.tar.bz2.sig::http://deb.debian.org/debian/pool/main/d/dvdisaster/${pkgname}_${pkgver}.orig.tar.bz2.asc)
sha1sums=('23ccf697031280adb5bc3e17a0d5def0421fc28d'
          '43591a1a8c0e9594650251d6466e96b9aad671e7')
validpgpkeys=('12B31535AF903ADE9E73BA7E5A590EFEF5F6C46C'
              'E3AFE70396CCC0D9E5D8381CB0DBCA7D64F770B2')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's/dvdisaster48/dvdisaster/' contrib/dvdisaster.desktop
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --mandir=/usr/share/man --docdir=/usr/share/doc \
    --localedir=/usr/share/locale \
    --with-nls=yes 
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make BUILDROOT="${pkgdir}" install
  rm -f "${pkgdir}/usr/bin/dvdisaster-uninstall.sh"
  install -D -m 644 contrib/dvdisaster.desktop "${pkgdir}/usr/share/applications/dvdisaster.desktop"
  for i in 16 24 32 48 64 ; do
    install -D -m 644 contrib/dvdisaster${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/dvdisaster.png"
  done
}
