# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=metabuli
_tag=ce1098ce99b0237f6fa4e26d57a81c80060c9af6 # git rev-parse 1.2.0
pkgver=1.2.0
pkgrel=3
pkgdesc="Specific and sensitive metagenomic classification via joint amino acid and DNA k-mer analysis"
arch=('x86_64')
url="https://github.com/steineggerlab/Metabuli"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cmake' 'git')
conflicts=('metabuli-bin')
# git source, not the tag archive: the archive omits the lib/mmseqs and
# lib/fasta_validator submodules
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/Metabuli"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/Metabuli"
  # portable SIMD instead of NATIVE_ARCH (shared mmseqs build system)
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DHAVE_SSE4_1=1
  cmake --build build
}

package() {
  cd "$srcdir/Metabuli"
  install -Dm755 build/src/metabuli "$pkgdir/usr/bin/metabuli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
