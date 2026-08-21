# Maintainer: milkii (milkii on freenode)
# Contributer: Colean <colean@colean.cc>
pkgname=bipscript-git
pkgver=r601.8b0e366
pkgrel=1
pkgdesc="A scripting language for interactive music"
arch=('i686' 'x86_64')
url="http://www.bipscript.org"
license=('GPL')
groups=('pro-audio')
depends=('boost-libs' 'fftw' 'lilv' 'liblo' 'portsmf')
makedepends=('git' 'cmake' 'boost' 'lv2' 'jack' 'libsndfile')
provides=("bipscript")
conflicts=("bipscript")
source=("bipscript::git+https://gitlab.domainepublic.net/bipscript/bipscript"
        "bipscript.patch")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "bipscript"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  patch -p2 -i "bipscript.patch" || true
  cd "bipscript"
}

build() {
  cd "bipscript"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
  cd "bipscript"
	make DESTDIR="$pkgdir/" install
}
