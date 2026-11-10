# Maintainer: Anany Sachan <ananysachan2005@gmail.com>
pkgname=openmausbot-bin
_pkgname=OpenMausBot
pkgver=0.1.151
pkgrel=1
pkgdesc="Local-first chat app for running a team of AI agents"
arch=('x86_64')
url="https://github.com/milind-soni/OpenMausBot"
license=('Apache-2.0')
depends=(
	'alsa-lib'
	'at-spi2-core'
	'cairo'
	'dbus'
	'expat'
	'glib2'
	'glibc'
	'gtk3'
	'libcups'
	'libgcc'
	'libnotify'
	'libsecret'
	'libstdc++'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxi'
	'libxkbcommon'
	'libxrandr'
	'mesa'
	'nspr'
	'nss'
	'pango'
	'systemd-libs'
	'xdg-utils'
)
provides=('openmausbot')
conflicts=('openmausbot')
# Bundled binaries are prebuilt; stripping changes cua-driver's checksum from the one in release.json
options=('!debug' '!strip')
source=("${_pkgname}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('b7ea8a9b3f9cf2023eee180c293a675906b4442ccdfefdd8e8f6d2b8f8dc152d')

package() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

	# Electron's Chromium sandbox must be setuid root, as the .deb's postinst sets it
	chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

	# Without package-type, electron-updater falls back to its AppImage updater, which stays
	# inactive outside an AppImage. Updates come from pacman instead of `apt-get install`.
	rm "${pkgdir}/opt/${_pkgname}/resources/package-type"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/openmausbot" "${pkgdir}/usr/bin/openmausbot"
}
