# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=opengamepadui-bin
_pkgbase=opengamepadui
pkgver=0.32.6
pkgrel=1
pkgdesc="Open source game launcher"
arch=('x86_64')
url="https://github.com/ShadowBlip/OpenGamepadUI"
license=('GPL')
depends=('glibc' 'gcc-libs' 'libx11' 'libxres' 'libxcb' 'libxext' 'libxau'
	'libxdmcp' 'gamescope' 'vulkan-tools' 'inputplumber'
	'mesa-utils'
)
optdepends=('firejail' 'bubblewrap' 'wireplumber' 'networkmanager' 'bluez' 'dbus' 'powerstation')
provides=('opengamepadui')
conflicts=('opengamepadui-git')
source=(opengamepadui-v$pkgver.tar.gz::https://github.com/ShadowBlip/OpenGamepadUI/releases/download/v$pkgver/opengamepadui.tar.gz)

sha256sums=('03cc67bee5cca0a9121903260e9ce6768088ce62569ad848e35cb1f74d683df0')

package() {
	options=('!strip')
	cd "$srcdir/${_pkgbase}"

	mkdir -p "${pkgdir}"/usr/bin
	install -Dm755 usr/bin/opengamepadui "${pkgdir}"/usr/bin

	mkdir -p "${pkgdir}"/usr/lib/systemd/user
	install -Dm644 usr/lib/systemd/user/ogui-overlay-mode.service "${pkgdir}"/usr/lib/systemd/user

	mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
	install -Dm444 usr/share/icons/hicolor/scalable/apps/opengamepadui.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/opengamepadui.svg

	mkdir -p "${pkgdir}"/usr/share/opengamepadui/scripts
	install -Dm644 usr/share/opengamepadui/libpty.linux.template_debug.x86_64.so "${pkgdir}"/usr/share/opengamepadui/libpty.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libxlib.linux.template_debug.x86_64.so "${pkgdir}"/usr/share/opengamepadui/libxlib.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libunixsock.linux.template_debug.x86_64.so "${pkgdir}"/usr/share/opengamepadui/libunixsock.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libdbus.linux.template_debug.x86_64.so "${pkgdir}"/usr/share/opengamepadui/libdbus.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/liblinuxthread.linux.template_debug.x86_64.so "${pkgdir}"/usr/share/opengamepadui/liblinuxthread.linux.template_debug.x86_64.so
	install -Dm755 usr/share/opengamepadui/opengamepad-ui.x86_64 "${pkgdir}"/usr/share/opengamepadui/opengamepad-ui.x86_64
	install -Dm755 usr/share/opengamepadui/scripts/manage_input "${pkgdir}"/usr/share/opengamepadui/scripts/manage_input
	install -Dm755 usr/share/opengamepadui/scripts/make_nice "${pkgdir}"/usr/share/opengamepadui/scripts/make_nice
	setcap 'cap_sys_nice=eip' "${pkgdir}/usr/share/opengamepadui/opengamepad-ui.x86_64"

	mkdir -p "${pkgdir}"/usr/share/polkit-1/actions
	install -Dm644 usr/share/polkit-1/actions/org.shadowblip.manage_input.policy "${pkgdir}"/usr/share/polkit-1/actions/org.shadowblip.manage_input.policy
	install -Dm644 usr/share/polkit-1/actions/org.shadowblip.setcap.policy "${pkgdir}"/usr/share/polkit-1/actions/org.shadowblip.setcap.policy
}
