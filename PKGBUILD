# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sid Karunaratne <sid at karunaratne dot net>
# Contributor: Nathan Osman <nathan at quickmediasolutions dot com>
# Contributor: BlackEagle <ike.devolder@gmail.com>

pkgname=nitroshare
pkgver=0.3.4
pkgrel=5
pkgdesc='LAN file sender application, designed to make transferring files from one device to another extremely simple'
arch=('x86_64')
url='https://nitroshare.net'
license=('MIT')
depends=('hicolor-icon-theme' 'python' 'qhttpengine' 'qmdnsengine' 'qt5-svg')
makedepends=('cmake' 'ninja' 'qt5-tools')
optdepends=('nemo-python: integration with Nemo'
            'python-caja: integration with Caja'
            'python-nautilus: integration with Nautilus')
source=("https://github.com/nitroshare/$pkgname-desktop/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'nitroshare.appdata.xml'
        'qt-5.11.patch')
sha256sums=('29874e5909c29211a3c9e13f8c0f49b901ec2996e5d60d80af80d2fb80c3d7ec'
            '199d7b6d510e15483ca3c995083d764762a88144a2d6230467496e5e6b28bba5'
            'e2a8417f36a5df37c5fb34c1a371f86b0059f48bf6dd588fc776ca7c38a67cd5')

prepare() {
  # Fix build with Qt 5.11
  patch -d $pkgname-desktop-$pkgver -Np1 -i ../qt-5.11.patch

  # Port filemanager extension to python3
  sed -i 's/from urllib/from urllib.request/
          s/from urlparse/from urllib.parse/' \
    $pkgname-desktop-$pkgver/src/dist/nitroshare.py.in
}

build() {
  cmake -S $pkgname-desktop-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
  install -Dm644 $pkgname-desktop-$pkgver/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
