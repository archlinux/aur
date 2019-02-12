# Maintainer: Lin Ruoshui <lin[dot]ruohshoei[at]gmail[dot]com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=amule-dlp
pkgver=2.3.2
pkgrel=2
pkgdesc="An eMule-like client for ed2k p2p network"
arch=('i686' 'x86_64')
url="http://www.amule.org"
license=('GPL')
depends=('wxgtk2'  'gd' 'geoip' 'libupnp' 'crypto++' 'libsm') #'wxgtk2.8'
optdepends=('antileech')
provides=(amule)
conflicts=(amule amule-dlp-git amule-git)
install=amule.install
source=("https://github.com/persmule/amule-dlp/archive/${pkgver}-dlp.tar.gz"
        'amuled.systemd'
        'amuleweb.systemd'
	'crypto++.patch'
        )
sha512sums=('7998a7dc3a59bfc9d7d8e5575dec7207fa73bb6c8dca9c2608a59d67cb2ffcb9f24e1dc0b2acb806f78c1ed2ed6f335aaa0936d8bc5e1616c7d3121fe312f785'
            '13dbaee96658ca34e76bfdcf1e65895a24b57bc64bb846ae50d3d64a2e65047d90c13c0b14a50947d0ff9ccf30c4764380da05383650995d3798981068b87ebd'
            'fbb58e2d0229e72e2192eae724e812a158443dc8d465ce14f94c184bcb575079e5e568c24bfbd132d9a6edf8651e7d7c45ca2ce46209bd04e27948503f6bbcdc'
            'd6a9178b4063044679e47f40fea192d167334efbac152f0964c5d2c313ae12dbc8876a81721233113f4933792d5a28b7aeb133d434636e7000f3e6edafa9933c')

#add dlp patch
#add crypto++.patch from Tommy Jerry Mairo
prepare(){
  cd "${pkgname}-${pkgver}-dlp"
  patch -p1 -i ../crypto++.patch 
  cp src/aMule.xpm amule.xpm
}         
         
build() {
  cd "${pkgname}-${pkgver}-dlp"
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
              --enable-dlp #\
              #--with-wxversion=2.8
  make
}

package() {
  install -D -m644 "amuled.systemd" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -D -m644 "amuleweb.systemd" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
  cd "${pkgname}-${pkgver}-dlp"
  make DESTDIR=${pkgdir} install
}
