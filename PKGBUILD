# Maintainer: twxt <aur@twxt.cc>

pkgname=openmodsim-git
pkgver=r2138.25d1a817
pkgrel=2
pkgdesc="Open ModSim is a free implimentation of modbus slave (server) utility for modbus-tcp and modbus-rtu protocols."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/sanny32/openmodsim"
license=('MIT')
depends=('gcc' 'qt6-base>=6.8' 'qt6-declarative' 'qt6-5compat' 'qt6-tools' 'qt6-serialport' 'qt6-serialbus' 'qt6-svg')
makedepends=('cmake' 'git')
optdepends=('openmodscan: for a Modbus master (client)')
provides=('openmodsim')
conflicts=('openmodsim')
options=()
source=("git+${url}.git")
sha256sums=('SKIP')

_automok_build_error_help() {
  echo "Message from the AUR maintainer:"
  echo "If the build has failed due to an AutoMok error regarding a file in"
  echo "'src/styles/' and mentions something like 'no class found', you may"
  echo "need to restart your terminal so that display-realted environment"
  echo "variables function correctly."
  return 1
}

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
    -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
    src/
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make || _automok_build_error_help
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 "./LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
