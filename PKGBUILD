# Maintainer: twxt <aur@twxt.cc>

pkgname=openmodscan-git
pkgver=r1713.c6597fd
pkgrel=1
pkgdesc="OpenModScan is a free and open-source Modbus Master (Client) utility supporting both Modbus-TCP and Modbus-RTU protocols."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/sanny32/openmodscan"
license=('MIT')
depends=('gcc' 'qt6-base' 'qt6-tools' 'qt6-serialport' 'qt6-serialbus' 'qt6-declarative' 'qt6-5compat')
makedepends=('cmake' 'git')
optdepends=('openmodsim: for simulating a Modbus slave (server)')
provides=('openmodscan')
conflicts=('openmodscan')
options=()
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  cmake \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR:STRING=lib \
    -DCMAKE_BUILD_TYPE="RelWithDebInfo"\
    src/
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 "./LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
