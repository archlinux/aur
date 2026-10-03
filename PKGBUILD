# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: xiota <aur@mentalfossa.com>
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

_pkgname='thorium-browser'
pkgname="${_pkgname}-sse4-bin"
pkgbase="${pkgname}"
pkgver=138.0.7204.303
pkgrel=1
pkgdesc='SSE4.1 build of the Chromium fork focused on high performance and security'
url='https://github.com/Alex313031/thorium'
license=(
	'BSD-3-Clause'
	'LicenseRef-Google-Widevine-CDM'
)
arch=('x86_64')
makedepends=('libarchive')
depends=(
	'alsa-lib'
	'at-spi2-core'
	'cairo'
	'dbus'
	'expat'
	'glib2'
	'gtk3'
	'hicolor-icon-theme'
	'libcups'
	'libgcc'
	'libnotify'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxkbcommon'
	'libxrandr'
	'mesa'
	'nspr'
	'nss'
	'pango'
	'systemd-libs'
	'ttf-liberation'
	'xdg-utils'
)
optdepends=(
	'gtk4: GTK4 UI support'
	'kdialog: native dialogs on Plasma'
	'libsecret: password storage client integration'
	'org.freedesktop.secrets: Secret Service backend for password storage'
	'pipewire: WebRTC desktop sharing under Wayland'
	'qt5-base: Qt5 UI support'
	'qt6-base: Qt6 UI support'
	'upower: Battery Status API support'
)
provides=("${_pkgname}=${pkgver}")
conflicts=(
	"${_pkgname}"
	'thorium-browser-avx-bin'
	'thorium-browser-sse3-bin'
)
options=(
	'!emptydirs'
	'!strip'
	'!debug'
)

_dl_url="${url}/releases/download/M${pkgver}"
_dl_filename_x86_64="${_pkgname}_${pkgver}_SSE4.deb"
_license_filename="${_pkgname}-${pkgver}-LICENSE.md"
_data_archive='data.tar.xz'
noextract=("${_dl_filename_x86_64}")

source=(
	"${_pkgname}.sh"
	'thorium-cpu-check.sh'
	'thorium-shell.sh'
	"${_license_filename}::${url}/raw/M${pkgver}/LICENSE.md"
)
source_x86_64=("${_dl_url}/${_dl_filename_x86_64}")
b2sums=(
	'038ce007f34bc9c519bcc1918ca472cf6596a1dade80b9b150021762a51cf28bc331bb82299110023593f569b9cf285c9ed60d695cfd2abf82d0bf9073ceeee5'
	'7a9535fa73f8fcfc50dfe1de885c7ea92d104720187d42012fa95bd671e39ec6cb599295e13019712a115b1139d2bedf9969cc7d7472bcf4295380aed91f2f44'
	'867bc169f526a530a79d1eef5cc463d1c386d380bb574228a46492c9c85fc5dcdaa8768e08282dbe5ed660458613b67da8e3f822a3c9d93866e2252f3332b672'
	'28458cd9c4ad393fa16d5b0d7bd058643039a5b02769cb10ca7fec2d92929ce4814fd2a6bc594cbb9d5878495f31d3e5f9f44a69c35ab34a7cd21d8d30dca840'
)
sha256sums_x86_64=('34cbc8d3a7982bc461e20cb046d819631fd8aff9b68db6c0b10bfe42df5b025b')

prepare() {
	CARCH="${CARCH}" bash "${srcdir}/thorium-cpu-check.sh" build
}

package() {
	printf '  -> Extracting the archive...\n'
	rm -f -- "${srcdir}/${_data_archive}"
	bsdtar -C "${srcdir}" -xf "${srcdir}/${_dl_filename_x86_64}" "${_data_archive}"
	bsdtar -C "${pkgdir}/" -xJf "${srcdir}/${_data_archive}"
	rm -f -- "${srcdir}/${_data_archive}"

	printf '  -> Moving files in place...\n'
	mv -- "${pkgdir}/opt/chromium.org/thorium" "${pkgdir}/opt/${_pkgname}"
	unlink -- "${pkgdir}/usr/bin/thorium-browser"
	unlink -- "${pkgdir}/usr/bin/pak"

	# thorium-browser
	install -Dm755 -- "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 -- "${srcdir}/thorium-cpu-check.sh" \
		"${pkgdir}/usr/lib/${_pkgname}/check-cpu-support"
	chmod 4755 -- "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

	local widevine_dir="${pkgdir}/opt/${_pkgname}/WidevineCdm"
	if [[ ! -f ${widevine_dir}/_platform_specific/linux_x64/libwidevinecdm.so || ! -f ${widevine_dir}/LICENSE ]]; then
		printf 'Missing bundled x86_64 Widevine CDM or license\n' >&2
		return 1
	fi
	install -Dm644 -- "${widevine_dir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/Widevine-LICENSE"

	# Fix upstream paths after moving Thorium out of /opt/chromium.org.
	if [[ -f ${pkgdir}/opt/${_pkgname}/default-app-block ]]; then
		sed -E \
			-e "s@/opt/chromium.org/thorium/@/opt/${_pkgname}/@g" \
			-i -- "${pkgdir}/opt/${_pkgname}/default-app-block"
	fi

	# Bring upstream AppStream metadata up to the current schema and path.
	local metainfo_source="${pkgdir}/usr/share/appdata/thorium-browser.appdata.xml"
	local metainfo_file="${pkgdir}/usr/share/metainfo/org.chromium.Thorium.metainfo.xml"
	if [[ ! -f ${metainfo_source} ]]; then
		printf 'Missing Thorium AppStream metadata: %s\n' "${metainfo_source}" >&2
		return 1
	fi
	install -Dm644 -- "${metainfo_source}" "${metainfo_file}"
	rm -f -- "${metainfo_source}"
	rmdir --ignore-fail-on-non-empty -- "${pkgdir}/usr/share/appdata"
	sed -E \
		-e 's@<id>thorium-browser[.]desktop</id>@<id>org.chromium.Thorium</id>@' \
		-e '/<translation\/>/d' \
		-e 's@<developer_name>([^<]+)</developer_name>@<developer id="io.github.alex313031"><name>\1</name></developer>@' \
		-i -- "${metainfo_file}"
	if ! grep -q '<launchable type="desktop-id">' "${metainfo_file}"; then
		sed -i '/<url type="bugtracker">/i\  <launchable type="desktop-id">thorium-browser.desktop</launchable>' \
			"${metainfo_file}"
	fi
	if ! grep -q '<content_rating type="oars-1.1"' "${metainfo_file}"; then
		sed -i '/<url type="bugtracker">/i\  <content_rating type="oars-1.1"/>' \
			"${metainfo_file}"
	fi

	# thorium-shell
	install -Dm755 -- "${srcdir}/thorium-shell.sh" "${pkgdir}/usr/bin/thorium-shell"
	sed -E \
		-e 's@^Icon=.*@Icon=thorium-shell@' \
		-i -- "${pkgdir}/usr/share/applications/thorium-shell.desktop"

	# thorium-browser.xml
	sed -E \
		-e "s@/opt/chromium.org/thorium/@/opt/${_pkgname}/@" \
		-i -- "${pkgdir}/usr/share/gnome-control-center/default-apps/thorium-browser.xml"

	# Icons
	install -Dm644 -- "${pkgdir}/opt/${_pkgname}/product_logo_256.png" \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
	install -Dm644 -- "${pkgdir}/opt/${_pkgname}/thorium_shell.png" \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/thorium-shell.png"

	# Clean up upstream Debian packaging files.
	rm -r -- \
		"${pkgdir}/opt/chromium.org" \
		"${pkgdir}/etc/cron.daily/" \
		"${pkgdir}/usr/share/doc/" \
		"${pkgdir}/opt/${_pkgname}/cron/" \
		"${pkgdir}/opt/${_pkgname}"/product_logo_*.{png,xpm} \
		"${pkgdir}/usr/share/menu/"

	install -Dm644 -- "${srcdir}/${_license_filename}" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
