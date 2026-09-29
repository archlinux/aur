# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: tee < teeaur at duck dot com >
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname='ipfs-desktop'

pkgname="${_pkgname}-bin"
pkgver='0.50.1'
pkgrel=1
pkgdesc='Desktop client for the InterPlanetary File System (prebuilt, bundled Electron and Kubo)'
arch=('x86_64')
url="https://github.com/ipfs/${_pkgname}"
license=(
	'0BSD'
	'Apache-2.0'
	'BSD-2-Clause'
	'BSD-3-Clause'
	'BlueOak-1.0.0'
	'ISC'
	'MIT'
	'OFL-1.1'
	'Python-2.0'
)
depends=(
	'alsa-lib'
	'at-spi2-core'
	'cairo'
	'dbus'
	'expat'
	'glib2'
	'gtk3'
	'libcups'
	'libappindicator'
	'libgcc'
	'libnotify'
	'libsecret'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxkbcommon'
	'libxrandr'
	'libxss'
	'libxtst'
	'mesa'
	'nspr'
	'nss'
	'pango'
	'systemd-libs'
	'util-linux-libs'
	'xdg-utils'
)
makedepends=('asar')
# The canonical source package uses epoch=1; expose the same compatibility version.
provides=("${_pkgname}=1:${pkgver}")
conflicts=("${_pkgname}")
options=(
	'!debug'
	'!strip'
)

_pkgsrc="${_pkgname}-${pkgver}-linux-x64"
_appsrc="${_pkgname}-${pkgver}-app"

source=(
	"${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.xz"
	"${_pkgname}-${pkgver}.LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
	"${_pkgname}-${pkgver}.CHANGELOG.md::${url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
	"${_pkgname}-${pkgver}.README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
	"${_pkgname}.desktop"
	"${_pkgname}-startup.sh"
	'Inter-LICENSE.txt::https://raw.githubusercontent.com/rsms/inter/3ac1bd32a473ea60d40d8f444820247e96dd7e70/LICENSE.txt'
	'Montserrat-OFL.txt::https://raw.githubusercontent.com/JulietaUla/Montserrat/fc12e6819947c76db917f9d589a1d327e37a7b6b/OFL.txt'
)
sha256sums=(
	'9e78001c1cdd463c687175499a7448c348d1fffed1445a49b1da4301f0fd3cd7'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)
b2sums=(
	'SKIP'
	'2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d'
	'855b085a061491f799337c6c01100f6956b6a60e7dd6fdba30087c24c3f35d08207952884896d2913c6ffdbb7ce700dbb3679e7764879c05001ab669567db7c1'
	'9a230bd0ed9107202e40dbc1974e56077c6c3f25ccf6254e309bb76178e25b66e831d02a04a4fac7761222635cbdc797d958e330e39586a9666b84506674819e'
	'849d57fd59653ed0c6eca01769ad12a01f37f6a5316f1a83c0bf7cae576074b978e3ca555d50a56114d177e5fe4817338106698716f054a3e18ae1c81d7a8785'
	'4f9eaf321cb8a416083a798136c798553adfc65e74111cb0fc67a924b8d5ed310308f073a265e8f2632dc300daf1eaf3666cd6bc0138d02882d6fef22452bc99'
	'5417464983de312c9c2a250c64281d82c17fd531f78ceccaa44d97c6999a3faf61324eaaf588240a9d0f9319bb302b7d7ed88bdbc55c188efd0357645190690a'
	'93047b82ab53aa80f1db73e4f9d0d2b2ac30fcee1be00b2b43c63a63da1ec41b32935acca720ed4b31d3cfd0e57d61faaf79be4951a90fa973312ab22e4f1488'
)

prepare() {
	rm -rf -- "${srcdir}/${_appsrc}"
	asar extract "${srcdir}/${_pkgsrc}/resources/app.asar" "${srcdir}/${_appsrc}"
}

check() {
	local _app_version
	local _bundled_kubo_version
	local _expected_kubo_version
	local _kubo="${srcdir}/${_pkgsrc}/resources/app.asar.unpacked/node_modules/kubo/kubo/ipfs"

	_app_version=$(sed -nE 's/^[[:space:]]*"version":[[:space:]]*"([^"]+)".*/\1/p' "${srcdir}/${_appsrc}/package.json")
	[[ "${_app_version}" == "${pkgver}" ]] || {
		printf 'Application version mismatch: expected %s, found %s\n' "${pkgver}" "${_app_version}" >&2
		return 1
	}

	_expected_kubo_version=$(sed -nE 's/^[[:space:]]*"kubo":[[:space:]]*"([^"]+)".*/\1/p' "${srcdir}/${_appsrc}/package.json")
	[[ -n "${_expected_kubo_version}" ]] || {
		printf '%s\n' 'Unable to determine bundled Kubo version from application metadata' >&2
		return 1
	}
	[[ -x "${_kubo}" ]] || {
		printf 'Bundled Kubo binary is missing: %s\n' "${_kubo}" >&2
		return 1
	}
	_bundled_kubo_version=$("${_kubo}" version --number)
	[[ "${_bundled_kubo_version}" == "${_expected_kubo_version}" ]] || {
		printf 'Bundled Kubo version mismatch: metadata has %s, binary reports %s\n' "${_expected_kubo_version}" "${_bundled_kubo_version}" >&2
		return 1
	}

	[[ -x "${srcdir}/${_pkgsrc}/${_pkgname}" ]] || {
		printf '%s\n' 'Bundled Electron application executable is missing' >&2
		return 1
	}
	[[ -s "${srcdir}/${_appsrc}/assets/webui/index.html" ]] || {
		printf '%s\n' 'Bundled WebUI is missing' >&2
		return 1
	}
	[[ -s "${srcdir}/${_pkgsrc}/LICENSE.electron.txt" && -s "${srcdir}/${_pkgsrc}/LICENSES.chromium.html" ]] || {
		printf '%s\n' 'Bundled Electron/Chromium license material is missing' >&2
		return 1
	}
}

package() {
	local _bundle="${srcdir}/${_pkgsrc}"
	local _license

	install -dm755 -- "${pkgdir}/opt/${_pkgname}"
	cp -a --no-preserve=ownership "${_bundle}/." "${pkgdir}/opt/${_pkgname}/"

	# Keep Electron sandboxing enabled even on systems without unprivileged user namespaces.
	chmod 4755 -- "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

	install -Dm755 -- "${srcdir}/${_pkgname}-startup.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 -- "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 -- "${srcdir}/${_appsrc}/assets/webui/ipfs-logo-512-ice.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	install -Dm644 -- "${srcdir}/${_pkgname}-${pkgver}.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/ipfs-desktop/LICENSE"
	install -Dm644 -- "${_bundle}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/electron/LICENSE.electron.txt"
	install -Dm644 -- "${_bundle}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/electron/LICENSES.chromium.html"

	for _license in 'Inter-LICENSE.txt' 'Montserrat-OFL.txt'; do
		install -Dm644 -- "${srcdir}/${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/webui/${_license}"
	done

	while IFS= read -r -d '' _license; do
		install -Dm644 -- "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license#"${srcdir}/${_appsrc}/"}"
	done < <(find "${srcdir}/${_appsrc}/node_modules" -type f \( -iname 'license*' -o -iname 'copying*' -o -iname 'notice*' \) -print0)

	while IFS= read -r -d '' _license; do
		install -Dm644 -- "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/webui/${_license##*/}"
	done < <(find "${srcdir}/${_appsrc}/assets/webui/static/js" -maxdepth 1 -type f -name '*.LICENSE.txt' -print0)

	for _license in LICENSE LICENSE-MIT LICENSE-APACHE; do
		install -Dm644 -- "${_bundle}/resources/app.asar.unpacked/node_modules/kubo/kubo/${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/kubo/${_license}"
	done

	install -Dm644 -- "${srcdir}/${_pkgname}-${pkgver}.CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
	install -Dm644 -- "${srcdir}/${_pkgname}-${pkgver}.README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
