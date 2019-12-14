# Maintainer: Robin Broda <robin at broda dot me>

_pkgname=glava
pkgname=${_pkgname}-git
pkgver=r329.3cc5e22
pkgrel=2
pkgdesc='OpenGL audio spectrum visualizer'
arch=('x86_64')
url='https://github.com/wacossusca34/glava'
license=('GPL3')
depends=('x-server' 'pulseaudio' 'libxext' 'libxcomposite' 'libxrender')
makedepends=('git' 'meson' 'obs-studio')
optdepends=('obs-studio: OBS integration')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/wacossusca34/glava'
        'git+https://github.com/Dav1dde/glad')
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"

	git submodule init
	git config submodule.glad.url "${srcdir}/glad"
	git submodule update
}

build() {
	cd "${_pkgname}"

	arch-meson build --prefix /usr
	ninja -C build
}

package() {
	cd "${_pkgname}"

	DESTDIR="${pkgdir}/" ninja -C build install
}
