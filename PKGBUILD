# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor : speps <speps at aur dot archlinux dot org>

pkgname=distrho-vst-git
pkgver=r356.2ae52fe
pkgrel=1
pkgdesc="DISTRHO VST audio plugins ports"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('freetype2' 'alsa-lib' 'libxext')
makedepends=('premake3' 'git' 'libxinerama' 'libxrender' 'libxcursor' 'steinberg-vst36')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "distrho-vst-git" "distrho-plugins-vst-git")
source=("${pkgname%-*}::git://github.com/DISTRHO/DISTRHO-Ports")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "${pkgname%-*}"/sdks/vstsdk2.4/public.sdk/source
	ln -rsf /usr/include/vst36/ "${pkgname%-*}"/sdks/vstsdk2.4/public.sdk/source/vst2.x
	ln -rsf /usr/include/vst36/pluginterfaces/ "${pkgname%-*}"/sdks/vstsdk2.4/pluginterfaces
}

build() {
	cd "${pkgname%-*}"
	./scripts/premake-update.sh linux
	make vst
}

package() {
	cd "${pkgname%-*}"/bin/vst
	for i in *; do
		install -D "$i" "$pkgdir/usr/lib/vst/$i"
	done
}
