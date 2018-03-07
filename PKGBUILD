# $Id: PKGBUILD 240850 2015-06-15 06:19:33Z giovanni $
# Maintainer: Lin Ruoshui <lin.ruohshoei@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=amule-dlp
pkgver=2.3.2
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
source=("https://github.com/persmule/amule-dlp/archive/${pkgver}-dlp.tar.gz"
	#"https://nchc.dl.sourceforge.net/project/amule/aMule/2.3.2/aMule-${pkgver}.tar.bz2"
        'amuled.systemd'
        'amuleweb.systemd'
	'crypto++.patch'
        )
md5sums=('a53d8a746e2632007b9d864f4ac13c20'
         '59772c41860e238f1c822feb8ca8d47f'
         '05975c5d94bfc41fddb894d98b1115d5'
         'e231999919fc01123db59bf002ffef3b')

#manually dlp patch 
#prepare() {
#    cd "${srcdir}/${pkgname}-${pkgver}-dlp"
#    patch -p1 < ../amule-dlp.patch
#    
#}

#add crypto++.patch from Tommy Jerry Mairo
prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}-dlp"
  patch -p1 -i ../crypto++.patch 
  cp src/aMule.xpm amule.xpm
}         
         
build() {
  cd "${srcdir}/${pkgname}-${pkgver}-dlp"
./autogen.sh
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
  cd "${srcdir}/${pkgname}-${pkgver}-dlp"

  make DESTDIR=${pkgdir} install

  install -D -m644 "${srcdir}/amuled.systemd" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -D -m644 "${srcdir}/amuleweb.systemd" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
}
