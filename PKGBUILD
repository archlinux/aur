# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='VHDL compiler and simulator'
pkgname=nvc
pkgver=1.4.0
pkgrel=1
url='https://github.com/nickg/nvc'
license=(GPL3)
depends=(libelf llvm6-libs)
conflicts=(nvc-git)
arch=(x86_64 i686)
makedepends=(pkgconfig make flex check llvm6 tcl)

_vital_url='https://raw.githubusercontent.com/tgingold/ghdl/master/libraries/vital2000'

source=("${url}/releases/download/r${pkgver}/${pkgname}-${pkgver}.tar.gz"
		"https://standards.ieee.org/content/dam/ieee-standards/standards/web/download/1076.2-1996_downloads.zip"
		"${_vital_url}/timing_p.vhdl"
		"${_vital_url}/timing_b.vhdl"
		"${_vital_url}/prmtvs_p.vhdl"
		"${_vital_url}/prmtvs_b.vhdl"
		"${_vital_url}/memory_p.vhdl"
		"${_vital_url}/memory_b.vhdl")

sha512sums=('4450f035c0355befa18636748b7eddb0a4710d4db3b38dfba581ecfc5f1bdaa02ddcbcc1b5cbe42cfcb23688288095c9d06f83e240b8ae59c65163c5db61aba6'
            '428ebaaa02eb25240569c90e907828ce87e7a18e3a61d9809dda8ecc0bb46a59d0d6c15e625cc0d8e92b26d37dae3be68b480acc77326c07b763fd986bd8e563'
            'bdc38f3f3b5f9b0e572277e8a984361fec7fc877db7ee819bfe4cc9de0f101e53d52472b39b0d3b2c931b50af942378002481dff8e4b99732823ec8d364abe12'
            'affb483b7a2c2cf8e99619696289f578ff0c28b980d3807d9d3b815874af94ccaeb92adb9415409256b1ddd399cc64eefa52648a42913259af275eea871547b3'
            '741b95985a4a98427d459dba141eebca2fbc3b1a1a3c1cf237d5b6e9d5e12417a9568b38f98049ffdaaa6d6ea11604a869a53a1b66956d61c6487e53b719b309'
            'f0f604bb5bd1e0a8a2a15a4ac5180948e35be30f1479646ddf52803100dcf2c3b8546722f23a81934d006be1b25b44a7fd76ba3dbc8a1ad670560b405f53a0f2'
            '7358582b3f3877c8492b8cce1bc238dc6ef60818cdfe7e4a2ed5cb50ffe74c81221b7e473e59504328d2583c7e555457be50faf9238402bce1f6236586891c51'
            '41d9d4862db13cf741fa857ca085ba3fa3596d61eb8276effcfe8b9b7359479670c83fe525a98b595f523506c821b2ed3569fa72df5f62a6f83f7805436b02bf')

prepare () {
	cd "${pkgname}-${pkgver}/lib/ieee"
	cp -v "${srcdir}"/*.vhdl "${srcdir}/1076.2-1996_downloads"/*.vhdl .

	sed -i -e '119,120 s/^--/  /' -e '89 s/^--/  /' \
		std_logic_1164.vhdl

	sed -i -e '367,382 s/^--/  /' -e '384,399 s/^--/  /' -e '165,168 s/^--/  /' \
		std_logic_1164-body.vhdl
}

build () {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

# The source distribution is missing VHDL source files which are
# needed to run the test suite.
#
# check () {
# 	cd "${pkgname}-${pkgver}"
# 	make check
# }
 
package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -m 644 -D src/vhpi/vhpi_user.h "${pkgdir}/usr/include/vhpi_user.h"
}
