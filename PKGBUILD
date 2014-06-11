# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=steins-gate
pkgver=0.3.5
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
sha256sums=('94bbeb21f283d1963dc80467e674739cdc072ff8b52268ddf48e5f8d13281265'
            '9b7e049c6cb78140e9d91a18231afa6197b9412fcf9e45cdf3cb4ec4f12a2b8c'
            '5078b2e8b47284da0521eca1326eb72a9afd9cd88939fe3222f73a9b510e6288')

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
