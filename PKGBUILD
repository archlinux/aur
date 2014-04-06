# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=libogc
pkgver=1.8.12
_pkgverexamples=20110620
pkgrel=1
pkgdesc="Library for Nintendo Gamecube/Wii homebrew development"
arch=('any')
url="http://www.devkitpro.org/"
license=('custom')
options=(!strip libtool staticlibs)
depends=('devkitppc')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/wii-examples-$_pkgverexamples.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gamecube-examples-$_pkgverexamples.tar.bz2")
noextract=("wii-examples-$_pkgverexamples.tar.bz2"
           "gamecube-examples-$_pkgverexamples.tar.bz2")
sha256sums=('fecfcec4a4f3d3c1c459f8fa314a6fd00e920d69968c7c1a67f7894f14ca2d4e'
            '5c48e1e847f5476bc81cf5a7f0a0e543dc9b8aeda49462210c3edb6aa2930f56'
            'ffe95676f1203ab42c45757dbbccb47527aa61db2d4c45918003cfb57d4da461')

build() {
  source /etc/profile.d/devkitppc.sh

  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  make install
  # examples
  mkdir -p "$DEVKITPRO"/examples/{wii,gamecube}
  bsdtar -x -f wii-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/wii
  bsdtar -x -f gamecube-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/gamecube
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+ 
  # license
  install -Dm644 libogc_license.txt "$pkgdir"/usr/share/licenses/$pkgname/libogc_license.txt
}
