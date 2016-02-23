_gitname=telepathy-poison
pkgname=$_gitname-git
pkgver=r19.2988837
pkgrel=1
pkgdesc="Telepathy connection manager for Tox (early development)."
arch=('any')
url="https://github.com/abderrahim/telepathy-poison"
license=('GPL3')
makedepends=('git' 'vala')
depends=('toxcore' 'glib2')

source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
md5sums+=('SKIP')
provides+=($_gitname)
conflicts+=($_gitname)
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}
