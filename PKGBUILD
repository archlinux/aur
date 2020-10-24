# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=tribler
pkgver=7.4.4
pkgrel=4
pkgdesc='Privacy enhanced BitTorrent client with P2P content discovery'
url='https://www.tribler.org'
arch=('any')
license=('LGPL3')
depends=('python-pyqt5' 'python-aiohttp' 'python-aiohttp-apispec' 'libtorrent-rasterbar'
         'python-cryptography' 'python-libnacl' 'python-pony' 'python-lz4'
         'python-psutil' 'python-networkx' 'python-pyqtgraph' 'python-chardet'
         'python-cherrypy' 'python-configobj' 'python-netifaces' 'python-bitcoinlib'
         'python-twisted' 'python-pyopenssl' 'python-pyasn1' 'vlc')
makedepends=('git')
#checkdepends=('python-pytest-runner')
source=("https://github.com/Tribler/tribler/releases/download/v$pkgver/Tribler-v$pkgver.tar.xz")
sha512sums=('931dff82bb7f83de8d5b63ab8a712cf371a7361a75e8bbb7c490d8b56aa55d1586586ae6e14f28c3c8ad5daf938eb2bbc05b67f74bcc9a3a23e38f8fc909d722')

prepare() {
  cd $pkgname

  # Fix tribler path
  sed -i '/PYTHONPATH/d
          s|/opt/tribler|/usr/share/tribler|g
          s|ExecStart=.*|ExecStart=tribler|' systemd/anontunnel_helper@.service
  sed -i 's|/opt/tribler|/usr/share/tribler|g' systemd/tribler.service

  # Fix version info
  sed -e "s|version_id =.*|version_id = \"${pkgver%_*}\"|g" \
      -e "s|build_date =.*|build_date = \"$SOURCE_DATE_EPOCH\"|g" \
        -i src/tribler/tribler-core/tribler_core/version.py
}

build () {
  cd $pkgname

  python setup.py build
}

#check() {
#  cd $pkgname
#
#  python setup.py test
#}

package() {
  cd $pkgname

  # Install python modules
  python setup.py install --root="$pkgdir" --optimize=1

  # Install binary files/assets
  install -dm 755 "$pkgdir"/usr/{bin,share/tribler}
  cp -dr --no-preserve=ownership Tribler "$pkgdir"/usr/share/tribler
  cp -dr --no-preserve=ownership TriblerGUI "$pkgdir"/usr/share/tribler
  ln -s Tribler/Core/CacheDB/schema_sdb_v*.sql "$pkgdir"/usr/share/tribler/Tribler

  install -dm 755 "$pkgdir"/usr/share/{applications,pixmaps}
  install -Dm 644 Tribler/Main/Build/Ubuntu/tribler.desktop "$pkgdir"/usr/share/applications
  install -Dm 644 Tribler/Main/Build/Ubuntu/tribler.xpm "$pkgdir"/usr/share/pixmaps
  install -Dm 644 Tribler/Main/Build/Ubuntu/tribler_big.xpm "$pkgdir"/usr/share/pixmaps
  install -Dm 755 debian/bin/tribler "$pkgdir"/usr/bin
  install -Dm 644 logger.conf "$pkgdir"/usr/share/tribler/
  install -Dm 644 run_tribler.py "$pkgdir"/usr/share/tribler/
  install -Dm 644 check_os.py "$pkgdir"/usr/share/tribler/

  cp -dr --no-preserve=ownership twisted "$pkgdir"/usr/share/tribler

  # Remove test folders
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/Tribler/Test
  rm -rf "$pkgdir"/usr/share/tribler/Tribler/Test

  # Install systemd files
  install -Dm 644 systemd/anontunnel_helper@.service "$pkgdir"/usr/lib/systemd/system/anontunnel_helper@.service
  install -Dm 644 systemd/tribler.service "$pkgdir"/usr/lib/systemd/system/tribler.service
}

