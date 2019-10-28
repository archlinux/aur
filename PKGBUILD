# Maintainer: Mohammad Ashar Khan <ashar786khan@gmail.com>

pkgname=licenser
pkgver=0.20
pkgrel=1
pkgdesc='A License management tool for your Open Source projects.'
arch=('x86_64')
url='https://github.com/coder3101/licenser'
license=('GPL3')
depends=('clang')
makedepends=("cmake" "git")
source=("https://github.com/coder3101/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('50c37ded328985d6a9b2de3bd66e2cda8657ce485f03824c9c83d366b471fb6a')

prepare() {
  cd $pkgname-$pkgver

# Remove the .git if already exists in the tarball or user has already build it
# This step makes sure that the submodule we clone in future does not errors out
# saying " <submodule> index already exists "

if [ -d "./.git" ] 
  then
	rm -rf .git
  fi

  git init
  rm -rf third_party/Lyra
  git submodule add https://github.com/bfgroup/Lyra.git third_party/Lyra
}

build() {
  cd $pkgname-$pkgver
  cmake -H. -Bbuild \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_CXX_COMPILER=clang++ \
	  -DCMAKE_C_COMPILER=clang \
	  -DENABLE_TESTS=off
  cmake --build build
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
