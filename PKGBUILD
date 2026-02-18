# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Rocket Aaron <i at rocka dot me>
# Contributor: Manuel Gugger <mdgdot[at]tutanota[dot]com>

pkgname=act_runner
pkgver=0.3.0
pkgrel=1
pkgdesc="Runner for Gitea based on Gitea fork of act"
url="https://gitea.com/gitea/act_runner"
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('docker: To run runners in containers')
backup=("etc/${pkgname}/config.yaml")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('dc2abcb34e9d0a9b3d7fad1689a659c83277764c080504dc631df4adef489238'
            '5d391f0646d24acec4271b9ad769c79f2d6780848aaaa215ea697d61c4d1e895'
            '96abb320d5b0bc2f828f0d34fb9ad1fa3015dc0b31354213fa21771b2fb8f8f6'
            '86885e9226ffb7bc3dbb105dc2e10630c41717212c804e19413acf3974c8b347')

build() {
	cd "${pkgname}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w -buildid='' -linkmode external -X gitea.com/gitea/act_runner/internal/pkg/ver.version=${pkgver}"

	"./${pkgname}" generate-config > "${srcdir}/${pkgname}-config.yaml"
}

package() {
	cd "${pkgname}"
	install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm 644 "${srcdir}/${pkgname}-config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
	install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
