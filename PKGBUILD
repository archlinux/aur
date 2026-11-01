# Maintainer: RubenKelevra <rubenkelevra@gmail.com>

pkgname=tunnel-client
pkgver=0.0.19
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
	'nodejs'
	'pnpm>=11.25.0'
)
optdepends=(
	'cloudflared: supervise a Cloudflare Tunnel when configured'
	'xdg-utils: open the embedded web UI in the default browser'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"svelte-${_svelte_version}-LICENSE.md::https://raw.githubusercontent.com/sveltejs/svelte/svelte@${_svelte_version}/LICENSE.md"
	"${pkgname}@.service"
	'service-health-defaults.patch'
)
b2sums=(
	'9bf68a3f0ca6df25f5cba1748451ecc5974c06d078241ba180bae45b6b8bec6036eb8e185eb476581488d88c62e30aa1f3fe873f1f3e9fee0deeb628913c65f3'
	'953b77952d37d30851e8613b956924210f09f673f9e31e71cdffdb93d6e4c348192a4410415e9b8e87274c19ac97fe7faabd3326ff89b2a8334d120493a21d83'
	'b42dfcec888344f8400fd23c4f3be9046a4cdf4c22924ace08a453b68920dc972bb55ab4cfe0ee02773b36b525083151000cf6e3c4cdb74ef0d44714e19eb1c1'
	'523c11d4fba576f33208fbb3880ecaecd6c9b8c265645e5444e0d3663a631e6cdc30802d01256d7eef95f8f91a7e981b87173530e2d0fdc8b0463d6da07a1b1a'
)

_limit_go_jobs() {
	if [[ -n "${GOFLAGS:-}" ]]; then
		export GOFLAGS
	fi
	if [[ -n "${GOMAXPROCS:-}" ]]; then
		export GOMAXPROCS
		return 0
	fi
	[[ -z "${GOFLAGS:-}" ]] || return 0

	local -a makeflags
	local flag jobs='' i
	read -r -a makeflags <<< "${MAKEFLAGS:-}"
	for ((i = 0; i < ${#makeflags[@]}; i++)); do
		flag="${makeflags[i]}"
		case "${flag}" in
			-j|--jobs)
				jobs=''
				if ((i + 1 < ${#makeflags[@]})) && [[ "${makeflags[i+1]}" =~ ^[0-9]+$ ]]; then
					jobs="${makeflags[i+1]}"
					((i += 1))
				fi
				;;
			-j[0-9]*) jobs="${flag#-j}" ;;
			--jobs=[0-9]*) jobs="${flag#--jobs=}" ;;
		esac
	done

	if [[ "${jobs}" =~ ^[1-9][0-9]*$ ]]; then
		export GOMAXPROCS="${jobs}"
	fi
}

prepare() {
	cd -- "${pkgname}-${pkgver}" || return 1

	patch -Np1 --fuzz=0 -i "${srcdir}/service-health-defaults.patch"
	export GOTOOLCHAIN=local
	_limit_go_jobs

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

	pnpm --dir adminui install \
		--frozen-lockfile \
		--config.shared-workspace-lockfile=false \
		--config.confirmModulesPurge=false \
		--store-dir "${srcdir}/pnpm-store"

	go mod vendor
}

build() {
	cd -- "${pkgname}-${pkgver}" || return 1

	export CGO_ENABLED=0
	export GOTOOLCHAIN=local
	_limit_go_jobs

	npm_config_offline=true pnpm --dir adminui run build

	go build \
		-buildmode=pie \
		-trimpath \
		-mod=vendor \
		-buildvcs=false \
		-ldflags='-bindnow' \
		-o "${pkgname}" \
		./cmd/client
}

check() {
	cd -- "${pkgname}-${pkgver}" || return 1

	if ! readelf -W -l "${pkgname}" | grep -Eq '^[[:space:]]*GNU_RELRO[[:space:]]'; then
		printf 'Built executable is missing GNU_RELRO\n' >&2
		return 1
	fi
	if ! readelf -W -d "${pkgname}" | grep -Fq 'BIND_NOW'; then
		printf 'Built executable is missing BIND_NOW\n' >&2
		return 1
	fi

	export CGO_ENABLED=1
	export GOTOOLCHAIN=local
	_limit_go_jobs

	pnpm --dir adminui test

	# This test feeds more than a million metrics lines through a fixed 2s HTTP
	# timeout. It is stable on its own, but can hit that timeout under the full
	# parallel race suite, so skip only this test instead of making builds flaky.
	go test \
		-race \
		-trimpath \
		-mod=vendor \
		-buildvcs=false \
		-skip '^TestHealthCommandRequiresControlPlanePollAcceptsMetricAfterOversizedPrefix$' \
		./...

	# Run this timeout-sensitive case separately from the parallel race suite.
	go test \
		-race \
		-trimpath \
		-mod=vendor \
		-buildvcs=false \
		-count=1 \
		-run '^TestHealthCommandRequiresControlPlanePollAcceptsMetricAfterOversizedPrefix$' \
		./cmd/client
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
