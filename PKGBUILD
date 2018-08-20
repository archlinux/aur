# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=tribler
_gitver=7.1.0-beta
pkgver=${_gitver//-/_}
pkgrel=1
pkgdesc="Privacy enhanced BitTorrent client with P2P content discovery"
url="https://www.tribler.org/"
arch=('any')
license=('LGPL3')
depends=('python2-cryptography' 'python2-feedparser' 'python2-apsw' 'python2-cherrypy' 'python2-plyvel'
	 'python2-pillow' 'python2-pyqt5' 'qt5-svg' 'phonon-qt5-vlc' 'python2-feedparser' 'python2-chardet'
	 'python2-psutil' 'python2-meliae' 'python2-decorator' 'python2-netifaces' 'python2-requests'
	 'python2-twisted' 'libsodium' 'libtorrent-rasterbar' 'python2-m2crypto' 'python2-configobj'
	 'python2-matplotlib' 'python2-service-identity' 'python2-keyring' 'python2-keyrings-alt'
	 'python2-libnacl' 'python2-contextlib2' 'python2-zc.lockfile' 'python2-datrie' 'python2-networkx')
optdepends=('vlc: for internal video player')
makedepends=('python2-setuptools' 'git')
provides=('python2-pyipv8')
conflicts=('python2-pyipv8')
source=("git+https://github.com/Tribler/tribler.git#tag=v$_gitver"
	'git+https://github.com/Tribler/dispersy.git#tag=v1.0'
	'git+https://github.com/devos50/pymdht.git#tag=12.7.0'
	'git+https://github.com/spesmilo/electrum#tag=3.2.2'
	'git+https://github.com/Tribler/py-ipv8.git#commit=4d2ead9e6a0ff02bcaa0cfd5cb94b70cd4d881ee') # Should have a tag
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir"/$pkgname
  git submodule init
  git config submodule.Tribler/dispersy.url "$srcdir"/dispersy
  git config submodule.Tribler/Core/DecentralizedTracking/pymdht.url "$srcdir"/pymdht
  git config submodule.electrum.url "$srcdir"/electrum
  git config submodule.py-ipv8.url "$srcdir"/py-ipv8
  git submodule update

  # Fix tribler path
  sed -i 's|/opt/tribler|/usr/share/tribler|g' systemd/anontunnel_helper@.service
  sed -i 's|/opt/tribler|/usr/share/tribler|g' systemd/tribler.service

  # Fix version
  sed -i "s|7.0.0-GIT|$_gitver|g" Tribler/Core/version.py
}

build () {
  cd "$srcdir"/$pkgname
  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname

  python2 setup.py install --root="$pkgdir" --optimize=1

  install -dm 755 "$pkgdir"/usr/{bin,share/tribler}
#  install -dm 755 "$pkgdir"/var/lib/{tribler,tunnel_helper}
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

  # Remove tests
  find "$pkgdir" -type d -name "test" -name "tests" -exec rm -rf {} \;

  # Install systemd files
  install -Dm 644 systemd/anontunnel_helper@.service "$pkgdir"/usr/lib/systemd/system/anontunnel_helper@.service
  install -Dm 644 systemd/tribler.service "$pkgdir"/usr/lib/systemd/system/tribler.service
}

