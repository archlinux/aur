# Maintainer: Daniel Cafe <dcafe@unb.br>
pkgname=dsim
pkgver=2026
pkgrel=2
pkgdesc="DSim is an optimizing compiled-code digital logic simulator supporting Verilog, SystemVerilog and VHDL."
arch=('x86_64')
url="https://altair.com/dsim"
license=('Altair')
depends=('uvm')
installer="AltairDSim${pkgver}_linux64.bin"
source=(file://${installer}
        "dsim.sh")
sha256sums=('56612e2cbad142eebdade8977c3b82ad78f65bfa59d254a1c62da3edb78414ea'
	    'SKIP')
install=${pkgname}.install
options=('!debug')

build() {
	chmod +x ${installer}
	echo "Installing, please wait."
	./${installer} -i silent \
		-DACCEPT_EULA=YES    \
		-DUSER_INSTALL_DIR=${srcdir}
}

package() {
	echo "Using unix structure"
	mkdir -p ${pkgdir}/usr
	cp -r ${srcdir}/{bin,include,lib}                  ${pkgdir}/usr
	cp -r ${srcdir}/std_pkgs/lib                       ${pkgdir}/usr/lib/vhdl
	cp    ${srcdir}/radflex/radflex_${pkgver}_linux64  ${pkgdir}/usr/bin

	install -Dm755 ${srcdir}/radflex/liblmx-altair.${pkgver}.0.0.so  ${pkgdir}/usr/lib
	install -Dm755 ${srcdir}/llvm_small/lib/libLLVM.so.19.1     ${pkgdir}/usr/lib
	install -Dm755 ${srcdir}/uvm/2020.3.1/src/dpi/libuvm_dpi.so ${pkgdir}/usr/src/uvm/src/dpi/libuvm_dpi.so
	install -Dm644 ${pkgname}.sh                                ${pkgdir}/etc/profile.d/${pkgname}.sh
}
