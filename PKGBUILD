pkgname=premake-git
pkgver=5.0.alpha2.r201.g1c27cca
pkgrel=1
pkgdesc='Simple build configuration and project generation tool using Lua'
arch=(i686 x86_64)
url='http://industriousone.com/premake'
license=(BSD)
depends=(glibc)
makedepends=(git)
provides=(premake5)
source=(git+https://github.com/premake/premake-core)
md5sums=('SKIP')

pkgver() {
  cd premake-core
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd premake-core
  git submodule init
  git submodule update
}

build() {
  cd premake-core
  make -f Bootstrap.mak linux
  bin/release/premake5 gmake
  make config=release
}

check(){
  cd premake-core
  ./bin/release/premake5 test
}

package() {
  cd premake-core
  install -Dm755 bin/release/premake5 "$pkgdir"/usr/bin/premake5
  install -Dm755 packages/debian/premake.1 "$pkgdir"/usr/share/man/man1/premake5.1
}
