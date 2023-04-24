# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=opengamepadui-git
_pkgbase=OpenGamepadUI
pkgver=v0.9.7.r0.gd19b443
pkgrel=1
pkgdesc="Open source game launcher"
arch=('x86_64')
url="https://github.com/ShadowBlip/OpenGamepadUI"
license=('GPL')
groups=()
depends=('glibc' 'gcc-libs' 'libx11' 'libxres' 'libxcb' 'libxext' 'libxau'
	 'libxdmcp' 'gamescope' 'ryzenadj-git' 'firejail' 'networkmanager'
	 )
optdepends=()
makedepends=('godot' 'scons' 'pkgconf' 'gcc' 'libxcursor' 'libxinerama'
	     'libxi' 'libxrandr' 'mesa' 'glu' 'libglvnd' 'alsa-lib' 'make'
	     'unzip' 'wget' 'git'
	     )
provides=('opengamepadui')
conflicts=('opengamepadui-bin')
_tag=d19b443ba239064e5e69189bce27c0c1eba24de9
source=("${_pkgbase}::git+https://github.com/ShadowBlip/${_pkgbase}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgbase}"
}

build() {
	cd "$srcdir/${_pkgbase}"
	make import build
}

package() {
	options=('!strip')
	cd "$srcdir/${_pkgbase}"

	mkdir -p ${pkgdir}/usr/bin
        install -Dm755 rootfs/usr/bin/opengamepadui ${pkgdir}/usr/bin

	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install -Dm644 rootfs/usr/lib/systemd/user/ogui-qam.service ${pkgdir}/usr/lib/systemd/user
	
	mkdir -p ${pkgdir}/usr/lib/udev/hwdb.d
	install -Dm644 rootfs/usr/lib/udev/hwdb.d/59-opengamepadui-handheld.hwdb ${pkgdir}/usr/lib/udev/hwdb.d/59-opengamepadui-handheld.hwdb

	mkdir -p ${pkgdir}/usr/lib/udev/rules.d
	install -Dm644 rootfs/usr/lib/udev/rules.d/10-opengamepadui-handheld.rules ${pkgdir}/usr/lib/udev/rules.d/10-opengamepadui-handheld.rules
	
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/apps
	install -Dm444 rootfs/usr/share/icons/hicolor/scalable/apps/opengamepadui.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/opengamepadui.svg

	mkdir -p ${pkgdir}/usr/share/opengamepadui/scripts
	install -Dm644 build/libevdev.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libevdev.linux.template_debug.x86_64.so
	install -Dm644 build/libopensd.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libopensd.linux.template_debug.x86_64.so
	install -Dm644 build/libpty.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libpty.linux.template_debug.x86_64.so
	install -Dm644 build/libxlib.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libxlib.linux.template_debug.x86_64.so
	install -Dm755 build/opengamepad-ui.x86_64 ${pkgdir}/usr/share/opengamepadui/opengamepad-ui.x86_64
	install -Dm755 rootfs/usr/share/opengamepadui/scripts/powertools ${pkgdir}/usr/share/opengamepadui/scripts/powertools
	
	mkdir -p ${pkgdir}/usr/share/polkit-1/actions
	install -Dm644 rootfs/usr/share/polkit-1/actions/org.shadowblip.powertools.policy ${pkgdir}/usr/share/polkit-1/actions
}
