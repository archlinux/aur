# Maintainer: Ryan O'Beirne <ryanobeirne@ryanobeirne.com>

pkgname='webos-tv-cli'
pkgver='1.12.4_j27'
pkgver_sub="${pkgver//_/-}"
pkgrel=1
pkgdesc='LG WebOS TV CLI'
arch=('any')
url='https://webostv.developer.lge.com/develop/tools/cli-installation'
license=('custom:LG Software Development Kit License Agreement')
conflicts=('webos-cli' 'webos-sdk' 'webos-ide' 'webos-cli-minimal')
source=("local:///webOS TV CLI linux ${pkgver_sub}.tgz")
sha256sums=("3c44ed5bf581b280de3662fb7e5f03e7ab568468b29852719f2000d857be5898")
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

prepare() {
	tar --overwrite-dir --no-same-owner -xf "${source[0]##*/}"
	cd "${srcdir}/CLI"
	for bin in "${__BINARIES[@]}"; do
		sed -i "/BIN_DIR=/s|=.*$|=/usr/share/${pkgname}/bin|" "bin/${bin}"
	done
}

package() {
	install -dm 755 "${pkgdir}"/usr/{bin,share/webos-tv-cli,share/licenses/webos-tv-cli}
	cd "${srcdir}/CLI"
	for bin in "${__BINARIES[@]}"; do
		ln -sf "/usr/share/webos-tv-cli/bin/${bin}" "${pkgdir}/usr/bin/${bin}"
	done
	cp -dr --no-preserve='ownership' LICENSE.txt "${pkgdir}/usr/share/licenses/webos-tv-cli/"
	cp -dr --no-preserve='ownership' * "${pkgdir}/usr/share/webos-tv-cli"
}

