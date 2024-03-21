# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname='shim-signed'
pkgver='15.8+ubuntu+1.57'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 and AA64 binaries from Ubuntu)'
url='https://packages.ubuntu.com/noble/shim-signed'
arch=('any')
license=('BSD-2-Clause')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("http://archive.ubuntu.com/ubuntu/pool/main/s/shim-signed/shim-signed_${pkgver##*+ubuntu+}+${pkgver%%+ubuntu*}-0ubuntu1_amd64.deb"
        "http://ports.ubuntu.com/pool/main/s/shim-signed/shim-signed_${pkgver##*+ubuntu+}+${pkgver%%+ubuntu*}-0ubuntu1_arm64.deb")
noextract=("shim-signed_${pkgver##*+ubuntu+}+${pkgver%%+ubuntu*}-0ubuntu1_arm64.deb")
sha256sums=('532a97f7376ac8e5d7bedb8b2d4283769251266d19a78e3e12ec44f53a1dab6a'
            '5f942542c21c41ffa14d22b890a6f51ccbfa0b3231f8a475265f90cb6e1cb924')
sha512sums=('de1c60b442d7484aa210c308ca422fe0d93439b50aeba192d2bbec7ec4d92779355d6ca838bb3d221fad8c4ea343dae37c13606200daf6f8f1436b120a4e9690'
            'ed0c856460c5a2aef8d9c4214ee9f2ba0c4926c4efec8add7171c0adada68f6c87f43461d67f8ca8747e9eaa037b2b90810d8daebecbc1c3a67bea34f781ea3e')

prepare() {
	local debfile

	cd "$srcdir"
	bsdtar -xf data.tar.xz
	for debfile in ${noextract[@]}; do
		bsdtar -xOf "$debfile" data.tar.xz | bsdtar -x usr/lib/shim/
	done
}


package() {
	install -Dm0644 "${srcdir}/usr/lib/shim/shimx64.efi.signed.latest" "${pkgdir}/usr/share/${pkgname}/shimx64.efi"
	install -Dm0644 "${srcdir}/usr/lib/shim/shimaa64.efi.signed.latest" "${pkgdir}/usr/share/${pkgname}/shimaa64.efi"
	install -Dm0644 "${srcdir}/usr/lib/shim/"{mm,fb}{x64,aa64}".efi" "${pkgdir}/usr/share/${pkgname}/"
	install -Dm0644 "${srcdir}/usr/share/doc/shim-signed/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
