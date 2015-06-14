# Maintainer: Aetf

pkgname=('openann-git' 'openann-doc-git')
_gitname=OpenANN
pkgver=0.0.0
pkgrel=2
pkgdesc="An open source library for artificial neural networks. Git version"
arch=('i686' 'x86_64')
url="https://github.com/OpenANN/OpenANN"
license=('GPL3')
depends=('eigen' 'alglib')
makedepends=('unzip' 'wget' 'git' 'cmake>=2.8' 'doxygen' 'graphviz')
conflicts=('openann')
provides=('openann')
#install=qbittorrent.install
source=('git://github.com/OpenANN/OpenANN.git'
        'use-system-alglib.patch'
        )
md5sums=('SKIP'
         '62c7c1e3e493bd35e1913a60e9da1a9e'
         )

pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname
  patch -p1 -i ../use-system-alglib.patch
  mkdir build

  cd lib
  sh setup.sh CMA-ESpp
}

build() {
  cd $_gitname/build

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DBUILD_PYTHON=OFF \
        -DALWAYS_BUILD_DOCUMENTATION=ON \
        ..
  make
}

package_openann-git() {
  cd $_gitname/build
  make DESTDIR="$pkgdir/" install

  # remove doc directory
  rm -rf "$pkgdir/usr/share/doc"
}

package_openann-doc-git() {
  pkgdesc="Documentation for OpenANN, an open source library for artificial neural networks. Git version"
  arch=('any')
  url="https://github.com/OpenANN/OpenANN"
  license=('GPL3')
  depends=()
  conflicts=()
  provides=()

  cd $_gitname/build
  make DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir/usr/share/pkgconfig"
  rm -rf "$pkgdir/usr/lib"
  rm -rf "$pkgdir/usr/include"
}
