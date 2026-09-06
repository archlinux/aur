# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Alex Henrie <alexhenrie24@gmail.com>

_electron_pkg='electron42'
_webui_cid='bafybeiciqeyipumpmhxzlxnbqdbbv6u5uij4hy4wax64dmj7kvrhusiq6y'

pkgname='ipfs-desktop'
pkgver='0.50.0'
pkgrel=3
epoch=1
pkgdesc='Desktop client for the InterPlanetary File System'
arch=('x86_64')
url="https://github.com/ipfs/${pkgname}"
license=('MIT')
depends=(
	"${_electron_pkg}"
	'kubo>=0.43.0'
)
makedepends=(
	'nodejs'
	'npm'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"webui-${_webui_cid}.car::https://trustless-gateway.link/ipfs/${_webui_cid}?format=car"
	"${pkgname}.desktop"
	"${pkgname}-startup.sh"
	"${pkgname}-system-kubo-autostart.patch"
	"${pkgname}-startup-race.patch"
)
b2sums=(
	'c5691c946de525abb185fa44ea66ff9c5fa15b936d3dd6e7d0c3a6da8b158e4b8c883b1d948c33e7333bf5e7def1fc6677c4c721a67956db56e817260db36cff'
	'49e1e7d4d55325d4ea05561a4ff4c64537988e5e841231a95d59328fc9f9b60f3098185bf757b70c42d2175f8a2b6394a0f2a9377df7d1603d69edbd4c3655ec'
	'849d57fd59653ed0c6eca01769ad12a01f37f6a5316f1a83c0bf7cae576074b978e3ca555d50a56114d177e5fe4817338106698716f054a3e18ae1c81d7a8785'
	'353367dc9c554b8decbee724713faf627e4764f77c1522d3939069e5db4e6caffc847e20e75afccdee0e1d0e025c4bb6c16a80e9655bf8d76412dc37ef8eff64'
	'5e6b97ee8aec2cbf4e125ae2ced3f23dd77c45b7291ea63f8ed7f5cee1eb7caaab27dad979f61deefe204539389b0c18d418fc6724cec58eddcea944a46d936e'
	'cfe44691998e7c860dc7cb00cbd13688c8cb76a3da952a15f2df41de734f7e242dde18d8c6ee8a0c0c887091aec3198dbce898dd85862d5e4cb168bf05cd74d4'
)

_pkgsrc="${pkgname}-${pkgver}"

_electron_env() {
	local _version_file="/usr/lib/${_electron_pkg}/version"

	[[ -r "${_version_file}" ]] || {
		printf 'Missing Electron version file: %s\n' "${_version_file}" >&2
		return 1
	}

	SYSTEM_ELECTRON_VERSION=$(<"${_version_file}")
	[[ -n "${SYSTEM_ELECTRON_VERSION}" ]] || {
		printf 'Electron version file is empty: %s\n' "${_version_file}" >&2
		return 1
	}

	export SYSTEM_ELECTRON_VERSION
}

_warn_if_electron_outdated() {
	local _installed _latest_local _vf _v

	[[ -r "/usr/lib/${_electron_pkg}/version" ]] || return 0
	_installed=$(< "/usr/lib/${_electron_pkg}/version")
	_latest_local=$_installed

	shopt -s nullglob
	for _vf in /usr/lib/electron*/version; do
		_v=$(< "$_vf")
		if [[ "$(printf '%s\n%s\n' "$_latest_local" "$_v" | sort -V | tail -n1)" != "$_latest_local" ]]; then
			_latest_local=$_v
		fi
	done
	shopt -u nullglob

	if [[ $_installed != "$_latest_local" ]]; then
		echo "==> WARNING: Packaging uses not the latest major version of electron installed. ${_electron_pkg} ${_installed} is used, but a newer local Electron version (${_latest_local}) is available on the system." >&2
	fi
}

prepare() (
	local _car_path
	local _expected_webui_cid
	local _ipfs_path
	local _kubo_version
	local _webui_path="${srcdir}/webui-${_webui_cid}"

	cd -- "${_pkgsrc}" || return 1
	patch -Np1 -i "${srcdir}/${pkgname}-system-kubo-autostart.patch"
	patch -Np1 -i "${srcdir}/${pkgname}-startup-race.patch"

	_expected_webui_cid=$(
		sed -nE \
			'/"build:webui:download"/s/.*[[:space:]]-c[[:space:]]+([^[:space:]\"]+).*/\1/p' \
			package.json
	)
	[[ -n "${_expected_webui_cid}" ]] || {
		printf '%s\n' 'Unable to determine the WebUI CID expected by upstream' >&2
		return 1
	}
	[[ "${_webui_cid}" == "${_expected_webui_cid}" ]] || {
		printf 'WebUI CID mismatch: PKGBUILD has %s, upstream expects %s\n' \
			"${_webui_cid}" "${_expected_webui_cid}" >&2
		printf 'Update _webui_cid and its source checksum before building.\n' >&2
		return 1
	}

	_ipfs_path=$(mktemp -d --tmpdir "${pkgname}-kubo.XXXXXXXX") || return 1
	trap 'rm -rf -- "${_ipfs_path}"' EXIT

	_car_path=$(readlink -f -- "${srcdir}/webui-${_webui_cid}.car")
	[[ -f "${_car_path}" ]] || {
		printf 'WebUI CAR is missing: %s\n' "${_car_path}" >&2
		return 1
	}

	IPFS_PATH="${_ipfs_path}" ipfs init --profile=server >/dev/null
	IPFS_PATH="${_ipfs_path}" ipfs dag import "${_car_path}" >/dev/null

	rm -rf -- "${_webui_path}"
	IPFS_PATH="${_ipfs_path}" ipfs get "/ipfs/${_webui_cid}" -o "${_webui_path}"
	[[ -f "${_webui_path}/index.html" ]] || {
		printf 'Materialized WebUI is missing index.html: %s\n' "${_webui_path}" >&2
		return 1
	}

	_kubo_version=$(sed -nE 's/^[[:space:]]*"kubo":[[:space:]]*"([^"]+)".*/\1/p' package.json)
	[[ -n "${_kubo_version}" ]] || {
		printf '%s\n' 'Unable to determine the bundled Kubo version' >&2
		return 1
	}

	npm pkg set "allowScripts[kubo@${_kubo_version}]=false" --json
	npm ci --no-audit --no-fund \
		2> >(sed '/glob@11\.1\.0: Old versions of glob are not supported/d' >&2)

	[[ ! -e node_modules/kubo/kubo/ipfs ]] || {
		printf '%s\n' 'Unexpected bundled Kubo binary found after npm install' >&2
		return 1
	}
)

build() {
	local -a _builder_options

	_warn_if_electron_outdated
	_electron_env
	cd -- "${_pkgsrc}" || return 1

	IPFS_WEBUI_PATH="${srcdir}/webui-${_webui_cid}" \
		npm_config_offline=true npm run build

	_builder_options=(
		"-c.electronDist=/usr/lib/${_electron_pkg}"
		"-c.electronVersion=${SYSTEM_ELECTRON_VERSION}"
	)
	npm_config_offline=true npm exec -- electron-builder --linux --dir --publish never \
		"${_builder_options[@]}"
}

package() {
	mkdir -p -- "${pkgdir}/usr/lib/${pkgname}"
	cp -a -- "${_pkgsrc}/dist/linux-unpacked/resources/." "${pkgdir}/usr/lib/${pkgname}/"

	install -Dm644 -- "${_pkgsrc}/assets/webui/ipfs-logo-512-ice.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 -- "${_pkgsrc}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	sed "s|@ELECTRON_PKG@|${_electron_pkg}|" \
		"${srcdir}/${pkgname}-startup.sh" \
		| install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -- "${srcdir}/${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"

	chmod -R u+rwX,go+rX,go-w -- "${pkgdir}"
}
