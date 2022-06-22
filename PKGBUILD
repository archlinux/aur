# Maintainer: Chris Kobayashi <software+aur@disavowed.jp>

pkgname=pdisk
pkgver=0.9
pkgrel=2
pkgdesc="A low-level Apple partition table editor for Linux."
arch=('x86_64' 'aarch64')
license=(custom)
source=(
	"https://opensource.apple.com/tarballs/pdisk/pdisk-${pkgver//0./}.tar.gz"
	'LICENSE'
	'makefile.patch'
	'file_media.c.patch'
	'cvt_pt.c.patch'
        'linux_strerror.patch'
)
sha256sums=(
	'5d080d8ff80744b9740b18030c59d7cea216f718c2bc2878434338b1d090a4ba'
	'54ae88ac1448451ebe3c7298bc000a19ef35a562107fed48ce2c41b9b22d9bab'
	'a1cdfa2d3d3d4a74f75d4906de5d411eef8a7b9d9f4300b4722277e25290ab9a'
	'e455106da2572150b5178d564814c33ee29bf39ec31f7f787e2d6fcc3a32fa68'
	'2dca3b77f193563299f5ba3388521712f9ad0da5d4aad6334025e1eadb191a0e'
        'b515aea26be1e91232dc22fd19abae2e8a6538fadb349c0c23a3687df2fe048a'
)

prepare() {
	cd "pdisk-${pkgver//0./}"

	patch -p1 -i "${srcdir}/makefile.patch"
	patch -p1 -i "${srcdir}/file_media.c.patch"
	patch -p1 -i "${srcdir}/cvt_pt.c.patch"
        patch -p1 -i "${srcdir}/linux_strerror.patch"
}

build() {
	cd "pdisk-${pkgver//0./}"
	make
}

package() {
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd "pdisk-${pkgver//0./}"
	install -Dm 755 pdisk "${pkgdir}/usr/bin/pdisk"
	install -Dm 755 cvt_pt "${pkgdir}/usr/bin/cvt_pt"

	gzip pdisk.8
	install -Dm 644 pdisk.8.gz "${pkgdir}/usr/share/man/man8/pdisk.8.gz"
	install -Dm 644 pdisk.html "${pkgdir}/usr/share/doc/${pkgname}/pdisk.html"
}
