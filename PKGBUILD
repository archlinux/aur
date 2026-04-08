# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

# To do: 
# - Add licenses
#    https://www.elastiflow.com/community-license
#    https://www.elastiflow.com/commercial-license

pkgname=elastiflow-flow-collector-bin
pkgver=7.22.0
pkgrel=2
pkgdesc="ElastiFlow NetObserv Flow Collector (official binaries)"
arch=('x86_64')
url="https://elastiflow.com/"
license=('custom')
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
options=(!emptydirs)
source=(
	"https://elastiflow-releases.s3.us-east-2.amazonaws.com/flow-collector/flow-collector_${pkgver}_linux_amd64.deb"{,.sig}
	'sysusers.conf'
	'tmpfiles.conf'
)
sha256sums=(
	'22fa7e974afc50dab4b74dfea036a881ecc73289fd8f6d54a1cd5b1258f1e37c'
	'9b66832123e37d6056b8866b45218876fbd6b96f7bf35ea4ce47084d2e590797'
	'84c34fecf0338c2ef5c2e811775c4416b9e65852f381f60f3ab1844bb1c7ee34'
	'd306ee2460d05a061c7a407d2ede67dbbf7dfe6bff2c0c388c4d1c6d5cd031d0'
)
validpgpkeys=('6A2E26EFDE24AA7A634A442ED5C0572E5D212F6B')

prepare() {
	rm -rf "${pkgname}-${pkgver}"
	mkdir "${pkgname}-${pkgver}"
	bsdtar -xf data.tar.xz -C "${pkgname}-${pkgver}/"

	cd "${pkgname}-${pkgver}"
	sed -i 's#EnvironmentFile=.*#EnvironmentFile=/etc/sysconfig/flowcoll.env#' 'etc/systemd/system/flowcoll.service'
	sed -i 's#ExecStart=/usr/share/elastiflow/bin/flowcoll #ExecStart=/usr/bin/flowcoll #' 'etc/systemd/system/flowcoll.service'
}

package() {
	install -Dm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/elastiflow.conf"
	install -Dm644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/elastiflow.conf"

	cd "${pkgname}-${pkgver}"
	find etc/elastiflow -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
	install -Dm755 usr/share/elastiflow/bin/flowcoll "${pkgdir}/usr/bin/flowcoll"
	install -Dm644 etc/systemd/system/flowcoll.service "${pkgdir}/usr/lib/systemd/system/flowcoll.service"
	install -Dm600 etc/systemd/system/flowcoll.env "${pkgdir}/etc/sysconfig/flowcoll.env"
}
