# Maintainer: Matthias Ellmer <matthias at x four eight dot org but eight is really nine>
pkgname=groops-git
pkgver=r37.292ccda
pkgrel=1
pkgdesc="A C++ software toolkit to perform core geodetic tasks."
arch=('x86_64')
url="https://github.com/groops-devs/groops"
license=('GPL3')
depends=('bash' 'expat' 'lapack' 'zlib')
makedepends=('git' 'cmake' 'gcc' 'gcc-fortran')
optdepends=('netcdf-cxx: for reading and writing NetCDF files.'
            'erfa: for high-precision Earth rotation.'
            'openmpi: or another MPI to parallelize resource intensive tasks.'
            'gmt: visualization of data sets')
install=post.install
source=('git+https://github.com/groops-devs/groops.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B ${pkgname}-${pkgver}/build \
    -S "${pkgname%-git}/source" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C ${pkgname}-${pkgver}/build
}

package() {
  # binaries
	make -C ${pkgname}-${pkgver}/build DESTDIR="$pkgdir/" install

  # license
  install -D -m644 "${pkgname%-git}/LICENSE"    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
