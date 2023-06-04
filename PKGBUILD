# Maintainer:
# Contributor: Alexey Manukhin <axxapy@gmail.com>

_gitname="runkit7"
_pkgname="php-$_gitname"
pkgname="$_pkgname-git"
pkgdesc='Tools to allow what Reflection does not. Useful for unit tests.'
pkgver=4.0.0a6.r1.g8ffec37
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url="https://github.com/runkit7/runkit7"

depends=('php')
makedepends=('php')

provides=("$_pkgname")
conflicts=(${provides[@]})

source=(
  "$_gitname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  phpize
  ./configure
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -vDm0644 "$srcdir/$_gitname/modules/$_gitname.so" "$pkgdir/usr/lib/php/modules/$_gitname.so"

  echo "extension=$_gitname.so" > "$srcdir/$_gitname.ini"
  echo "$_gitname.internal_override=1" >> "$srcdir/$_gitname.ini"
  install -vDm0644 "$srcdir/$_gitname.ini" -t "$pkgdir}/etc/php/conf.d"
}

