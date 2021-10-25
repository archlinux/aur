# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=libhanjp-git
_pkgname=libhanjp
pkgver=r184.373a95c
pkgrel=1
pkgdesc="Library for write Japanese scripts by Korean hangul script"
arch=('x86_64')
url='https://github.com/Hanjp-IM/libhanjp'
license=('LGPL')
depends=('libhangul-git' 'glib2')
makedepends=('git' 'cmake' 'check')
source=('git+https://github.com/Hanjp-IM/libhanjp#branch=develop'
		'git+https://github.com/libhangul/libhangul.git')

md5sums=('SKIP' 'SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${_pkgname}
	git submodule init
	git config submodule.libhangul.url "$srcdir/libhangul"
	git submodule update
}

build() {
  cd ${_pkgname}
  sed -i '/add_subdirectory(test)/d' CMakeLists.txt
  cmake -B build -S . \
	-DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
#	-DBUILD_GMOCK=OFF \

  make -C build
}

package() {
  cd ${_pkgname}/build
  
  make DESTDIR="$pkgdir" install
}
