pkgname=dssat-csm-os-git
pkgver=v4.8.5.17.r0.g1b2e4ce4
pkgrel=1
pkgdesc="The Cropping System Model (CSM) from the Decision Support System for Agrotechnology Transfer (DSSAT)"
arch=('x86_64')
url="https://github.com/DSSAT/dssat-csm-os"
license=('LicenseRef-DSSAT')
depends=('netcdf-fortran' 'libjpeg-turbo')
makedepends=('gcc-fortran' 'cmake' 'make' 'git')
provides=('dssat-csm-os')
conflicts=('dssat-csm-os')
source=("git+https://github.com/DSSAT/dssat-csm-os.git")
sha256sums=('SKIP')

pkgver() {
  cd "dssat-csm-os"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "dssat-csm-os"
  mkdir -p build
}

build() {
  cd "dssat-csm-os/build"
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DDYNAMIC_LINK=ON \
    -DCMAKE_EXE_LINKER_FLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
  make
}

package() {
  cd "dssat-csm-os/build"
  make DESTDIR="${pkgdir}" install

  # Move the executable to the correct path
  install -d "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/dscsm048" "${pkgdir}/usr/bin/"

  # Move all data files into the correct share path
  install -d "${pkgdir}/usr/share/${pkgname}"
  find "${pkgdir}/usr/" -mindepth 1 -maxdepth 1 \
    ! -name "bin" \
    ! -name "share" \
    ! -name "lib" \
    -exec mv -t "${pkgdir}/usr/share/${pkgname}/" {} +

  # Finally, install the license file using its full path and correct name
  install -Dm644 "${srcdir}/dssat-csm-os/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
