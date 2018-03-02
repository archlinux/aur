# Maintainer: Robin Broda <robin at broda dot me>

_pkgname=glava
pkgname=${_pkgname}-git
pkgver=r126.318b4b3
pkgrel=2
pkgdesc='OpenGL audio spectrum visualizer'
arch=('x86_64')
url='https://github.com/wacossusca34/glava'
license=('GPL3')
depends=('x-server' 'pulseaudio' 'glfw-x11' 'libxext' 'libxcomposite')
makedepends=('git' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/wacossusca34/glava'
        'git+https://github.com/Dav1dde/glad'
        "${pkgname}-26.patch::https://github.com/wacossusca34/glava/pull/26.patch")
md5sums=('SKIP'
         'SKIP'
         '4d4f002ec5285157e679aaeebaf5f14c')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"

	# Fix LDFLAGS https://github.com/wacossusca34/glava/pull/26
	patch Makefile "${srcdir}/${pkgname}-26.patch"

	git submodule init
	git config submodule.glad.url "${srcdir}/glad"
	git submodule update
}

build() {
	cd "${_pkgname}"

	make
}

package() {
	cd "${_pkgname}"

	make DESTDIR="${pkgdir}/" install
}
