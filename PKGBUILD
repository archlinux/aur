# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>

pkgname=bwa-mem2-git
_pkgname=bwa-mem2
pkgver=r183.d43752d
pkgrel=1
pkgdesc="The next version of Burrows-Wheeler Aligner MEM algorithm"
arch=('i686' 'x86_64')
url="https://github.com/bwa-mem2/bwa-mem2"
license=('custom')
depends=('gcc-libs' 'zlib')
source=("git+https://github.com/bwa-mem2/bwa-mem2"
        "git+https://github.com/intel/safestringlib.git")
md5sums=('SKIP' 'SKIP')

# For compiling for native instruction set only, set this to false:
MULTI=${MULTI:-true}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.ext/safestringlib.url ${srcdir}/safestringlib
  git submodule update
}

build() {
  cd "$srcdir/$_pkgname"
  if [ "$MULTI" = true ] ; then
    make multi
  else
    make arch=native
  fi
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 bwa-mem2 "$pkgdir/usr/bin/bwa-mem2"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [ "$MULTI" = true ] ; then
    install -Dm755 bwa-mem2.avx2      "$pkgdir/usr/bin/bwa-mem2.avx2"
    install -Dm755 bwa-mem2.avx512bw  "$pkgdir/usr/bin/bwa-mem2.avx512bw"
    install -Dm755 bwa-mem2.sse41     "$pkgdir/usr/bin/bwa-mem2.sse41"
  fi
}
