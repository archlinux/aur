# Maintainer: Robin Broda <robin at broda dot me>

_pkgname=glava
pkgname=${_pkgname}-git
pkgver=r66.ff7d879
pkgrel=4
pkgdesc="OpenGL audio spectrum visualizer"
arch=('x86_64')
url='https://github.com/wacossusca34/glava'
license=('GPL3')
depends=('x-server' 'pulseaudio' 'glfw')
makedepends=('git' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/wacossusca34/glava"
        "git+https://github.com/Dav1dde/glad")
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

	# glava's Makefile has a race condition
	# See https://github.com/wacossusca34/glava/issues/8
	make -j1
}

package() {
	cd "${_pkgname}"

	# glava's Makefile doesn't respect $DESTDIR & co
	# See https://github.com/wacossusca34/glava/issues/8 (comments)
	install -Dm755 glava "${pkgdir}/usr/bin/glava"

	install -d "${pkgdir}/etc/xdg"
	cp -rv shaders "${pkgdir}/etc/xdg/glava"
}
