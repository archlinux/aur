# Maintainer: seth <g3tchoo at proton dot me>

pkgname=lightmaputil-git
pkgver=r27.0ec24fd
pkgrel=1
pkgdesc="A simple command line utility to tell you if your lightmaps are too high resolution"
arch=('x86_64')
url="https://github.com/treacherousfiend/LightmapUtil"
license=('custom:none')
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/treacherousfiend/LightmapUtil"
        "cmath.patch")
sha512sums=('SKIP'
            '2b306fa29c8d52f7b61b365e1009d9c335d30ad2584d89dcabbc3e0cdcf81ceebaa938f8184c3dbfc33ccce3f0381409adb13945d1526c0ab3748bd80a696615')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
  patch -p1 -i "$srcdir/cmath.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    ..
  make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
  make install DESTDIR="${pkgdir}"
}
