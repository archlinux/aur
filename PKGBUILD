# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wcc
pkgver=0.0.11
pkgrel=1
pkgdesc='The Witchcraft Compiler Collection'
url=https://github.com/endrazine/wcc
arch=(i686 x86_64)
license=(MIT)
depends=(capstone glibc binutils zlib libelf linenoise lua53)
makedepends=(git make cargo)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
		wcc-missing-decls.patch
		wsh-missing-prototype.patch
		wsh-system-libs.patch)
b2sums=('be8efea713d01bfd919dd639b6c935a4464127155cb3c370fc45b6eceee82eb0b38fe041988bc147a00b1d923d3324532c6263c243cc590a1181ddd599ecc7de'
        '8375095ba39c07493decfcf737b3a7cfc5daf3a696aef08f7d8e2a62a883cfa993ebc160d7305c9f6f188e45ad09a52756d623e11742e62fc938ab321f400994'
        '837be2676cbac48c1938bace69518621336f09935e8a5af1532be14d60bd8c0ca06adceca8eabb55e0a63a5914c9505b825d31b9d2ba561a7d37f36b000631a3'
        'b2ad21b77cb70ec425f08160c16e5eb66ee5091a7298ada958ca50421f20c305aa8b970a8f7fcca05cca7f43e9df6d284a386da4b231f3bbf6e279834411858e')

prepare () {
	cd "${pkgname}-${pkgver}"
	for name in "${source[@]}" ; do
		[[ $name = *.patch ]] || continue
		patch -p0 -i "$srcdir/$name"
	done
}

build () {
	cd "${pkgname}-${pkgver}"
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	make DESTDIR="${pkgdir}/" install
	install -Dm755 -t "${pkgdir}/usr/bin" bin/*
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" doc/manpages/*.1
}
