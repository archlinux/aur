# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
# Contributor: Dan Bryant <$(base64 --decode <<<VanVzdGRhbjk2QGdtYWlsLmNvbQo=)>

pkgname=uasm
pkgdesc="A free MASM-compatible assembler based on JWasm"
url=http://www.terraspace.co.uk/uasm.html
pkgver=2.55
pkgrel=1
arch=(x86_64)
license=("custom:JWasm License" "custom:Sybase Open Watcom Public License")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Terraspace/UASM/archive/refs/tags/v${pkgver}.tar.gz
		uasm-nocolor)
sha256sums=('ae0df97bedd0d3e74e9731ea27d73978b1914aae792d913a3c9029a4d5890192'
            '19ea1744abea546768544c5d12afbb6a3f86946c002f092871a6c9876ac1fbb5')

prepare() {
	cd UASM-${pkgver}

	# enforce full RELRO
	sed -i 's|-Wl,-Map,$(OUTD)/$(TARGET1).map$|-Wl,-Map,$(OUTD)/$(TARGET1).map -Wl,-z,now|g' gccLinux64.mak

	# https://gcc.gnu.org/gcc-10/porting_to.html#common
	sed -i "s|CC = gcc|CC = gcc -fcommon|g" gccLinux64.mak
}

build() {
	cd UASM-${pkgver}

	make -f gccLinux64.mak
}

package() {
	cd UASM-${pkgver}

	install -Dt "${pkgdir}"/usr/bin -m0755 GccUnixR/uasm ../uasm-nocolor
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 {Readme,History}.txt Doc/*
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 License.txt
}
