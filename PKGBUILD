# Maintainer: RubenKelevra <rubenkelevra@gmail.com>

pkgname=tunnel-client
pkgver=0.0.16
pkgrel=1
_svelte_version=4.2.20
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
	'go>=1.27.0'
)
optdepends=(
	'cloudflared: supervise a Cloudflare Tunnel when configured'
	'xdg-utils: open the embedded web UI in the default browser'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"svelte-${_svelte_version}-LICENSE.md::https://raw.githubusercontent.com/sveltejs/svelte/svelte@${_svelte_version}/LICENSE.md"
	"${pkgname}@.service"
)
b2sums=(
	'89bbace706967fbb0bb58190be260708855a0ce4f14b926c24a7a22c96884e6866934b52bd6ba857ac1cdd2d0a9b7edf0c268bdd3199346837b581b9216d511e'
	'953b77952d37d30851e8613b956924210f09f673f9e31e71cdffdb93d6e4c348192a4410415e9b8e87274c19ac97fe7faabd3326ff89b2a8334d120493a21d83'
	'c205139c8a247f7e6c2bf44e30bf2a8ddc93d9cfd053ce6dc1a65b0dc37d445f8d831bfdb927b6bee6122d748bbb77b3403c03da76e0dea1909d8cb560d5c66a'
)

prepare() {
	cd -- "${pkgname}-${pkgver}" || return 1

	local svelte_version
	svelte_version="$(
		awk '
			$1 == "svelte:" && !found { found = 1; next }
			found && $1 == "version:" { print $2; exit }
		' adminui/pnpm-lock.yaml
	)"
	[[ "${svelte_version}" == "${_svelte_version}" ]] || {
		printf 'Svelte license version mismatch: PKGBUILD uses %s, lockfile uses %s\n' \
			"${_svelte_version}" "${svelte_version:-missing}" >&2
		return 1
	}

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

check() {
	cd -- "${pkgname}-${pkgver}" || return 1

	export CGO_ENABLED=1
	export GOFLAGS='-mod=vendor -buildvcs=false'
	export GOTOOLCHAIN=local

	# This test feeds more than a million metrics lines through a fixed 2s HTTP
	# timeout. It is stable on its own, but can hit that timeout under the full
	# parallel race suite, so skip only this test instead of making builds flaky.
	go test \
		-race \
		-trimpath \
		-skip '^TestHealthCommandRequiresControlPlanePollAcceptsMetricAfterOversizedPrefix$' \
		./...
}

package() {
	cd -- "${pkgname}-${pkgver}" || return 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE NOTICE compliance/oss-license-report-client.txt \
		-t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/svelte-${_svelte_version}-LICENSE.md" \
		"${pkgdir}/usr/share/licenses/${pkgname}/svelte-${_svelte_version}-LICENSE.md"

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
