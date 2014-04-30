# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=steins-gate
pkgver=0.3.2
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
sha256sums=('e3ee341501fe0838396d9046747ea9bf6fe533e536934b46065e1cdf6d479ed0'
            'd46af8c74584466e5a38f762040973fa9c14e89477b3249d5489c4468ccc85f8'
            '2519d980ed3f0819de2b96002e99657db487365aea7e06d47ac480bcc8976e66')

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
