# Maintainer: hazelnot <scrabcrab@gmail.com>
pkgname=re3-git
pkgver=r2217.c40d628f
pkgrel=1
pkgdesc="An open-source project reverse-engineering Grand Theft Auto III"
arch=('x86_64')
url="https://github.com/GTAmodding/re3"
license=('unknown')
depends=('openal' 'glew' 'glfw' 'libsndfile' 'mpg123')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("re3::git+https://github.com/GTAmodding/re3")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export GTA_III_RE_DIR="~/.re3"
	mkdir "$HOME/.re3"
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive
	./premake5Linux --with-librw gmake2
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make config=release_linux-amd64-librw_gl3_glfw-oal
	cp  "$srcdir/${pkgname%-git}/bin/linux-amd64-librw_gl3_glfw-oal/Release/re3" "$HOME/.re3"
}
