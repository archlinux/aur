# Maintainer: Daniel Araujo <contact@daniel-araujo.pt>
pkgname='proctal-git'
pkgver=r493.2b794f1
pkgrel=1
pkgdesc='A tool for modding programs on Linux at runtime.'
url='https://github.com/daniel-araujo/proctal'
arch=('x86_64' 'aarch64')
license=('GPL3')
optdepends=(
	'keystone: to compile assembly language'
	'capstone: to decompile bytecode into assembly')
makedepends=('git' 'autoconf' 'php')
source=("git+https://github.com/daniel-araujo/proctal.git")
md5sums=('SKIP')

pkgver() {
  cd proctal
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd proctal

  git clone https://github.com/hroptatyr/yuck.git
  cd yuck
  git reset --hard 958e4cf76a305939b73c15a806cedac8a221933a
  autoreconf -fi
  ./configure
  make
  cd ..

  ./bootstrap
  ./configure --with-yuck="$PWD/yuck/src/yuck" --prefix=/usr
  make
}

package() {
  cd proctal
  make DESTDIR="$pkgdir/" install
}
