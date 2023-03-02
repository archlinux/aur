# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=ogui-git
_pkgbase=OpenGamepadUI
pkgver=v0.1.0.r6.g1fa9b4c
pkgrel=1
pkgdesc="Open source game launcher"
arch=('x86_64')
url="https://github.com/ShadowBlip/OpenGamepadUI"
license=('GPL')
groups=()
depends=('glibc' 'gcc-libs' 'libx11' 'libxres' 'libxcb' 'libxext' 'libxau'
	 'libxdmcp' 'gamescope' 'ryzenadj-git' 'firejail'
	 )
optdepends=()
makedepends=('godot4-bin' 'scons' 'pkgconf' 'gcc' 'libxcursor' 'libxinerama'
	     'libxi' 'libxrandr' 'mesa' 'glu' 'libglvnd' 'alsa-lib' 'make'
	     'unzip' 'wget' 'git'
	     )
provides=('ogui')
_tag=1fa9b4c705e5378b889707ed3adc44d84a7d4d2a
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
	make addons import build
}

package() {
	options=('!strip')
	cd "$srcdir/${_pkgbase}"

	mkdir -p ${pkgdir}/etc/handypt
	install -Dm755 rootfs/etc/handypt/powertools ${pkgdir}/etc/handypt

	mkdir -p ${pkgdir}/usr/bin
        install -Dm755 rootfs/usr/bin/opengamepadui ${pkgdir}/usr/bin

	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install -Dm644 rootfs/usr/lib/systemd/user/ogui-qam.service ${pkgdir}/usr/lib/systemd/user
	
	mkdir -p ${pkgdir}/usr/share/opengamepadui
	install -Dm644 build/libevdev.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libevdev.linux.template_debug.x86_64.so
	install -Dm644 build/libpty.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libpty.linux.template_debug.x86_64.so
	install -Dm644 build/libxlib.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libxlib.linux.template_debug.x86_64.so
	install -Dm755 build/opengamepad-ui.x86_64 ${pkgdir}/usr/share/opengamepadui/opengamepad-ui.x86_64
	
	mkdir -p ${pkgdir}/usr/share/polkit-1/actions
	install -Dm644 rootfs/usr/share/polkit-1/actions/org.shadowblip.powertools.policy ${pkgdir}/usr/share/polkit-1/actions
}
