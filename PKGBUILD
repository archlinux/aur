# Maintainer: Michael Gruz <michael.gruz@gmail.com>
pkgbase=libsavitar-5
pkgname=(libsavitar5 python-savitar)
pkgver=5.2.2
pkgrel=2
url="https://github.com/Ultimaker/libsavitar"
arch=('x86_64')
license=('LGPLv3+')
makedepends=('cmake' 'dos2unix' 'git' 'pugixml' 'python-sip4' 'sip4')
source=("libSavitar-${pkgver}.tar.gz::https://github.com/Ultimaker/libsavitar/archive/${pkgver}.tar.gz"
        "pySavitar-${pkgver}.tar.gz::https://github.com/Ultimaker/pySavitar/archive/${pkgver}.tar.gz"
	      "FindSIP.cmake"
	      "SIPMacros.cmake"
	      "CMakeLists.txt"
	      "SavitarConfig.cmake.in"
	      "COPYING-CMAKE-SCRIPTS"
	      "libsavitar-5.2.2-export-fix.patch")
sha512sums=('4138a5c99f1a23ef0ba665211efb8feb007863291ccc8fdd21b947411da7d8cc1c3b1771adeaca57564d258aa1132093d65eb7ffb81659fc8dda40da19720a32'
            '68d71b2bdcd4c1d9c83e0f6dd129cbc251b02ae81fd6aab9b682f659fb65ea0bdecdbbacd006f8dd7ec093888a7ee54ad9830da71deb11319734fb58536535c1'
            '9051d34a7587f09dd2529b4ea1ed720c1ef95b64572d7a3853fae8bd4051f285695d04f0d9544952e184dfc49d5ab5d24bafac43b2f2ea45991f834226de90c2'
            '62c61807a86900fc8791d37f36a8e6e5508037605eda3b4d453570378a6e737b7e1ca0f5327c0afa7c3a781d5150b81f2f8abe0d2fe096a37d563f266a3a4dd6'
            '1002ec1d3c2cc9c1a83db0af0fba483e79bf8ce5c0848638695d091d55a827d1bf06e28c02bb435286468167a5b8bd65692b24e97173b2f03c5babc2d7816896'
            '3b1c45cb8636d5906ba07e7c5373398aeb4608da2504d0bac605a5637083e9ca6281e7b029b8f324e93d29d65aa64735adb110ceec4f5285d67a39f61638313c'
            '5a517690e12e636ea080dd97d3c9624f854ea138a36bc72a56799f41761b82a9d9533b32891b6866daf251165633531c3437bec5cc3f0787982838cdde14224c'
            '1d40f7bf487c4108b7e4bf1d79cf9d9cbfea24f452359b4c59bdec4b151157d11a8493d60ff43dcca9a6ffbd7e920334299dcf7c787df81c7d4c2c894a71a907')

prepare() {
	cd "${srcdir}/libSavitar-${pkgver}"

  cp -r ${srcdir}/pySavitar-${pkgver}/python .
  mkdir cmake
  cp ${srcdir}/FindSIP.cmake ${srcdir}/SIPMacros.cmake ${srcdir}/COPYING-CMAKE-SCRIPTS cmake/
  rm -rf CMakeLists.txt
  cp ${srcdir}/CMakeLists.txt ${srcdir}/SavitarConfig.cmake.in .

#	patch -Np0 < ${srcdir}/libsavitar-5.2.2-export-fix.patch
	dos2unix README.md
	sed -i 's/Python3_SITELIB/Python3_SITEARCH/' cmake/SIPMacros.cmake
}

build() {
	cd "${srcdir}/libSavitar-${pkgver}"
	mkdir  build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=yes \
		-DCMAKE_BUILD_TYPE=Release ..
	make
}

package_libsavitar5() {
	pkgdesc="C++ implementation of 3mf loading with SIP Python bindings"
  depends=('pugixml')
	provides=('libsavitar')
	conflicts=('libsavitar')
	cd "${srcdir}/libSavitar-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
	rm -r "$pkgdir"/usr/lib/python3.11
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "${srcdir}/libSavitar-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/libSavitar-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_python-savitar() {
	pkgdesc="Python libSavitar bindings"
	depends=(python)
	provides=(python-savitar)
	replaces=(python-savitar)
	cd "${srcdir}/libSavitar-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
	rm -r "$pkgdir"/usr/include
	rm -r "$pkgdir"/usr/lib/cmake
	rm "$pkgdir"/usr/lib/libSavitar.so*
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "${srcdir}/pySavitar-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/pySavitar-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:

