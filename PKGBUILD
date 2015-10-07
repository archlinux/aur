# $Id: PKGBUILD 240850 2015-06-15 06:19:33Z giovanni $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=amule-dlp
pkgver=10871
pkgrel=1
pkgdesc="An eMule-like client for ed2k p2p network"
arch=('i686' 'x86_64')
url="http://www.amule.org"
license=('GPL')
depends=('wxgtk' 'wxgtk2.8' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
optdepends=('antileech')
provides=(amule)
conflicts=(amule)
install=amule.install
source=("http://amule.sourceforge.net/tarballs/aMule-SVN-r${pkgver}.tar.bz2"
        'amuled.systemd'
        'amuleweb.systemd'
        'amule-dlp.patch'
        )
md5sums=('f3c666b6fa518a3e6e2c21670c243292'
         '59772c41860e238f1c822feb8ca8d47f'
         '05975c5d94bfc41fddb894d98b1115d5'
         '8f3bc2d105b6acf2d25b19b01bdfbe30')
prepare() {
    cd "${srcdir}/aMule-SVN-r${pkgver}"
    patch -p1 < ../amule-dlp.patch
    
}
         
         
build() {
  cd "${srcdir}/aMule-SVN-r${pkgver}"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-cas \
              --enable-wxcas \
              --enable-amule-daemon \
              --enable-amulecmd \
              --enable-amule-gui \
              --enable-alc \
              --enable-alcc \
              --enable-webserver \
              --disable-debug \
              --enable-optimize \
              --enable-ccache \
              --enable-geoip \
              --enable-upnp \
              --enable-dlp \
              --with-wxversion=2.8

  make
}

package() {
  cd "${srcdir}/aMule-SVN-r${pkgver}"

  make DESTDIR=${pkgdir} install

  install -D -m644 "${srcdir}/amuled.systemd" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -D -m644 "${srcdir}/amuleweb.systemd" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
}
