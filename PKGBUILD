# Maintainer: Darren Ng <$(base64 --decode <<<'VW4xR2ZuQGdtYWlsLmNvbQo=')>

pkgname=lepton-eda-gtk3-git
pkgver=1.9.13.20201211.r150.b71d05c36
pkgrel=1
pkgdesc="a suite of free software tools for designing electronics (gtk3) (devel)"
arch=(x86_64)
url="https://github.com/lepton-eda/lepton-eda"
license=(GPL2)
depends=(gtk3 guile libstroke)
makedepends=(git)
provides=("${pkgname%-gtk3-git}")
conflicts=("${pkgname%-gtk3-git}" geda geda-gaf)
source=("${pkgname%-gtk3-git}::git+https://github.com/lepton-eda/lepton-eda.git")
sha1sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-gtk3-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {

  cd "${pkgname%-gtk3-git}"

  rm -fv ./autogen.sh
  autoreconf -i

  # https://github.com/lepton-eda/lepton-eda/blob/$_pkgver/README.md
  ./configure \
    \
    --prefix=/usr \
    \
    --enable-option-checking \
    --disable-static \
    --enable-shared \
    --disable-rpath \
    --enable-assert \
    --enable-gio \
    --disable-doxygen \
    --disable-update-xdg-database \
    --disable-attrib \
    --enable-contrib \
    \
    --with-gnu-ld \
    --with-gtk3 \
    --with-libstroke

  make

}

package() {

  cd "${pkgname%-gtk3-git}"
  make DESTDIR="$pkgdir/" install

  # namcap: W: Potential non-FHS man page (usr/share/doc/lepton-eda/man/xxx.html) found.
  mv -v "$pkgdir/usr/share/doc/lepton-eda/man"{,.html}

}
