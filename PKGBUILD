# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=roct-thunk-interface-git
_pkgname=ROCT-Thunk-Interface
pkgver=latest
pkgrel=1
pkgdesc="Radeon Open Compute Thunk Interface"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface"
license=('MIT')
depends=('numactl' 'pciutils')
makedepends=('git' 'cmake')
provides=('roct-thunk-interface')
conflicts=('roct-thunk-interface')
source=("git+https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        "$srcdir/$_pkgname"
  make all build-dev
}

package() {
  cd "$srcdir/build"

  make DESDIR="$pkgdir" install install-dev

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/roct-thunk-interface.conf"
/opt/rocm/lib
EOF
}
