# Maintainer: Nicolás Hermosilla Polanco <nhermosilla14@gmail.com>

_pkgname=rapidsim
pkgname=rapidsim-git
pkgver=1.5.r40.g9ae02c3
pkgrel=1
pkgdesc="RapidSim is a fast Monte Carlo generator for simulation of heavy-quark hadron decays. It can be useful for generating background or toy data sets for acceptance studies."
arch=("x86_64")
url="https://github.com/gcowan/RapidSim"
license=('MIT')
makedepends=(cmake)
optdepends=('evtgen: for generating events'
            'pythia8: for event generation'
            'photos: for photon radiation in decays')
depends=(hepmc lhapdf hepmc pythia8 root cern-vdt)
source=("rapidsim::git+https://github.com/gcowan/RapidSim.git"
        "cmake-3.5.patch")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    
    # Check if EvtGen uses version tags
    if git describe --tags >/dev/null 2>&1; then
        # Has tags - use them for versioning
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        # No tags - use commit count method
        printf "r%s.%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
    fi
}


prepare() {
  cd "$srcdir/${_pkgname}"
  patch -p1 < "$srcdir/cmake-3.5.patch"
  cd "$srcdir"
  mkdir -p build
}

build() {
  cd "build"
  cmake ../${_pkgname} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "build"
  make DESTDIR="$pkgdir" install
}
