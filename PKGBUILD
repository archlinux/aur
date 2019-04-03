# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=enlightenment16
pkgver=1.0.19
_themever=1.0.1
pkgrel=1
pkgdesc="A fast, flexible, and very extensible Window Manager"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'custom')
depends=('libxinerama' 'imlib2' 'perl' 'pango' 'libxcomposite'
         'libxrandr' 'libpulse' 'libxdamage')
source=(http://downloads.sourceforge.net/sourceforge/enlightenment/e16-${pkgver}.tar.gz
        http://downloads.sourceforge.net/enlightenment/e16-themes-${_themever}.tar.gz)
sha1sums=('0c6e4c684d95d115e423dbc9e234693f0e9eb952'
          'ae34e2df1294198795736bf953bf695aba93b710')

build() {
  pushd e16-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --enable-sound-pulse
  make
  popd
  
  cd e16-themes-${_themever}
  ./configure --prefix=/usr
}

package() {
  cd e16-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m755 "${pkgdir}/usr/share/e16/misc/Xclients.e16-gnome.sh" "${pkgdir}/usr/bin/e16-gnome"
  install -D -m755 "${pkgdir}/usr/share/e16/misc/Xclients.e16-kde.sh" "${pkgdir}/usr/bin/e16-kde"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -D -m644 fonts/COPYRIGHT.Vera "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT.Vera"

  cd "${srcdir}/e16-themes-${_themever}"
  make DESTDIR="${pkgdir}" install
  chown -R root:root "${pkgdir}"/usr/share/*
}
