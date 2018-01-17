# Maintainer: Robin Broda <robin at broda dot me>

_pkgname=glava
pkgname=${_pkgname}-git
pkgver=r66.ff7d879
pkgrel=2
pkgdesc="OpenGL audio spectrum visualizer"
arch=('x86_64')
url='https://github.com/wacossusca34/glava'
license=('GPL')
depends=('x-server' 'pulseaudio' 'glfw')
makedepends=('git' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/wacossusca34/glava"
	"glad::git+https://github.com/Dav1dde/glad")
md5sums=('SKIP'
	'SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	git submodule init
	git config submodule.glad.url "$srcdir/glad"
	git submodule update
}

build() {
	cd "$srcdir/${_pkgname}"
	make -j1 # glava's makefile has a race condition
}

package() {
	cd "$srcdir/${_pkgname}"

        install -Dm755 glava "${pkgdir}/usr/bin/glava"

	install -d "${pkgdir}/etc/xdg"
	cp -rv shaders "${pkgdir}/etc/xdg/glava"
}
