# Maintainer: Patric Schmitz <bzk0711@aol.com>
# Ported from the synergy-git AUR package

_pkgname=synergy
pkgname=$_pkgname-free
pkgver=1.4.18
pkgrel=1
pkgdesc='Share mouse and keyboard among many computers. Free version.'
url='http://synergy-foss.org'
arch=('i686' 'x86_64')
depends=('libxtst' 'qt5-base' 'avahi')
makedepends=('libxt' 'cmake' 'unzip')
optdepends=(
  'openssl: encryption support'
)
license=('GPL2')
source=(
  "https://github.com/symless/synergy/archive/1.4.18.tar.gz"
  "${_pkgname}s_at.socket"
  "${_pkgname}s_at.service"
)
provides=("$_pkgname")
conflicts=("$_pkgname")
sha512sums=(
   '6dd209bc593f5d1081907b357a88b6583fbf4ba2145a12e4a5e17e615a291a885b6a9adae269039a1ce86cd4e75cc52395431e63e762a682584d996b8256ad9b'
  'f9c124533dfd0bbbb1b5036b7f4b06f7f86f69165e88b9146ff17798377119eb9f1a4666f3b2ee9840bc436558d715cdbfe2fdfd7624348fae64871f785a1a62'
  'e85cc3452bb8ba8fcccb1857386c77eb1e4cabb149a1c492c56b38e1b121ac0e7d96c6fcbd3c9b522d3a4ae9d7a9974f4a89fc32b02a56f665be92af219e371c'
)

prepare() {
  cd "${_pkgname}-${pkgver}/ext"
  unzip -o gmock-1.6.0.zip -d gmock-1.6.0
  unzip -o gtest-1.6.0.zip -d gtest-1.6.0
  unzip -o cryptopp562.zip -d cryptopp562
}

build() {
  cd "${_pkgname}-${pkgver}"

  CXXFLAGS=-Wno-error=terminate cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make

  cd src/gui
  qmake
  make
}

package() {
  # install systemd service and socket
  install -Dm644 ${_pkgname}s_at.service "$pkgdir/usr/lib/systemd/system/${_pkgname}s@.service"
  install -Dm644 ${_pkgname}s_at.socket "$pkgdir/usr/lib/systemd/system/${_pkgname}s@.socket"

  cd "${_pkgname}-${pkgver}"

  # install binary
  install -Dm755 bin/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 bin/${_pkgname}c "$pkgdir/usr/bin/${_pkgname}c"
  install -Dm755 bin/${_pkgname}d "$pkgdir/usr/bin/${_pkgname}d"
  install -Dm755 bin/${_pkgname}s "$pkgdir/usr/bin/${_pkgname}s"
  install -Dm755 bin/syntool "$pkgdir/usr/bin/syntool"
  install -Dm755 bin/u$_pkgname "$pkgdir/usr/bin/u$_pkgname"

  # install config
  install -Dm644 doc/$_pkgname.conf.example "$pkgdir/etc/$_pkgname.conf.example"
  install -Dm644 doc/$_pkgname.conf.example-advanced "$pkgdir/etc/$_pkgname.conf.example-advanced"
  install -Dm644 doc/$_pkgname.conf.example-basic "$pkgdir/etc/$_pkgname.conf.example-basic"

  # install manfiles
  install -Dm644 doc/${_pkgname}c.man "$pkgdir/usr/share/man/man1/${_pkgname}c.1"
  install -Dm644 doc/${_pkgname}s.man "$pkgdir/usr/share/man/man1/${_pkgname}s.1"

  # install desktop/icon stuff
  install -Dm644 res/$_pkgname.ico "$pkgdir/usr/share/icons/$_pkgname.ico"
  install -Dm644 res/$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
