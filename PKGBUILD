# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=headscale
pkgname="${_pkgname}-git"
_pkgver=v0.23.0-rc.1
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="An open source, self-hosted implementation of the Tailscale coordination server."
arch=('x86_64')
url="https://github.com/juanfont/headscale"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git' 'go')
optdepends=(
	'wireguard-tools: CLI tools for generating keys'
	'postgresql: alternative database provider'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

backup=(
	"etc/${_pkgname}/config.yaml"
	"etc/${_pkgname}/derp.yaml"
)
source=(
	"${_pkgname}::git+https://github.com/juanfont/headscale.git/#tag=$_pkgver"
	'headscale.sysusers'
	'headscale.tmpfiles'
)
sha256sums=('b9b8adba7afcc9d7e88d45c095fa30d92b31a3838bb27292e46b4bd308cd0257'
            '059353f4843dec6eb447c567fac890ef63cc9c8acea18840fcfc3f4a76d596db'
            '8a22d7193ceeac0be32725cf8108f963be3a21855e6099de964f810094d0adc7')

build() {
   cd "${srcdir}/${_pkgname}"
   export CGO_CPPFLAGS="${CPPFLAGS}"
   export CGO_CFLAGS="${CFLAGS}"
   export CGO_CXXFLAGS="${CXXFLAGS}"
   export CGO_LDFLAGS="${LDFLAGS}"
   export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
   go build -v -o headscale -tags="ts2019" -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -s -w -X github.com/juanfont/headscale/cmd/headscale/cli.Version=${pkgver}" ./cmd/headscale
}

package() {
	cd "$srcdir/${_pkgname}"
	install -D -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -D -m644 "config-example.yaml" "${pkgdir}/etc/${_pkgname}/config.yaml"
	install -D -m644 "config-example.yaml" "${pkgdir}/usr/share/${_pkgname}/config-example.yaml"

	install -D -m644 "derp-example.yaml" "${pkgdir}/etc/${_pkgname}/derp.yaml"
	install -D -m644 "derp-example.yaml" "${pkgdir}/usr/share/${_pkgname}/derp-example.yaml"

	install -D -m644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -D -m644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	install -D -m644 "docs/packaging/headscale.systemd.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

}
