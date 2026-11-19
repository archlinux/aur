# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=ddd-qtify
_pkgname=ddd
pkgver=3.4.1
pkgrel=1
pkgdesc="DDD, the GNU Data Display Debugger (Motif and Athena), built on Qt with Motif on Qt"
arch=(x86_64 aarch64)
url="https://www.gnu.org/software/ddd/"
license=(GPL-3.0-or-later)
depends=(qt6-base ncurses gdb)
makedepends=(motif-on-qt flex bison)
provides=(ddd)
conflicts=(ddd)
# Debian's copy of the release
source=("https://deb.debian.org/debian/pool/main/d/ddd/ddd_${pkgver}.orig.tar.gz")
sha256sums=('b87517a6c3f9611566347e283a2cf931fa369919b553536a2235e63402f4ee89')

build() {
  cd "${_pkgname}-${pkgver}"
  # no Xft: it would pull in the system's libX11 (fonts come from Qt)
  ac_cv_lib_Xft_XftFontOpen=no motif-on-qt-env ./configure --prefix=/usr
  motif-on-qt-env make
}

check() {
  cd "${_pkgname}-${pkgver}"
  mkdir -p "$srcdir/home"
  HOME="$srcdir/home" QT_QPA_PLATFORM=offscreen ./ddd/ddd --version | grep -q 'GNU DDD 3.4'
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
