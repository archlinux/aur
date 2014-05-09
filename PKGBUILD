# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=steins-gate
pkgver=0.3.3
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
sha256sums=('93f0e86a9d87b27df76b5f3b7ad96ffeea956126d422791db93e38965bdef9cb'
            '46ac8ccfc9953c33b63fa1bf8c4f51c7bd8942b0254c6389058a66c76c21f825'
            '6fb4610b0ec821791a3b28cd3f159686fb8f8072237d10fe73dd7050818d3511')

prepare() {
  for _name in libnpa libnpengine steins-gate; do
    # shuffle the directories
    rm -rf "$srcdir"/$_name
    mv "$srcdir"/$_name-$pkgver "$srcdir"/$_name
  done

  # patch font path
  sed 's|cjkuni-uming|TTF|' -i libnpengine/src/nsbinterpreter.cpp
}

build() {
  for _name in libnpa libnpengine steins-gate; do
    msg2 "Building $_name..."
    cd "$srcdir"/$_name

    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
  done
}

package() {
  for _name in libnpa libnpengine steins-gate; do
    msg2 "Installing $_name..."
    cd "$srcdir"/$_name

    make DESTDIR="$pkgdir/" install

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-$_name
  done
}
