# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname='shim-signed'
pkgver='15.8+ubuntu+1.59'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 and AA64 binaries from Ubuntu)'
url='https://packages.ubuntu.com/noble/shim-signed'
arch=('any')
license=('BSD-2-Clause')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("https://archive.ubuntu.com/ubuntu/pool/main/s/shim-signed/shim-signed_${pkgver##*+ubuntu+}+${pkgver%%+ubuntu*}-0ubuntu2_amd64.deb"
        "https://ports.ubuntu.com/pool/main/s/shim-signed/shim-signed_${pkgver##*+ubuntu+}+${pkgver%%+ubuntu*}-0ubuntu2_arm64.deb")
noextract=("shim-signed_${pkgver##*+ubuntu+}+${pkgver%%+ubuntu*}-0ubuntu2_arm64.deb")
sha256sums=('f8ed71ce2d91a304b6d5eb84997f846f331b554578bc02dbfe78e13ad8ac81a9'
            '48f6301b173cf306cb2ae52aee0b290ded10d01c782fec4b29d73cd5621a5cc4')
sha512sums=('f7b77794e4ceac082816b0e51b57f79ffdf4479ef792fb989a4341861610b7a6919f09df0fe0cede2f16210e6f7444d12234463d4b674f2d8784885a9d4ad56e'
            '31a66c289bd7ca1ca1a0700bfcad6b6368421c0f0bd467060ead1a26956675bd9294d980166b018c325f8385f520940e2dd1bc33747f2e9828dbf4351280d859')

prepare() {
	local debfile

	cd "$srcdir"
	bsdtar -xf data.tar.xz
	for debfile in "${noextract[@]}"; do
		bsdtar -xOf "$debfile" data.tar.xz | bsdtar -x usr/lib/shim/
	done
}


package() {
	install -Dm0644 "${srcdir}/usr/lib/shim/shimx64.efi.signed.latest" "${pkgdir}/usr/share/${pkgname}/shimx64.efi"
	install -Dm0644 "${srcdir}/usr/lib/shim/shimx64.nx.efi.signed.latest" "${pkgdir}/usr/share/${pkgname}/shimx64.nx.efi"
	install -Dm0644 "${srcdir}/usr/lib/shim/shimaa64.efi.signed.latest" "${pkgdir}/usr/share/${pkgname}/shimaa64.efi"
	install -Dm0644 "${srcdir}/usr/lib/shim/shimaa64.nx.efi.signed.latest" "${pkgdir}/usr/share/${pkgname}/shimaa64.nx.efi"
	install -Dm0644 "${srcdir}/usr/lib/shim/"{mm,fb}{x64,aa64}".efi" "${pkgdir}/usr/share/${pkgname}/"
	install -Dm0644 "${srcdir}/usr/share/doc/shim-signed/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
