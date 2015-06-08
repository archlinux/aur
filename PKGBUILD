# Maintainer: Matti Niemenmaa <matti.niemenmaa+aur ät iki dȯt fi>

pkgname=mdxplay-git
pkgver=r19.eda5bca
pkgrel=1
pkgdesc='Command line music player for Sharp X68000 MDX files'
arch=(i686 x86_64)
url='https://github.com/BouKiCHi/mdxplayer/tree/master/jni/mdxmini'
license=(GPL2)
depends=(sdl)
makedepends=(git)
provides=(mdxplay)
conflicts=(mdxplay)
source=("$pkgname"::'git+https://github.com/BouKiCHi/mdxplayer.git'
        makefile.patch)
sha256sums=('SKIP'
            '65459a3a37cf3fd493da9b79e0848d9fcc6a5d39db383f80a52f510011b56e77')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir"/makefile.patch
}

build() {
  cd "$srcdir/$pkgname/jni/mdxmini"
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname/jni/mdxmini/mdxplay" "$pkgdir/usr/bin/mdxplay"
}
