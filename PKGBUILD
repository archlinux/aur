
pkgname=tribler
pkgver=6.4.3
pkgrel=1
pkgdesc="Privacy with BitTorrent and resilient to shut down"
url="http://www.tribler.org/"
arch=(any)
license=('LGPL')
depends=('python2-cryptography' 'python2-feedparser' 'python2-gmpy2' 'python2-apsw' 'python2-cherrypy' 'python2-plyvel' 'python2-pillow'
'python2-decorator' 'python2-netifaces' 'python2-requests' 'python2-twisted' 'wxpython2.8' 'libsodium' 'libtorrent-rasterbar' 'python2-m2crypto')
# optdepends=('python2-vlc-git: for internal video player')
makedepends=()
source=("https://github.com/Tribler/tribler/releases/download/v${pkgver}/Tribler-v${pkgver}.tar.xz")
sha1sums=('96e886834cf6c4f946484dcb0744e4f62a1bd94b')

prepare () {
  cd "${srcdir}/tribler"
  # use python2
  sed -i "s|exec python|exec python2|g" debian/bin/tribler
  # use gmpy2 instead of deprecated gmpy module
  sed -i "s|gmpy|gmpy2|g" Tribler/community/tunnel/crypto/cryptowrapper.py
}

package() {
  cd "${srcdir}/tribler"
  install -d "${pkgdir}"/usr/{bin,share/tribler}
  cp -r Tribler "${pkgdir}"/usr/share/tribler
  install -m644 logger.conf anon_test.torrent "${pkgdir}"/usr/share/tribler/
  install -d "${pkgdir}"/usr/share/{applications,pixmaps}
  install -m644 Tribler/Main/Build/Ubuntu/tribler.desktop "${pkgdir}"/usr/share/applications
  install -m644 Tribler/Main/Build/Ubuntu/tribler.xpm "${pkgdir}"/usr/share/pixmaps
  install -m644 Tribler/Main/Build/Ubuntu/tribler_big.xpm "${pkgdir}"/usr/share/pixmaps
  install -m755 debian/bin/tribler "${pkgdir}"/usr/bin
}

