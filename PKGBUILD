# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Sagar Chalise <chalisesagar@gmail.com>

pkgname=geanypy-git
pkgver=0.01.r150.438ea69
pkgrel=1
pkgdesc="Python bindings for Geany Plugin API and plugins."
arch=('x86_64' 'i686')
url="http://codebrainz.github.com/geanypy"
license=('GPL2')
depends=('geany' 'pygtk')
makedepends=('git')
provides=("${pkgname%-*}=$pkgver")
conflicts=("${pkgname%-*}")
source=("git://github.com/codebrainz/geanypy.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-*}"

  sed -i '/AM_INIT_AUTOMAKE/a AM_PROG_AR' configure.ac
  sed -i 's/env python$/&2/' geany/console.py
}

build() {
  cd "$srcdir/${pkgname%-*}"

  ./autogen.sh
  ./configure --prefix=$(pkg-config --variable=prefix geany) PYTHON_VERSION=2.7

  make 
}

package() {
  cd "$srcdir/${pkgname%-*}"

  make DESTDIR="$pkgdir" install
}
