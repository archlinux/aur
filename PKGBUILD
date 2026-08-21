# Maintainer: RubenKelevra <rubenkelevra@gmail.com>

pkgname=tunnel-client
pkgver=0.0.12
pkgrel=1
pkgdesc='Connect private MCP servers to OpenAI-hosted products through a secure tunnel'
arch=(
	'x86_64'
	'aarch64'
)
url='https://github.com/openai/tunnel-client'
license=(
	'Apache-2.0'
	'BSD-3-Clause'
	'MIT'
)
depends=(
	'ca-certificates'
)
makedepends=(
	'go'
)
optdepends=(
	'cloudflared: supervise a Cloudflare Tunnel when configured'
	'xdg-utils: open the embedded web UI in the default browser'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}@.service"
)
b2sums=(
	'3aab36fd95d5de7f45a06cbb627efc02ac4f806820e4fde33b3e49d91811fcd4d7beca5fa0b83d4058d2b8b417332cd8a1e620f1d6d21e5940500e5452fafbc2'
	'c205139c8a247f7e6c2bf44e30bf2a8ddc93d9cfd053ce6dc1a65b0dc37d445f8d831bfdb927b6bee6122d748bbb77b3403c03da76e0dea1909d8cb560d5c66a'
)

prepare() {
	cd -- "${pkgname}-${pkgver}" || return 1
	go mod vendor
}

build() {
	cd -- "${pkgname}-${pkgver}" || return 1

	export CGO_ENABLED=0
	export GOFLAGS='-buildmode=pie -trimpath -mod=vendor -buildvcs=false'
	export GOTOOLCHAIN=local

	go build \
		-o "${pkgname}" \
		./cmd/client
}

package() {
	cd -- "${pkgname}-${pkgver}" || return 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE NOTICE compliance/oss-license-report-client.txt \
		-t "${pkgdir}/usr/share/licenses/${pkgname}"

	local license_file module_dir module_file vendor_license_file
	while IFS= read -r license_file; do
		vendor_license_file="vendor/$(sed 's/@[^/]\+//' <<< "${license_file}")"
		[[ -f "${vendor_license_file}" ]] || {
			printf 'Missing vendored license file: %s\n' "${vendor_license_file}" >&2
			return 1
		}
		install -Dm644 "${vendor_license_file}" \
			"${pkgdir}/usr/share/licenses/${pkgname}/${vendor_license_file}"

		module_dir="vendor/${license_file%%@*}"
		[[ -d "${module_dir}" ]] || {
			printf 'Missing vendored module directory: %s\n' "${module_dir}" >&2
			return 1
		}
		while IFS= read -r -d '' module_file; do
			install -Dm644 "${module_file}" \
				"${pkgdir}/usr/share/licenses/${pkgname}/${module_file}"
		done < <(
			find "${module_dir}" -maxdepth 1 -type f \
				\( -name 'LICENSE*' -o -name 'COPYING*' -o -name 'NOTICE*' \) \
				-print0
		)
	done < <(
		awk -F '|' 'NF == 6 && $1 != "DEPENDENCY" { print $5 }' \
			compliance/oss-license-report-client.txt | sort -u
	)

	install -Dm644 "${srcdir}/${pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
}
