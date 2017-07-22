# Maintainer: Sebba <sebba at cock dot li>
pkgname=arc_unpacker-git
_pkgname=arc_unpacker
pkgver=r2414.89eae41c
pkgrel=1
pkgdesc="CLI tool for extracting images and sounds from visual novels."
arch=(x86_64)
url="https://github.com/vn-tools/arc_unpacker"
license=('GPL')
depends=('boost-libs' 'libpng' 'libjpeg-turbo' 'openssl')
optdepends=('libwebp')
makedepends=('boost')
provides=('arc_unpacker-git' 'arc_unpacker')
conflicts=('arc_unpacker')
source=("$pkgname::git+https://github.com/vn-tools/arc_unpacker.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	# FIX sources path
	sed -i "s|\/\.\.\/|\/|g" CMakeLists.txt
	# FIX etc/ path
	sed -i "s|program\_path\.parent()|io\:\:path(\"/usr/share/${_pkgname}\")|g" src/io/program_path.cc
}

build() {
	cd "$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr/bin/ -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
  cd "$srcdir/$pkgname/"
  install -D -m 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  mkdir -p ${pkgdir}/usr/share/${_pkgname}
  cp -r etc ${pkgdir}/usr/share/${_pkgname}
}
