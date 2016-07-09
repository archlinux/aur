pkgbase=mdxmini-git
pkgname=(mdxmini-git mdxplay-git)
pkgver=r19.eda5bca
pkgrel=3
pkgdesc='Library and command line player for Sharp X68000 MDX music files'
arch=(i686 x86_64)
# BouKiCHi's original repo seems to be gone so use this random, most up to
# date, fork instead.
url='https://github.com/weimingtom/mdxplayer/tree/master/jni/mdxmini'
license=(GPL2)
makedepends=(git)
source=("$pkgbase"::'git+https://github.com/weimingtom/mdxplayer.git'
        buffer-size.patch
        makefiles.patch
        integer-overflow.patch)
sha256sums=('SKIP'
            '4f8ec91487736c9ad864f54c615b491c406464573469ed59b1d4f6be77cf2812'
            '8711dd394c9b99e351026a8e88583d61142cab29a344434338b9589022a64582'
            'e6210879c1418b30ed6645675822a572edae1b223cbca9fdf30b3d398c787a4c')

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
  patch -p1 -i "$srcdir"/buffer-size.patch
  patch -p0 -i "$srcdir"/integer-overflow.patch
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
