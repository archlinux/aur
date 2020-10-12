# Maintainer: Přemysl Eric Janouch <p@janouch@name>
pkgname=pdf-simple-sign-git
_pkgname=pdf-simple-sign
pkgver=v1.1.1.r1.gd4ff9a6
pkgrel=2
pkgdesc="Simple PDF signer"
url="https://git.janouch.name/p/pdf-simple-sign"
arch=('i686' 'x86_64')
license=('custom:0BSD')
options=(zipman)
conflicts=('pdf-simple-sign')
provides=('pdf-simple-sign')
makedepends=('meson' 'git' 'asciidoctor')
depends=('openssl')
source=("git+https://git.janouch.name/p/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  rm -rf "$srcdir/$_pkgname-build"
  mkdir "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname-build"
  meson --prefix=/usr --buildtype release "$srcdir/$_pkgname"
  ninja
}

package() {
  cd "$srcdir/$_pkgname-build"
  DESTDIR=$pkgdir ninja install 
  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
