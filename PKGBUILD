# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.3.5
pkgrel=1
pkgdesc="Assembly By Short Sequences - a de novo, parallel, paired-end sequence assembler"
arch=("i686" "x86_64")
url="https://github.com/bcgsc/abyss"
license=("GPL3")
depends=("make" "openmpi" "sqlite")
makedepends=("boost" "sparsehash")
optdepends=(
  'pigz: for parallel gzip'
  'samtools: to read BAM files'
  'zsh: to report time and memory usage'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcgsc/abyss/archive/$pkgver.tar.gz")
sha512sums=('1853e2d4d577abf7d0e8ce70e944846e5ad67afcd1f0a1a4b9944047c7e8ebc1dbdd8639b9d99d4b8ce5c84c8fa42638bb16bf02825e9c660bcac133662ec553')

build() {
  cd "${pkgname}-${pkgver}"

  ./autogen.sh
  LDFLAGS="${LDFLAGS:-} -L/usr/lib/openmpi" \
	  ./configure --prefix=/usr --disable-werror
  make 
}

check() {
  cd "${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


