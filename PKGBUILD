# Maintainer: Matti Niemenmaa <matti.niemenmaa+aur ät iki dȯt fi>

pkgbase=mdxmini-git
pkgname=(mdxmini-git mdxplay-git)
pkgver=r19.eda5bca
pkgrel=1
pkgdesc='Library and command line player for Sharp X68000 MDX music files'
arch=(i686 x86_64)
url='https://github.com/BouKiCHi/mdxplayer/tree/master/jni/mdxmini'
license=(GPL2)
makedepends=(git)
source=("$pkgbase"::'git+https://github.com/BouKiCHi/mdxplayer.git'
        makefiles.patch)
sha256sums=('SKIP'
            'd8f24d0a385ed081e496573abed032366a2e74c6ea4c6dada80d7571e40bf1c0')

pkgver() {
  cd "$srcdir/$pkgbase"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgbase"
  patch -p1 -i "$srcdir"/makefiles.patch
}

build() {
  cd "$srcdir/$pkgbase/jni/mdxmini"
  make
}

package_mdxmini-git() {
  depends=(glibc)
  cd "$srcdir/$pkgbase/jni/mdxmini"
  install -dm755 "$pkgdir/usr/"{include/mdxmini,lib}
  install -m755 obj/libmdxmini.so "$pkgdir/usr/lib"
  install -m644 obj/libmdxmini.a "$pkgdir/usr/lib"
  install -m644 src/{mdxmini,mdx,pcm8}.h "$pkgdir/usr/include/mdxmini"
}

package_mdxplay-git() {
  depends=(sdl)
  provides=(mdxplay)
  conflicts=(mdxplay)
  install -Dm755 "$srcdir/$pkgbase/jni/mdxmini/mdxplay" "$pkgdir/usr/bin/mdxplay"
}
