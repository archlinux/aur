# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=libmirko
pkgver=0.9.7
_pkgverexamples=20051021
pkgrel=1
pkgdesc="Library for GP32 homebrew development"
arch=('any')
url="http://www.devkitpro.org"
license=('custom')
depends=('devkitarm')
options=(!strip staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gp32-examples-$_pkgverexamples.tar.bz2")
sha256sums=('65dff651f83df38ec2110f6d9d8593735ababb03603069d06ce267b3adadc3be'
            '7d542f3771cc6bdfef385d82aedf1bb8acf854fc96468b061e84b8dcbae1a755')
noextract=("gp32-examples-$_pkgverexamples.tar.bz2")

prepare() {
  # this prevents overwriting our source archive
  sed '78d' -i Makefile
}

build() {
  source /etc/profile.d/devkitarm.sh
  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  make install
  # examples
  install -d "$DEVKITPRO"/examples/gp32
  bsdtar -x -f gp32-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/gp32
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+
  # license
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/libmirko/license.txt
}
