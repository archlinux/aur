# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=libogc
pkgver=1.8.15
_pkgverexamples=20161115
pkgrel=1
pkgdesc="Library for Nintendo Gamecube/Wii homebrew development"
arch=('any')
url="http://www.devkitpro.org"
license=('custom')
depends=('devkitppc')
optdepends=('libfat-ogc: fat filesystem access from homebrew'
            'devkitppc-portlibs: various ported libraries for homebrew use')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/wii-examples-$_pkgverexamples.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gamecube-examples-$_pkgverexamples.tar.bz2")
noextract=("wii-examples-$_pkgverexamples.tar.bz2"
           "gamecube-examples-$_pkgverexamples.tar.bz2")
sha256sums=('a8d29e346776fd4afeaebdfe01ded4b20b7e25e5363abb5629b623248c499ff0'
            '451a656b3af9900be1f1ae1253573d13fb448a27818ed2a403174ec28a749e56'
            '6ef8a17aa863916865aab635a6e026ec1eb16d52b1a196e555c84fe53ad6a19f')
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkitppc.sh

  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  make install
  # examples
  install -d "$DEVKITPRO"/examples/{wii,gamecube}
  bsdtar xf wii-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/wii
  bsdtar xf gamecube-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/gamecube
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+ 
  # license
  install -Dm644 libogc_license.txt "$pkgdir"/usr/share/licenses/libogc/libogc_license.txt
}
