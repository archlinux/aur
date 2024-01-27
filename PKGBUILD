pkgname=autoconf2.70
pkgver=2.70.r0.g97fbc5c1
pkgrel=1
pkgdesc="An extensible package of M4 macros that produce shell scripts to automatically configure software source code packages"
arch=('any')
url="https://www.gnu.org/software/autoconf/autoconf.html"
license=('GPL2' 'custom')
depends=('sh' 'perl' 'awk' 'm4' 'texinfo')
makedepends=('git' 'help2man')
provides=("autoconf=$pkgver")
conflicts=("autoconf-old")
source=("git+https://git.savannah.gnu.org/git/autoconf.git#tag=v2.70")
sha256sums=('SKIP')


pkgver() {
  cd autoconf
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd autoconf
  autoreconf -fi
  sed -i 's/program_suffix=NONE/program_suffix=-2.70/' ./configure
  ./configure \
    --prefix="/usr" \
    --datarootdir="/usr/share/autoconf-2.70/"
  make
}

package() {
  cd autoconf
  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING.EXCEPTION" -t "$pkgdir/usr/share/licenses/autoconf-2.70"
  rm "$pkgdir/usr/share/autoconf-2.70/info/standards.info"
}
