# Maintainer: Darks <l.gatin@protonmail.com>
_basename="gint"
_branch="master"
pkgname="${_basename}-git"
pkgver=r166.0498344
pkgrel=2
pkgdesc='Alternative library and kernel for add-in development on fx-9860G and fx-CG50'
arch=('i686' 'x86_64')
depends=('fxsdk' 'sh-elf-gcc-casio' 'python-pillow')
source=("${pkgname}::git+https://gitea.planet-casio.com/Lephenixnoir/${_basename}.git#branch=${_branch}")
options=("!strip")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname}"
  #git checkout compat

  # Ensure clean builds
  [[ -d fx-build ]] && rm -rf fx-build
  mkdir fx-build
  [[ -d cg-build ]] && rm -rf cg-build
  mkdir cg-build
}

build() {
  # Build for fx9860g
  cd "$srcdir/${pkgname}/fx-build"
  ../configure --target=fx9860g
  make

  # Build for fx-cg50
  cd "$srcdir/${pkgname}/cg-build"
  ../configure --target=fxcg50
  make
}

package() {
  _prefix=$(sh-elf-gcc --print-search-dirs | sed -rn "s#install: (.+)/#\1#p")

  # Install for fx9860g
  cd "$srcdir/${pkgname}/fx-build"
  make PREFIX="$pkgdir${_prefix}" install
  
  # Install for fx-cg50
  cd "$srcdir/${pkgname}/cg-build"
  make PREFIX="$pkgdir${_prefix}" install
}
