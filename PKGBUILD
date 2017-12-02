# Maintainer: Přemysl Janouch <p.janouch@gmail.com>
pkgname=pdf-simple-sign-git
_pkgname=pdf-simple-sign
pkgver=r2.41f8165
pkgrel=1
pkgdesc="Simple PDF signer"
url="https://github.com/pjanouch/pdf-simple-sign"
arch=('i686' 'x86_64')
license=('BSD')
options=(zipman)
conflicts=('pdf-simple-sign')
provides=('pdf-simple-sign')
makedepends=('meson' 'git')
depends=('openssl')
source=("git+https://github.com/pjanouch/$_pkgname.git")
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
}
