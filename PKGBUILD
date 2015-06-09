# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=charls
pkgver=1.0

# Some Fedora version info (for patches)
_fedora_rel=2.fc15

pkgrel=3
pkgdesc="An optimized implementation of the JPEG-LS standard"
arch=(i686 x86_64)
url="http://charls.codeplex.com/"
license=(BSD)
makedepends=(cmake dos2unix unzip)
source=("http://kojipkgs.fedoraproject.org/packages/CharLS/${pkgver}/${_fedora_rel}/src/CharLS-${pkgver}-${_fedora_rel}.src.rpm")
sha512sums=('7fbf1f2e5c0f7333ad6e007fd7cc2e29707a1a461498f7c323971bafcff9840300805b2f42af72f7066a26572eb9c5f4fe846c8d79504c603ab69ff61a5529b2')

build() {
  # Use sources for Fedora RPM because the CodePlex website requires interaction to download
  mkdir CharLS-${pkgver}
  cd CharLS-${pkgver}
  unzip ../CharLS-source-${pkgver}.zip

  # Remove Microsoft Visual Studio project files
  rm CharLS.vcproj
  rm CharLS.sln

  # Convert files to Unix line endings ('\r\n' -> '\n')
  dos2unix *.h
  dos2unix *.c*
  dos2unix *.txt

  # Apply Fedora patches
  for i in $(grep "Patch[0-9]*:" ../CharLS.spec | awk '{ print $2 }'); do
    patch -p1 -i "../${i}"
  done

  # Build with CMake
  mkdir build
  cd build
  cmake .. \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -Dcharls_BUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

check() {
  cd CharLS-${pkgver}/build

  # Fix library paths
  LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:." ctest .
}

package() {
  cd CharLS-${pkgver}/build
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
