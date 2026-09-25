# Maintainer: Phillip Dykman <phil.d324@gmail.com>
pkgname=supermemory-server
# renovate: datasource=github-releases depName=supermemoryai/supermemory extractVersion=^server-v(?<version>.+)$
pkgver=0.0.8
pkgrel=1
pkgdesc="Self-hosted AI memory server for managing and retrieving information"
arch=('x86_64' 'aarch64')
url="https://github.com/supermemoryai/supermemory"
license=('AGPL-3.0-or-later')
depends=()
makedepends=()
install=supermemory.install
options=(!strip)

source=('supermemory-server.service'
        'supermemory.install')
source_x86_64=("https://github.com/supermemoryai/supermemory/releases/download/server-v${pkgver}/supermemory-server-linux-x64")
source_aarch64=("https://github.com/supermemoryai/supermemory/releases/download/server-v${pkgver}/supermemory-server-linux-arm64")

sha256sums=('9c888af5610069b19b84922e1456abaa54332a4b5513f24c2bf8fcfbc966a677'
            'ad3736bb35f7e8daed367baa5f87300afc53886e4dc0e6192725e00857719ca8')
sha256sums_x86_64=('87f32433d0179be80bb9d8a1bafbac65af4128324342a27ecb8bd1a77b5506f3')
sha256sums_aarch64=('eeb9e62a8bf59646bd799a05d1a2981b945413a03640c3a39f4f267ad2d2bf37')

package() {
	# Detect binary filename based on architecture
	local binname
	case "${CARCH}" in
		x86_64) binname="supermemory-server-linux-x64" ;;
		aarch64) binname="supermemory-server-linux-arm64" ;;
		*) error "Unsupported architecture: ${CARCH}" ;;
	esac

	msg2 "Installing binary: ${binname}"
	[ -f "${srcdir}/${binname}" ] || error "Binary not found: ${srcdir}/${binname}"

	# Install binary
	install -Dm755 "${srcdir}/${binname}" "${pkgdir}/usr/bin/supermemory-server"

	# Install systemd service
	install -Dm644 "${srcdir}/supermemory-server.service" "${pkgdir}/usr/lib/systemd/user/supermemory-server.service"
}
