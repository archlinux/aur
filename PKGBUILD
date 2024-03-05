# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=xsens-device-api
pkgver=2022.0.0
pkgrel=1
_pkgrev=b7085_r119802
pkgdesc="Movella Xsens Device API"
url="https://www.xsens.com/software-downloads"
arch=('any')
license=('custom')
depends=('libusb')
checkdepends=()
optdepends=()
makedepends=()
source=("https://www.xsens.com/hubfs/Downloads/Software/MTSS/Releases/${pkgver}/MT_Software_Suite_linux-x64_${pkgver::6}_${_pkgrev}.tar.gz")
sha256sums=('2872b96f7c48cfdbe0788dc89881973ea17cd59624bce8af8e7a76b1f4d82d43')

prepare() {
  # Skip install location dialog
  cd "${srcdir}/MT_Software_Suite_linux-x64_${pkgver::6}"
  sed -i -e 's\/usr/local/xsens\${XS_INST_DIR}  \g' -e 's\read INSTALL_PREFIX\#ead INSTALL_PREFIX\g' "mtsdk_linux-x64_${pkgver::6}.sh"

  # Unpack sources
  export XS_INST_DIR=${srcdir}/xda
  mkdir -p ${XS_INST_DIR}
  chmod +x "mtsdk_linux-x64_${pkgver::6}.sh"
  ./mtsdk_linux-x64_${pkgver::6}.sh

  # Change install from static to shared library
  sed -i -e 's/libxscommon.a/libxscommon.so/g' -e 's/ar rcs $@ $^/gcc -shared $^ -o $@/g' "${XS_INST_DIR}/public/xspublic/xscommon/Makefile"
  sed -i -e 's/libxscontroller.a/libxscontroller.so/g' -e 's/ar rcs $@ $^/gcc -shared $^ -o $@/g' "${XS_INST_DIR}/public/xspublic/xscontroller/Makefile"
  sed -i -e 's/libxstypes.a/libxstypes.so/g' -e 's/ar rcs $@ $^/gcc -shared $^ -o $@/g' "${XS_INST_DIR}/public/xspublic/xstypes/Makefile"
}

build() {
  cd "${XS_INST_DIR}/public/xspublic/"
  export CFLAGS="${CFLAGS} -fPIC -DHAVE_LIBUSB"
  export CXXFLAGS="${CXXFLAGS} -fPIC -DHAVE_LIBUSB"
  cd xscommon && make
  cd ../xstypes && make
  cd ../xscontroller && make
}

package() {
  mkdir -p "${pkgdir}/usr/include"
  cp -r "${XS_INST_DIR}/include" "${pkgdir}/usr/"

  mkdir -p "${pkgdir}/usr/lib"
  install -m644 "${XS_INST_DIR}/public/xspublic/xscommon/libxscommon.so" "${pkgdir}/usr/lib/libxscommon.so"
  install -m644 "${XS_INST_DIR}/public/xspublic/xstypes/libxstypes.so" "${pkgdir}/usr/lib/libxstypes.so"
  install -m644 "${XS_INST_DIR}/public/xspublic/xscontroller/libxscontroller.so" "${pkgdir}/usr/lib/libxscontroller.so"

  install -Dm644 "${XS_INST_DIR}/Xsens Technologies MT SS License Agreement.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
