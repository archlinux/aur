# Maintainer: hazelnot <scrabcrab@gmail.com>
pkgname=re3-git
pkgver=r2217.c40d628f
pkgrel=1
pkgdesc="An open-source project reverse-engineering Grand Theft Auto III"
arch=('x86_64')
url="https://github.com/GTAmodding/re3"
license=('unknown')
depends=('openal' 'glew' 'glfw' 'libsndfile' 'mpg123')
makedepends=('git' 'premake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("re3::git+https://github.com/GTAmodding/re3")
source+=(crossplatform_fix.patch)
md5sums=('SKIP')
md5sums+=(116c05b44d2bbdb1c34d8456a0695e94)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive
	patch -uNp1 -i ../crossplatform_fix.patch
}

build() {
	cd "$srcdir/${pkgname%-git}"
	premake5 --with-librw gmake2
	cd "$srcdir/${pkgname%-git}/build"
	make config=release_linux-amd64-librw_gl3_glfw-oal -j1
}

package() {
	install -D -m755 "$srcdir/${pkgname%-git}/bin/linux-amd64-librw_gl3_glfw-oal/Release/re3" "$pkgdir/usr/bin/re3"
}
