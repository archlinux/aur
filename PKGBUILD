# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=enventor-git
_pkgname=${pkgname%-*}
pkgver=0.1.0.259.eaf3493
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl) - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/tools/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for _i in v_maj v_min v_mic; do
    local v_ver=$v_ver.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  v_ver=$(awk -F , -v v_ver=${v_ver#.} '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_pkgname"
  
  make DESTDIR="$pkgdir" install
}
