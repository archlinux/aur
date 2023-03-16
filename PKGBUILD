# Maintainer: Ryan O'Beirne <ryanobeirne@ryanobeirne.com>

pkgname='webos-tv-cli'
pkgver='1.12.4_j27'
__pkgver_sub="${pkgver//_/-}"
pkgrel=2
pkgdesc='LG WebOS TV CLI'
arch=('any')
url='https://webostv.developer.lge.com/develop/tools/cli-installation'
license=('custom:LG Software Development Kit License Agreement')
conflicts=('webos-cli' 'webos-sdk' 'webos-ide' 'webos-cli-minimal')
source=("local:///webOS TV CLI linux ${__pkgver_sub}.tgz")
sha256sums=('3c44ed5bf581b280de3662fb7e5f03e7ab568468b29852719f2000d857be5898')
options=('!strip')
__BINARIES=(
	ares
	ares-device-info
	ares-extend-dev
	ares-generate
	ares-inspect
	ares-install
	ares-launch
	ares-novacom
	ares-package
	ares-server
	ares-setup-device
)

if [[ ! -f "${source[0]##*/}" ]]; then
	printf  '%s\n' 'You will need to download the `Linux 64-bit` CLI package from the'
	printf  '%s\n' 'LG webOS TV Developer website and accept their Terms and Conditions:'
	printf  '%s\n'
	printf  '\t%s\n' "${url}"
	printf  '%s\n'
	printf  '%s\n' 'Save the file:'
	printf  '%s\n'
	printf  '\t%s\n' "${source[0]##*/}"
	printf  '%s\n'
	printf  '%s\n' '...in the same directory as the PKGBUILD before making this package.'
	printf  '%s\n'
fi >&2

prepare() {
	tar --overwrite-dir --no-same-owner -xf "${source[0]##*/}"
	cd "${srcdir}/CLI"
	for bin in "${__BINARIES[@]}"; do
		sed -i "/BIN_DIR=/s|=.*$|=/usr/share/${pkgname}/bin|" "bin/${bin}"
	done
}

package() {
	install -dm 755 "${pkgdir}"/usr/{bin,share/"${pkgname}",share/licenses/"${pkgname}"}
	for bin in "${__BINARIES[@]}"; do
		ln -sf "/usr/share/webos-tv-cli/bin/${bin}" "${pkgdir}/usr/bin/${bin}"
	done
	cd "${srcdir}/CLI"
	cp -dr --no-preserve='ownership' LICENSE.txt "${pkgdir}/usr/share/licenses/webos-tv-cli/"
	cp -dr --no-preserve='ownership' * "${pkgdir}/usr/share/webos-tv-cli"
}

