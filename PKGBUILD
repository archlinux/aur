# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=g4see-git
pkgver=v0.5.1
pkgrel=1
pkgdesc='Single Event Effect simulation toolkit based on Geant4'
arch=('x86_64' 'aarch64')
url='https://gitlab.cern.ch/g4see/g4see'
license=('GPL3')
depends=('geant4' 'python')
makedepends=('cmake')
conflicts=('g4see')
provides=("g4see=$pkgver")
source=("git+https://gitlab.cern.ch/g4see/g4see.git"
        "git+https://gitlab.cern.ch/g4see/g4see-scripts.git")
sha1sums=('SKIP' 'SKIP')

_gitname='g4see'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git submodule set-url g4see-scripts "$srcdir/g4see-scripts"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/$_gitname"
  mkdir build && cd build
  export CXXFLAGS="${CFLAGS}"  # binaries crash when compiled with -D_GLIBCXX_ASSERTIONS
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr ..
  make
}

package() {
  cd "$srcdir/$_gitname/build"

  make install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$_gitname" ../LICENSES/*
  install -Dm644 -t "$pkgdir"/usr/share/"$_gitname"/scripts scripts/*
  install -Dm644 -t "$pkgdir"/usr/share/"$_gitname"/examples examples/*
  install -Dm644 -t "$pkgdir"/usr/share/"$_gitname"/examples_parametric examples_parametric/*
  install -Dm644 -t "$pkgdir"/usr/share/"$_gitname"/configs configs/*
}

# vim:set ts=2 sw=2 et:
