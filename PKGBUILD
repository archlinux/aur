# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgname='input-overlay'
pkgname=obs-plugin-${_pkgname}
pkgver=5.1.3.r0.gb60de6c
pkgrel=1
groups=('obs-plugins')
pkgdesc='obs-studio plugin to show keyboard, gamepad and mouse input on stream.'
arch=("x86_64")
url="https://github.com/univrsal/${_pkgname}"
license=('GPL-2.0-only')
depends=('obs-studio' 'libxtst' 'libxkbfile' 'sdl2' 'qt6-base' 'libxt' 'libstdc++' 'libgcc' 'libxrandr')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'wayland-protocols' 'patchelf' 'simde')
_commit='b60de6c92eaf136015a1130b416adf1d97d8c09e'
source=(
	"git+https://github.com/univrsal/${_pkgname}.git#commit=${_commit}"
	"$pkgname-libuiohook-TolikPylypchuk::git+https://github.com/TolikPylypchuk/libuiohook.git")
sha256sums=('7daf9b6535c17644095a7fd34843ceee467a95f0ab19024cd4ab5f1a4b31d484'
            'SKIP')

_srcdir="${_pkgname}"

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "${_srcdir}"

	git submodule init
	git config 'submodule.deps/libuiohook.url' "$srcdir/$pkgname-libuiohook-TolikPylypchuk"
	git -c 'protocol.file.allow=always' submodule update
}

build() {
	# Need to disable --as-needed or link to libuiohook.so will be removed.
	export LDFLAGS+=' -Wl,--no-as-needed'
	cmake -S "${_srcdir}" -B 'build' -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build 'build'
}

package() {
	cd "${_srcdir}"
	install -dm755 "${pkgdir}/usr/lib/obs-plugins"
	install -dm755 "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/locale"
	install -dm755 "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/presets"
	install -Dm755 "${srcdir}/build/${_pkgname}.so" -t "${pkgdir}/usr/lib/obs-plugins/"
	cp -a 'data/locale'/* "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/locale/"
	cp -a 'presets'/* "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/presets/"

	install -dm755 "${pkgdir}/usr/lib/obs-plugins/input-overlay"
	cp -a "${srcdir}/build/deps/libuiohook/libuiohook"*'.so' "${pkgdir}/usr/lib/obs-plugins/input-overlay"

	# Make plugin able to find libuiohook.so
	patchelf --set-rpath '$ORIGIN/input-overlay' "${pkgdir}/usr/lib/obs-plugins/${_pkgname}.so"
}
