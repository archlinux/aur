# Maintainer: Dan "Streetwalrus" Elkouby <streetwalkermc@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Sebastian.Salich@gmx.de
# Contributor: Doc Angelo

_pkgname=mumble
pkgname=$_pkgname-minimal
pkgver=1.2.19
pkgrel=3
arch=('x86_64')
pkgdesc="A voice chat application similar to TeamSpeak, bare minimum client"
license=('BSD')
depends=('qt4' 'speex' 'lsb-release' 'protobuf' 'libpulse' 'opus')
makedepends=('boost' 'mesa')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
url="https://www.mumble.info/"
source=(https://github.com/mumble-voip/mumble/releases/download/${pkgver}/mumble-${pkgver}.tar.gz{,.sig}
        https://github.com/mumble-voip/mumble/commit/ea861fe86743c8402bbad77d8d1dd9de8dce447e.patch)
sha512sums=('f91111194a899149b500a94afcf7cc5b9691c7ce8669f07fca2c66adbb3916ddb863bf703d04fb8387133fb75f3c8edb52974d1acf3febfafa1f73da19946de4'
            'SKIP'
            'fcdaf2a3575e3871fe4003b93364a70a7c7029beb64ba5e24931abbe3898b72791848b5cf78ccf48eee5942a37f696a5134d061c2b8d60b66913abd701758330')
validpgpkeys=('C4666C6767A26017CE68406988048D0D625297A0') # Mumble Automatic Build Infrastructure 2017 <mumble-auto-build-2017@mumble.info>

prepare() {
  cd "$srcdir"/$_pkgname-$pkgver

  # https://github.com/mumble-voip/mumble/pull/3287
  patch -p1 < ../ea861fe86743c8402bbad77d8d1dd9de8dce447e.patch
}

build() {
  cd "$srcdir"/$_pkgname-$pkgver

  # Building mumble
  qmake-qt4 main.pro \
    CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server \
    no-embed-qt-translations no-update packaged no-speechd no-overlay no-bonjour no-plugins" \
    DEFINES+="PLUGIN_PATH=/usr/lib/mumble"
  make release
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  # bin stuff
  install -m755 -D ./release/mumble "$pkgdir"/usr/bin/mumble

  # lib stuff
  install -m755 -d "$pkgdir"/usr/lib/mumble
  install -m755 -D ./release/libcelt* "$pkgdir"/usr/lib/mumble/

  # other stuff
  install -m644 -D ./scripts/mumble.desktop "$pkgdir"/usr/share/applications/mumble.desktop
  install -m755 -d "$pkgdir"/usr/share/man/man1
  install -m644 -D ./man/mum* "$pkgdir"/usr/share/man/man1/
  install -m644 -D ./icons/mumble.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/mumble.svg
  install -m644 -D ./LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim: sw=2:ts=2 et:
