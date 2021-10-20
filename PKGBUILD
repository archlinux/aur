# Maintainer: Martin Piatka <(lastname) @ cesnet.cz>
pkgname='gpujpeg-git'
pkgver=r762.2252eaf
pkgrel=1
pkgdesc='JPEG encoder and decoder library and console application for NVIDIA GPUs (from git)'
arch=('x86_64')
url="https://github.com/CESNET/GPUJPEG"
license=('BSD')

depends=(
	'cuda'
	'glew'
)
makedepends=(
	'git'
	'cmake'
)

provides=('gpujpeg' 'libgpujpeg.so')
conflicts=('gpujpeg')

source=("${pkgname}::git+https://github.com/CESNET/GPUJPEG.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Debug . -Bbuild
  cmake --build build
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/share/doc"
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/doc/$pkgname"
}
