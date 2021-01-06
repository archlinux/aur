# Maintainer: morguldir <morugldir@protonmail.com
# Contributor: metscoin <mets_coin@outlook.com>

pkgname=gobyte-qt
pkgver=0.12.2.4
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.gobyte.network/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(gobyte)
install=gobyte-qt.install
source=("${pkgname%-git}::git+https://github.com/gobytecoin/gobyte.git#tag=v$pkgver"
        "$pkgname.desktop"
        "qpainterpath.patch"
        "boostbind.patch")

sha256sums=('SKIP'
            'cfedcb808ba80d55409394db7483709daac526b351ceada402588dab3a83d84b'
            '22b6bb675dc46f4cf0bc5b2d5f2549f52240bc874790f7138c9166e3d49fa863'
            '0648a93bae4c361999484e0001f202ab8525cd04fed848f640708779cc68ae54')

prepare()
{
  cd "$srcdir/$pkgname"
  git apply ../qpainterpath.patch
  git apply ../boostbind.patch
  ./autogen.sh
  ./configure --with-gui=qt5
}

build() {
  cd "$srcdir/$pkgname"
  make
}


package() {
  install -Dm644 gobyte-qt.desktop "$pkgdir"/usr/share/applications/gobyte.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/gobyte-qt "$pkgdir"/usr/bin/gobyte-qt
  install -Dm644 share/pixmaps/gobyte128.png "$pkgdir"/usr/share/pixmaps/gobyte128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
