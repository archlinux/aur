# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Florian Maunier <mail@fmauneko.eu>

pkgname=libogc-git
pkgver=1.8.11.r10.g3c6f3dd
_pkgverexamples=20110620
pkgrel=1
pkgdesc="Library for Nintendo Gamecube/Wii homebrew development (development version)"
arch=('any')
url="http://www.devkitpro.org/"
license=('custom')
options=(!strip libtool staticlibs)
depends=('devkitppc')
makedepends=('git')
conflicts=('libogc')
provides=('libogc')
source=("git+http://git.code.sf.net/p/devkitpro/libogc"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/wii-examples-$_pkgverexamples.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gamecube-examples-$_pkgverexamples.tar.bz2")
noextract=("wii-examples-$_pkgverexamples.tar.bz2"
           "gamecube-examples-$_pkgverexamples.tar.bz2")
sha256sums=('SKIP'
            '5c48e1e847f5476bc81cf5a7f0a0e543dc9b8aeda49462210c3edb6aa2930f56'
            'ffe95676f1203ab42c45757dbbccb47527aa61db2d4c45918003cfb57d4da461')

pkgver() {
  cd libogc
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd libogc

  source /etc/profile.d/devkitppc.sh
  make
}

package() {
  cd libogc
  export DEVKITPRO="$pkgdir"/opt/devkitpro

  make install
  # examples
  mkdir -p "$DEVKITPRO"/examples/{wii,gamecube}
  bsdtar -x -f ../wii-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/wii
  bsdtar -x -f ../gamecube-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/gamecube
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+ 
  # license
  install -Dm644 libogc_license.txt "$pkgdir"/usr/share/licenses/$pkgname/libogc_license.txt
}
