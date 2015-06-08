# Maintainer: Matti Niemenmaa <matti.niemenmaa+aur ät iki dȯt fi>

pkgname=mdxmini-git
pkgver=r19.eda5bca
pkgrel=1
pkgdesc='Library and command line player for Sharp X68000 MDX music files'
arch=(i686 x86_64)
url='https://github.com/BouKiCHi/mdxplayer/tree/master/jni/mdxmini'
license=(GPL2)
depends=(sdl)
makedepends=(git)
provides=(mdxplay)
conflicts=(mdxplay)
source=("$pkgname"::'git+https://github.com/BouKiCHi/mdxplayer.git'
        makefiles.patch)
sha256sums=('SKIP'
            '2c67ce4f2828b11c785eae52c874a06ad535ad8e762d4b70230959ed9217840b')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir"/makefiles.patch
}

build() {
  cd "$srcdir/$pkgname/jni/mdxmini"
  make
}

package() {
  cd "$srcdir/$pkgname/jni/mdxmini"
  install -dm755 "$pkgdir/usr/"{bin,include/mdxmini,lib}
  install -m755 mdxplay "$pkgdir/usr/bin"
  install -m755 obj/libmdxmini.so "$pkgdir/usr/lib"
  install -m644 obj/libmdxmini.a "$pkgdir/usr/lib"
  install -m644 src/{mdxmini,mdx,pcm8}.h "$pkgdir/usr/include/mdxmini"
}
