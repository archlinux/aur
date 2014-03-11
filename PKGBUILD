# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=steins-gate
pkgver=0.2.0
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT' 'LGPL3' 'GPL3')
pkgdesc='Libre reimplementation of the Steins;Gate visual novel'
url='http://dev.pulsir.eu/krofna/'
depends=('boost-libs' 'sfml' 'gst-plugins-base-libs' 'ttf-arphic-uming')
makedepends=('cmake' 'boost')
source=(libnpa-$pkgver.tar.gz::"https://github.com/FGRE/libnpa/archive/v$pkgver.tar.gz"
        libnpengine-$pkgver.tar.gz::"https://github.com/FGRE/libnpengine/archive/v$pkgver.tar.gz"
        $pkgname-$pkgver.tar.gz::"https://github.com/FGRE/steins-gate/archive/v$pkgver.tar.gz")
sha256sums=('85f1727bc3e2cf745275dac84b454cceb8152c27eeff24ff9de81f105e1c5668'
            '66c79ba74e49e2286186c3e14fe2c58e170ecff321ec60fbdb5ab2864f32e981'
            '7fb23b66f1163b5d40f07931f6045b87b2f65c767b80dc950a3414fe80c9319e')

prepare() {
  for _name in libnpa libnpengine steins-gate; do
    # shuffle the directories
    rm -rf "$srcdir"/$_name
    mv "$srcdir"/$_name-$pkgver "$srcdir"/$_name
  done

  # set font path
  sed 's|cjkuni-uming|TTF|' -i libnpengine/src/nsbinterpreter.cpp
}

build() {
  for _name in libnpa libnpengine steins-gate; do
    msg2 "Building $_name..."
    cd "$srcdir"/$_name

    cmake .
    make
  done
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm755 libnpa/libnpa.so "$pkgdir"/usr/lib/libnpa.so
  install -Dm755 libnpengine/libnpengine.so "$pkgdir"/usr/lib/libnpengine.so
  install -Dm644 $pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-$pkgname
  install -Dm644 libnpa/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-libnpa
  install -Dm644 libnpengine/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-libnpengine
}
