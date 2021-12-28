# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Richard Petri <git@rpls.de>
# Contributor: Graham Edgecombe <gpe@grahamedgecombe.com>
_ARCHS=('generic' 'ice40' 'ecp5' 'nexus' 'gowin')

pkgname=nextpnr-git
pkgver=r3957.fdeb8680
pkgrel=1
pkgdesc='Portable FPGA place and route tool'
arch=('i686' 'x86_64')
url='https://github.com/YosysHQ/nextpnr'
license=('custom:ISC')
depends=('boost-libs' 'python' 'qt5-base')
makedepends=('boost' 'cmake' 'eigen' 'git')
provides=('nextpnr')
conflicts=('nextpnr')
source=('nextpnr::git+https://github.com/YosysHQ/nextpnr.git')
sha256sums=('SKIP')

_CONFIG=()
for _arch in ${_ARCHS[@]}; do
  case $_arch in
    ice40)
      makedepends+=('icestorm')
      _CONFIG+=('-DICESTORM_INSTALL_PREFIX=/usr')
      ;;
    ecp5)
      makedepends+=('prjtrellis>1.1' 'prjtrellis-db')
      _CONFIG+=('-DTRELLIS_INSTALL_PREFIX=/usr')
      ;;
    nexus)
      makedepends+=('prjoxide')
      _CONFIG+=('-DOXIDE_INSTALL_PREFIX=/usr')
      ;;
    gowin)
      makedepends+=('prjapicula')
      _CONFIG+=('-DGOWIN_BBA_EXECUTABLE=/usr/bin/gowin_bba')
      ;;
    generic)
      ;;
    *)
      echo "Unhandled architecture: $_arch" >&2
      exit 1
      ;;
  esac
done

pkgver() {
  cd "$srcdir/nextpnr"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/nextpnr"

  mkdir -p build
  cd build

  cmake \
    -DARCH=$(IFS=\;; echo "${_ARCHS[*]}") \
    "${_CONFIG[@]}" \
    -DBUILD_TESTS=ON \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_OPENMP=ON \
    -DBUILD_GUI=ON \
    ..
  make
}

check() {
  cd "$srcdir/nextpnr/build"
  make test
}

package() {
  cd "$srcdir/nextpnr/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
