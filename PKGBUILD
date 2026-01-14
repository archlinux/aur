# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>

pkgname=bwa-mem2-git
_pkgname=bwa-mem2
pkgver=r241.97978f9
pkgrel=1
pkgdesc="The next version of Burrows-Wheeler Aligner MEM algorithm"
arch=('i686' 'x86_64')
url="https://github.com/bwa-mem2/bwa-mem2"
license=('custom')
depends=('gcc-libs' 'zlib')
source=("git+https://github.com/bwa-mem2/bwa-mem2#commit=97978f950c3aa240a168bb688908b6a3e1e7644e"
        "git+https://github.com/intel/safestringlib#commit=245c4b8cff1d2e7338b7f3a82828fc8e72b29549")
sha256sums=('SKIP' 'SKIP')

# For compiling for native instruction set only, set this to false:
MULTI=${MULTI:-true}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  git config submodule.ext/safestringlib.url "$srcdir/safestringlib"
  git config submodule.ext/safestringlib.path "ext/safestringlib"

  git -c protocol.file.allow=always submodule update --init --recursive

  sed -i 's/CFLAGS=.*/& -DSTDC_HEADERS/' ext/safestringlib/makefile
}

build() {
  cd "$srcdir/$_pkgname"

  if [[ "${MULTI:-false}" == "true" ]]; then
    make multi
  else
    make arch=native
  fi
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 bwa-mem2 "$pkgdir/usr/bin/bwa-mem2"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [[ "${MULTI:-false}" == "true" ]]; then
    install -Dm755 bwa-mem2.avx2 "$pkgdir/usr/bin/bwa-mem2.avx2"
    install -Dm755 bwa-mem2.avx512bw "$pkgdir/usr/bin/bwa-mem2.avx512bw"
    install -Dm755 bwa-mem2.sse41 "$pkgdir/usr/bin/bwa-mem2.sse41"
  fi
}
