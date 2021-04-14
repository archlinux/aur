# Maintainer: Achmad Fathoni <fathoni dot id at gmail dot com>
pkgname=nvbio
pkgver=r1378.5916f3ea
pkgdesc="library of reusable components designed by NVIDIA Corporation to accelerate bioinformatics applications using CUDA"
url='https://github.com/NVlabs/nvbio'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD-3-Clause License')
provides=('nvbio')
makedepends=('cuda')

depends=(
    cuda
)
source=("${pkgname}-${pkgver}::git://github.com/NVlabs/nvbio.git"
    cub.patch
)
sha256sums=('SKIP'
            'ee5b0f58d2fb5ef59547ca73a18eb382ef90cbe4ddaf4d7299c003ef9a7674a6')

pkgver() {
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/cub.patch"
}

build() {
    # Create the build directory.
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${pkgname}-${pkgver} \
        -DGPU_ARCHITECTURE=sm_62
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
