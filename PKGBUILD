# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Teo Mrnjavac <teo.mrnjavac@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: lh <jarryson@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>

pkgname=esd-oss
pkgver=0.2.41
pkgrel=1
pkgdesc="Enlightened Sound Daemon without ALSA dependence"
url="http://www.tux.org/~ricdude/EsounD.html"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('audiofile' 'tcp-wrappers')
source=(http://ftp.gnome.org/pub/GNOME/sources/esound/0.2/esound-${pkgver}.tar.bz2
        esd-0.2.38-alsa-drain.patch
        esd)
md5sums=('8d9aad3d94d15e0d59ba9dc0ea990c6c'
        '3de93efcd1bc196a3585e6aef50eac48'
        'a4c76e7c7f75b201ea7ab6fb15b47472')
provides=("esd=$pkgver" "esound=$pkgver")
conflicts=('esd' 'esound')
backup=('etc/esd.conf')
options=('!libtool')

build() {
  cd ${srcdir}/esound-${pkgver}
  patch -Np1 -i ${srcdir}/esd-0.2.38-alsa-drain.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static \
              --with-audiofile --with-libwrap --disable-alsa --disable-artstest
  export LDFLAGS='-lm'
  make -e
}

package() {
  cd ${srcdir}/esound-${pkgver}
  make DESTDIR=${pkgdir} install
  install -m755 -d ${pkgdir}/etc/rc.d
  install -m755 ${srcdir}/esd ${pkgdir}/etc/rc.d/esd
}
