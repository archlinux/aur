# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wcc
pkgver=0.0.10
pkgrel=2
pkgdesc='The Witchcraft Compiler Collection'
url=https://github.com/endrazine/wcc
arch=(i686 x86_64)
license=(MIT)
depends=(capstone glibc binutils zlib libelf linenoise lua53)
makedepends=(git make cargo)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
		wcc-missing-decls.patch
		wcc-system-libbfd.patch
		wsh-missing-prototype.patch
		wsh-system-libs.patch)
b2sums=('5e3f172893f3fe511c2c82a6739723f34321bdb2dd9ab854eba4d0638259b18d609c86ae7f1acf310d6d8e828397c994d0aec374404bc64245ab76e19f7d5891'
        '8375095ba39c07493decfcf737b3a7cfc5daf3a696aef08f7d8e2a62a883cfa993ebc160d7305c9f6f188e45ad09a52756d623e11742e62fc938ab321f400994'
        '235c97ea34c3318cd4c9fff6a8d1392e7d9c7f619eaecac01aeab67009fa2b277f643234ceceb00ed9e80eb25bef724186f23e5be72dcae1909fb897a029ddc2'
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
