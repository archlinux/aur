# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=q2vkpt-git
pkgver=r1509.0baa1a1
pkgrel=1
pkgdesc="Real-time path tracer VKPT integrated into q2pro Quake 2 client."
arch=("x86_64")
url="https://github.com/cschied/q2vkpt"
license=('GPL')
groups=()
depends=('glibc' 'zlib' 'sdl2' 'libjpeg-turbo' 'libpng' 'vulkan-icd-loader')
makedepends=('git' 'glslang' 'vulkan-headers') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=('q2vkpt::git+https://github.com/cschied/q2vkpt.git'
	'q2vkpt.launcher'
	'.config')
noextract=()
md5sums=('SKIP'
	'903849b55b6be115c81392e549b3b079'
	'6bc71f41c15d8ed00505a06c8568fb65')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	make clean
	cp ../.config ./
	make
}

package() {
	cd "${pkgname%-git}"
	install -d $pkgdir/opt/q2vkpt/baseq2
	install -m 755 ${pkgname%-git} $pkgdir/opt/q2vkpt/
	install -m 755 game*.so $pkgdir/opt/q2vkpt/baseq2/
	cp -r shader_vkpt $pkgdir/opt/q2vkpt
	cp -r blue_noise_textures $pkgdir/opt/q2vkpt
	install -D -m 755 $srcdir/q2vkpt.launcher $pkgdir/usr/bin/q2vkpt
}
