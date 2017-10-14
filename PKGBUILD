# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=libogc
pkgver=1.8.17
_pkgverexamples=20170228
pkgrel=1
pkgdesc="Library for Nintendo Gamecube/Wii homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom')
depends=('devkitppc')
optdepends=('libfat-ogc: fat filesystem access from homebrew'
            'devkitppc-portlibs: various ported libraries for homebrew use')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/wii-examples-$_pkgverexamples.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gamecube-examples-$_pkgverexamples.tar.bz2")
noextract=("wii-examples-$_pkgverexamples.tar.bz2"
           "gamecube-examples-$_pkgverexamples.tar.bz2")
sha256sums=('44324fdad655efa237c4b894e6cc0eb4c359ee816e62d40e527e9e5efb081ed7'
            '23d08ca833aa68af012cc69e8cb3a3393a0f6501fd0a6008a08d72411785c8f8'
            'daff012038ac36a8214d85225b4e5b3f6f343c29c3644be8c531df4a08879221')
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
