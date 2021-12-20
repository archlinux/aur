pkgbase=vitalium
pkgname=("${pkgbase}-lv2" "${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=r601.9f93a196
pkgrel=1
arch=('x86_64')
license=('EULA')
url="https://github.com/DISTRHO/DISTRHO-Ports"
groups=('pro-audio' 'vst-plugins')
depends=('freetype2' 'alsa-lib' 'libxext' 'libglvnd')
makedepends=('git' 'libxinerama' 'libxrender' 'libxcursor' 'steinberg-vst36' 'ladspa' 'libgl' 'meson')
provides=("${pkgbase%-*}")
replaces=("distrho-vst-git")
conflicts=("distrho-ports" "distrho-ports-lv2-git" "distrho-ports-vst-git")
source=("${pkgbase%-}"::"git+https://github.com/DISTRHO/DISTRHO-Ports.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "${pkgbase%-*}"/sdks/vstsdk2.4/public.sdk/source
	ln -rsfT /usr/include/vst36/ "${pkgbase%-*}"/sdks/vstsdk2.4/public.sdk/source/vst2.x
	ln -rsfT /usr/include/vst36/pluginterfaces/ "${pkgbase%-*}"/sdks/vstsdk2.4/pluginterfaces
}

build() {
	cd "${srcdir}/${pkgbase%-*}"
	meson build --buildtype release
	meson configure build -Dprefix="/usr" -Dbuild-vst2=true -Dbuild-vst3=true -Dbuild-lv2=true
	ninja -C build
	mkdir -p ${srcdir}/BUILD
	DESTDIR="${srcdir}/BUILD" ninja -C build install
}

package_vitalium-lv2() {
	pkgdesc="Open Source Variant of Vital Synth (LV2)"
	mkdir -p ${pkgdir}/usr/lib/lv2
	cp -rf ${srcdir}/BUILD/usr/lib/lv2/Vitalium-unfa.lv2 ${pkgdir}/usr/lib/lv2/Vitalium-unfa.lv2
	cp -rf ${srcdir}/BUILD/usr/lib/lv2/vitalium.lv2 ${pkgdir}/usr/lib/lv2/vitalium.lv2
}

package_vitalium-vst() {
	pkgdesc="Open Source Variant of Vital Synth (VST)"
	mkdir -p ${pkgdir}/usr/lib/vst
	cp -rf ${srcdir}/BUILD/usr/lib/vst/vitalium.so ${pkgdir}/usr/lib/vst/vitalium.so
}

package_vitalium-vst3() {
	pkgdesc="Open Source Variant of Vital Synth (VST3)"
	mkdir -p ${pkgdir}/usr/lib/vst3
	cp -rf ${srcdir}/BUILD/usr/lib/vst3/vitalium.vst3 ${pkgdir}/usr/lib/vst3/vitalium.vst3
}
