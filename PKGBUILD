# $Id$

pkgname=dvdisaster-secretsauce
pkgver=0.79.6
pkgrel=1
pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches"
arch=(x86_64)
url="http://www.dvdisaster.com/"
license=(GPL3)
depends=(gtk2)
conflicts=(dvdisaster)
provides=(dvdisaster)
#options=('!makeflags')
source=("${pkgname}_${pkgver}.tar.bz2::http://deb.debian.org/debian/pool/main/d/dvdisaster/dvdisaster_${pkgver}.orig.tar.bz2" secretsauce.patch)
sha256sums=('7d7dfe9e7f4c2e0df248d6223340afc128367e22ebf3728284227763afd98f87'
            'a41f0388dcc24b75eff5521bf6662809c488672333394bf0a2f06151a2e8cb68')

prepare() {
  cd dvdisaster-${pkgver}
  sed 's/dvdisaster48.png/dvdisaster64.xpm/' -i contrib/dvdisaster.desktop
  # generated with: diff -Naur dvdisaster-0.72.6 dvdisaster-0.72.6.new > secretsauce.patch
  patch -p1 < ../secretsauce.patch
}

build() {
  export CFLAGS="${CFLAGS} -fcommon"
  cd dvdisaster-${pkgver}
  ./configure \
    --prefix=/usr \
   --mandir=/usr/share/man \
    --docdir=/usr/share/doc \
    --localedir=/usr/share/locale \
    --with-nls=yes 
  make
}

package() {
  cd dvdisaster-${pkgver}

  make BUILDROOT="${pkgdir}" install
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
  install -m644 -Dt "${pkgdir}/usr/share/applications/"  contrib/dvdisaster.desktop
  install -m644 -Dt "${pkgdir}/usr/share/pixmaps/" contrib/dvdisaster64.xpm
  
  # the generic SCSI driver module can be useful here
  mkdir -p "${pkgdir}/etc/modules-load.d"
  echo sg > "${pkgdir}/etc/modules-load.d/sg.conf"
  msg2 "maybe you should sudo modprobe sg"
}
