# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=galculator-qtify
pkgver=2.1.4
pkgrel=1
pkgdesc="Galculator, the GTK scientific calculator, built on Qt with GTK made Qt"
arch=(x86_64 aarch64)
url="http://galculator.mnim.org/"
license=(GPL-2.0-or-later)
depends=(qt6-base glib2 cairo pango)
makedepends=(gtk-made-qt autoconf automake libtool intltool flex pkgconf)
provides=(galculator)
conflicts=(galculator)
# Debian's copy of the release (without the generated configure)
source=("https://deb.debian.org/debian/pool/main/g/galculator/galculator_${pkgver}.orig.tar.gz")
sha256sums=('dcbdb48ddf8a3f68b9aa5902f880f174fd269de2b7410988148d05871012e142')

prepare() {
  cd "galculator-${pkgver}"
  mkdir -p m4
  intltoolize --force
  autoreconf -fi
}

build() {
  cd "galculator-${pkgver}"
  # gnu17 and -fcommon: 2016 C (unprototyped calls, a tentative definition
  # in a header); Debian patches the source for the same
  CFLAGS="$CFLAGS -std=gnu17 -fcommon" gtk-made-qt-env ./configure --prefix=/usr
  gtk-made-qt-env make
}

check() {
  cd "galculator-${pkgver}"
  # starts the toolkit; the window needs the installed interface files
  QT_QPA_PLATFORM=offscreen ./src/galculator -v | grep -q 'galculator v2'

}

package() {
  cd "galculator-${pkgver}"
  make DESTDIR="$pkgdir" install
}
