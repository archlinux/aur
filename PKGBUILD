# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>

pkgname=minia-git
_pkgname=minia
pkgver=3.2.1.r12.g5b131b9
pkgrel=1
pkgdesc="short-read assembler based on a de Bruijn graph"
arch=('i686' 'x86_64')
url="https://github.com/GATB/minia"
license=('AGPL3')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("git+https://github.com/GATB/minia.git"
        "git+https://github.com/GATB/gatb-core.git")
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.thirdparty/gatb-core.url "$srcdir/gatb-core"
  git submodule update
}

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  builddir="$srcdir/$_pkgname/build"
  mkdir -p "$builddir"
  cd "$builddir"
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=True
  make
}

check() {
    cd "$srcdir/$_pkgname/test"
    ./simple_test.sh
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 build/bin/minia "$pkgdir/usr/bin/minia"
  install -Dm755 build/bin/merci "$pkgdir/usr/bin/merci"
}
