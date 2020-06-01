# Maintainer: Darks <l.gatin@protonmail.com>
pkgname="gint-devel-git"
pkgver=1.0
pkgrel=1
pkgdesc='Set of tools and libraries based on gcc, fxsdk and gint to build native programs for Casio calculators'
arch=('i686' 'x86_64')
depends=('sh-elf-gcc-casio' 'fxsdk-git' 'gint-git' 'mkg3a')
_libraries=('libprof' 'libimg')
source=("libprof::git+https://gitea.planet-casio.com/Lephenixnoir/libprof.git"
        "libimg::git+https://gitea.planet-casio.com/Lephenixnoir/libimg.git")
options=("!strip")
sha256sums=("SKIP" "SKIP")

prepare() {
  for i in ${_libraries[@]}; do
    cd "$srcdir/${i}"
    # Ensure clean build
    make clean
  done
}

build() {
  for i in ${_libraries[@]}; do
    cd "$srcdir/${i}"
    make
  done
}

package() {
  _prefix=$(sh-elf-gcc -print-search-dirs | sed -rn "s#install: (.+)/#\1#p")
  mkdir -p $pkgdir${_prefix}/include

  for i in ${_libraries[@]}; do
    cd "$srcdir/${i}"
    make DESTDIR=$pkgdir install
  done
}
