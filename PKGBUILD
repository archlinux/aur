# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: alice_aierlanta <aliceaierlanta@gmail.com>

_pkgname='ipfs-desktop'
# Match ipfs-desktop's Electron 42 workaround for the Wayland tray regression.
_electron_pkg='electron42'

pkgname="${_pkgname}-electron-bin"
pkgver='0.50.0'
pkgrel=1
pkgdesc='Desktop client for the InterPlanetary File System (prebuilt, system Electron and Kubo)'
# Only portable application assets remain after removing the bundled runtimes.
arch=('any')
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
	'bash'
	"${_electron_pkg}"
	'kubo>=0.43.0'
)
makedepends=('asar')
# The source-built package uses epoch=1; retain it in the compatibility version.
provides=("${_pkgname}=1:${pkgver}")
conflicts=("${_pkgname}")
options=('!debug')
source=(
	"${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.xz"
	"${_pkgname}-${pkgver}.LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
	"${_pkgname}.desktop"
	"${_pkgname}-startup.sh"
	"${_pkgname}-system-kubo-autostart.patch"
	'Inter-LICENSE.txt::https://raw.githubusercontent.com/rsms/inter/3ac1bd32a473ea60d40d8f444820247e96dd7e70/LICENSE.txt'
	'Montserrat-OFL.txt::https://raw.githubusercontent.com/JulietaUla/Montserrat/fc12e6819947c76db917f9d589a1d327e37a7b6b/OFL.txt'
	"${_pkgname}-daemon-startup.patch"
)
b2sums=(
	'c44d515a6318e8d628869cad374942f4187db29553622391345547a8656fd2d5ad1665fe1114e77678299a6874dade828d04e99943f20980d8c215f8ac4fb12c'
	'2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d'
	'849d57fd59653ed0c6eca01769ad12a01f37f6a5316f1a83c0bf7cae576074b978e3ca555d50a56114d177e5fe4817338106698716f054a3e18ae1c81d7a8785'
	'bb51f22c1cf58020bbb9d7f9dde2bfd6f838443130d89539c9ce2474f5a1987b332f63dd21b8a903880a77f96d58e8a868d0468e15d266357bdfe3409380eab2'
	'6ab7dc45ad9ca9748215f78368433178508266da9156128dc4e3f53afb31746cfd247e9e1438356e4b14efc1430fcd85aa01d3f103be35824859f068ad2c9c06'
	'5417464983de312c9c2a250c64281d82c17fd531f78ceccaa44d97c6999a3faf61324eaaf588240a9d0f9319bb302b7d7ed88bdbc55c188efd0357645190690a'
	'93047b82ab53aa80f1db73e4f9d0d2b2ac30fcee1be00b2b43c63a63da1ec41b32935acca720ed4b31d3cfd0e57d61faaf79be4951a90fa973312ab22e4f1488'
	'0157eb4126e3a5a5bf0dae83ba1ee36f89703433c4eda62e4d639a2b1d6b036c0e84177d9c1cf0c1e4f0e1b59ab83a147150314f832d991fc2f53190f12fc55a'
)

prepare() {
	asar extract "${srcdir}/${_pkgname}-${pkgver}-linux-x64/resources/app.asar" \
		"${srcdir}/${_pkgname}-${pkgver}"

	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	patch --no-backup-if-mismatch -Np1 -i "${srcdir}/${_pkgname}-system-kubo-autostart.patch"
	patch --no-backup-if-mismatch -Np1 -i "${srcdir}/${_pkgname}-daemon-startup.patch"

	# Keep the JS module and its version metadata, but not the bundled daemon.
	rm -rf -- node_modules/kubo/kubo
}

check() {
	local _version

	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	_version=$(sed -nE 's/^[[:space:]]*"version":[[:space:]]*"([^"]+)".*/\1/p' package.json)
	[[ "${_version}" == "${pkgver}" ]] || {
		printf 'Application version mismatch: expected %s, found %s\n' \
			"${pkgver}" "${_version}" >&2
		return 1
	}
	[[ -s assets/webui/index.html && ! -e node_modules/kubo/kubo ]] || {
		printf '%s\n' 'Missing prebuilt WebUI or unexpected bundled Kubo payload' >&2
		return 1
	}

	# Do not silently publish native code as arch=any after an upstream change.
	find . -type f -exec file --brief --mime-type -- {} + \
		> "${srcdir}/${_pkgname}-file-types.txt" || return 1
	if grep -Eq '^application/(x-(executable|pie-executable|sharedlib|object|dosexec|mach-binary)|vnd.microsoft.portable-executable)$' \
		"${srcdir}/${_pkgname}-file-types.txt"; then
		printf '%s\n' 'Unexpected native application payload; review arch=any before packaging' >&2
		return 1
	fi
}

package() {
	local _license

	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	install -dm755 -- "${pkgdir}/usr/lib/${_pkgname}"
	# Repack the already-built application; no compilation or dependency download.
	asar pack . "${pkgdir}/usr/lib/${_pkgname}/app.asar" \
		--unpack 'src/**/scripts/**/*'

	install -Dm644 -- assets/webui/ipfs-logo-512-ice.png \
		"${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 -- "${srcdir}/${_pkgname}-${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	for _license in 'Inter-LICENSE.txt' 'Montserrat-OFL.txt'; do
		install -Dm644 -- "${srcdir}/${_license}" \
			"${pkgdir}/usr/share/licenses/${pkgname}/webui/${_license}"
	done

	# Preserve bundled dependency notices outside the ASAR as well as inside it.
	while IFS= read -r -d '' _license; do
		install -Dm644 -- "${_license}" \
			"${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
	done < <(find node_modules -type f \( -iname 'license*' -o -iname 'copying*' -o -iname 'notice*' \) -print0)
	for _license in assets/webui/static/js/*.LICENSE.txt; do
		install -Dm644 -- "${_license}" \
			"${pkgdir}/usr/share/licenses/${pkgname}/webui/${_license##*/}"
	done

	sed "s|@ELECTRON_PKG@|${_electron_pkg}|" \
		"${srcdir}/${_pkgname}-startup.sh" \
		| install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 -- "${srcdir}/${_pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
