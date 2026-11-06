# Maintainer: Miha Frangež <miha.aur@frangez.me>
pkgname=ishield-key-manager
pkgver=1.14.1
pkgrel=1
pkgdesc="Manage Your Swissbit iShield Key Devices: configure WebAuthn/FIDO2, TOTP, HOTP, PIV and other functions of your iShield Key."
arch=('x86_64')
url="https://community.swissbit.com/c/software-tools/download-links"
depends=('gtk3' 'libusb' 'systemd-libs')
optdepends=('libsecret')
options=('!strip' '!emptydirs')
source=('ishield-key-manager.sh' 'iKMcli.sh')
sha512sums=('570aa6e9a6b96fb89cbf37355a652bce172c4ae2a4a114793f0d5401d145ce1f8a0c457de349c6665369f35cf73ae637886a62ad1c3594e14a39be8c882c2feb'
            '31853e9779009cf7dd16afb45bff618ade02483a5757de7500be5c62a3713a2f8897859d88dac1f70d6a964df8b81da69f936bd440220dc55c14e6f56789b17a')
source_x86_64=("https://www.swissbit.com/files/public/ikm/iShield_Key_Management_Kit_Linux.zip")
sha512sums_x86_64=("SKIP")

pkgver() {
	local v
	read -r v < "${srcdir}/iShield_Key_Management_Kit_Linux/version.txt"
	echo "${v#v}"
}

package(){
	local kit="${srcdir}/iShield_Key_Management_Kit_Linux"

	# Extract GUI package data from the deb
	ar x "${kit}/iKM/ishield-key-manager.deb"
	tar -xz -f data.tar.gz -C "${pkgdir}"

	# GUI
	install -Dm755 "${srcdir}/ishield-key-manager.sh" "${pkgdir}/usr/bin/ishield-key-manager"
	sed -i 's/^Exec=.*/Exec=ishield-key-manager/' "${pkgdir}/usr/share/applications/com.swissbit.ishield-key-manager.desktop"

	# CLI
	install -Dm755 "${kit}/iKMcli/iKMcli" "${pkgdir}/opt/ishield-key-manager/cli/iKMcli"
	install -Dm755 "${srcdir}/iKMcli.sh" "${pkgdir}/usr/bin/iKMcli"
	install -Dm644 "${kit}"/iKMcli/opensource-licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}/cli/"
	install -Dm644 "${kit}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
