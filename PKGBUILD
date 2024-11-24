# Maintainer: Christoph Haag <haagch+aur@frickel.club> 

pkgname=psmoveinput-git
pkgver=0.4.6.0.ga2438c9
pkgrel=1
pkgdesc="userspace Linux input driver that uses data from PSMove motion controller to inject events to kernel's input subsystem (GIT version)"
arch=('x86_64')
url="https://github.com/MooseTheBrown/psmoveinput"
license=('GPL3')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so
  'psmoveapi-git' 'libpsmoveapi.so'
  'dbus-python'
  'python'
  'boost-libs' 'libboost_thread.so' 'libboost_program_options.so'
)
makedepends=(
  'cmake'
  'git'
  'boost'
)
source=('git+https://github.com/MooseTheBrown/psmoveinput.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd psmoveinput
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -B build -S psmoveinput \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${pkgdir}/etc/systemd/system/psmoveinput.service" "${pkgdir}/usr/lib/systemd/system/psmoveinput.service"
  rm -fr "${pkgdir}/etc/systemd"
}

