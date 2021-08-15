# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
# Maintainer: Dan Bryant <$(base64 --decode <<<VanVzdGRhbjk2QGdtYWlsLmNvbQo=)>

pkgname=uasm
pkgdesc="A free MASM-compatible assembler based on JWasm"
url=http://www.terraspace.co.uk/uasm.html
_rel=1
_rev=c612f83d97a0cb192dfd983676743dabf662ed51
pkgver=2.52.r${_rel}.${_rev:0:10}
pkgrel=3
arch=(x86_64)
license=("custom:JWasm License" "custom:Sybase Open Watcom Public License")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Terraspace/UASM/archive/${_rev}.tar.gz
		uasm-nocolor
		dbgcv.patch)
sha256sums=('e9d610360eb1e03be44261e1ae3c2286745e16976a285a402431ed54b36ccd24'
            '19ea1744abea546768544c5d12afbb6a3f86946c002f092871a6c9876ac1fbb5'
            'df32228b7258abc8c3462601fcced228a5137e7ebc761863eb15edea240dc322')

prepare() {
	cd UASM-${_rev}

	# fix `dbgcv.c:*:*: fatal error: direct.h: No such file or directory`
	patch -Np1 -i ../dbgcv.patch

	# fix #151
	sed -i 's|#ifndef _TYPES_H_INCLUDED|#ifndef _TYPES_H_INCLUDED_|g' H/types.h

	# enforce full RELRO
	sed -i 's|-Wl,-Map,$(OUTD)/$(TARGET1).map$|-Wl,-Map,$(OUTD)/$(TARGET1).map -Wl,-z,now|g' gccLinux64.mak

	# https://gcc.gnu.org/gcc-10/porting_to.html#common
	sed -i "s|CC = gcc|CC = gcc -fcommon|g" gccLinux64.mak
}

build() {
	cd UASM-${_rev}

	make -f gccLinux64.mak
}

package() {
	cd UASM-${_rev}

	install -Dt "${pkgdir}"/usr/bin -m0755 GccUnixR/uasm ../uasm-nocolor
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 {Readme,History}.txt Doc/*
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 License.txt
}
