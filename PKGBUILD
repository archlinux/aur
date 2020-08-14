# Maintainer: Daniel Sonck <daniel at sonck dot nl>
# Contributor : CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor : speps <speps at aur dot archlinux dot org>

pkgname=distrho-ports-vst-git
pkgver=r492.062a0f61
pkgrel=1
pkgdesc="DISTRHO VST audio plugins ports."
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('freetype2' 'alsa-lib' 'libxext' 'libglvnd')
makedepends=('git' 'libxinerama' 'libxrender' 'libxcursor' 'steinberg-vst36' 'ladspa' 'libgl' 'meson')
provides=("${pkgname%-*}")
replaces=("distrho-vst-git")
conflicts=("${pkgname%-*}" "distrho-plugins-vst-git" "dexed" "dexed-git" "dexed-vst-git" "luftikus" "tal-plugins")
source=("${pkgname%-*}"::'git+https://github.com/DISTRHO/DISTRHO-Ports.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "${pkgname%-*}"/sdks/vstsdk2.4/public.sdk/source
	ln -rsfT /usr/include/vst36/ "${pkgname%-*}"/sdks/vstsdk2.4/public.sdk/source/vst2.x
	ln -rsfT /usr/include/vst36/pluginterfaces/ "${pkgname%-*}"/sdks/vstsdk2.4/pluginterfaces
}

build() {
	cd "${pkgname%-*}"
	meson build --buildtype release
	meson configure build -Dprefix="/usr" -Dbuild-vst2=true -Dbuild-vst3=true -Dbuild-lv2=false
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	
	DESTDIR="${pkgdir}" ninja -C build install
	rm -rf "${pkgdir}/usr/lib/lv2"
}
