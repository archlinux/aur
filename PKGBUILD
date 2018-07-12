# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=tribler
pkgver=7.1.0
_gitver=$pkgver-exp3
pkgrel=1
pkgdesc="Privacy enhanced BitTorrent client with P2P content discovery"
url="https://www.tribler.org/"
arch=('any')
license=('LGPL3')
depends=('python2-cryptography' 'python2-feedparser' 'python2-apsw' 'python2-cherrypy' 'python2-plyvel'
	 'python2-pillow' 'python2-pyqt5' 'qt5-svg' 'phonon-qt5-vlc' 'python2-feedparser' 'python2-chardet'
	 'python2-psutil' 'python2-meliae' 'python2-decorator' 'python2-netifaces' 'python2-requests'
	 'python2-twisted' 'libsodium' 'libtorrent-rasterbar' 'python2-m2crypto' 'python2-configobj'
	 'python2-matplotlib' 'python2-service_identity' 'python2-keyring' 'python2-keyrings-alt')
optdepends=('vlc: for internal video player')
makedepends=('python2-setuptools')
provides=('python2-pyipv8')
conflicts=('python2-pyipv8')
source=("git+https://github.com/Tribler/tribler.git#tag=v$_gitver"
	'git+https://github.com/Tribler/dispersy.git'
	'git+https://github.com/devos50/pymdht.git'
	'git+https://github.com/spesmilo/electrum'
	'git+https://github.com/Tribler/py-ipv8.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir"/$pkgname
  git submodule init
  git config submodule.Tribler/dispersy.url "$srcdir"/dispersy
  git config submodule.Tribler/Core/DecentralizedTracking/pymdht.url "$srcdir"/pymdht
  git config submodule.electrum.url "$srcdir"/electrum
  git config submodule.py-ipv8.url "$srcdir"/py-ipv8
  git submodule update
}

build () {
  cd "$srcdir"/$pkgname
  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname

  python2 setup.py install --root="$pkgdir" --optimize=1

  install -dm 755 "$pkgdir"/usr/{bin,share/tribler}
  cp -dr --no-preserve=ownership Tribler "$pkgdir"/usr/share/tribler
  cp -dr --no-preserve=ownership TriblerGUI "$pkgdir"/usr/share/tribler
  ln -s Tribler/Core/CacheDB/schema_sdb_v*.sql "$pkgdir"/usr/share/tribler/Tribler

  install -dm 644 "$pkgdir"/usr/share/{applications,pixmaps}
  install -Dm 644 Tribler/Main/Build/Ubuntu/tribler.desktop "$pkgdir"/usr/share/applications
  install -Dm 644 Tribler/Main/Build/Ubuntu/tribler.xpm "$pkgdir"/usr/share/pixmaps
  install -Dm 644 Tribler/Main/Build/Ubuntu/tribler_big.xpm "$pkgdir"/usr/share/pixmaps
  install -Dm 755 debian/bin/tribler "$pkgdir"/usr/bin
  install -Dm 644 logger.conf "$pkgdir"/usr/share/tribler/
  install -Dm 644 run_tribler.py "$pkgdir"/usr/share/tribler/
  install -Dm 644 check_os.py "$pkgdir"/usr/share/tribler/

  cp -dr --no-preserve=ownership twisted "$pkgdir"/usr/share/tribler
  cp -dr --no-preserve=ownership electrum "$pkgdir"/usr/share/tribler
}

