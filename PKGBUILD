# Maintainer: Bart De Vries <bart at mogwai dot be>

_pkgname=box86
pkgname=${_pkgname}-git
pkgver=v0.1.8.r106.ge2df6f6c
pkgrel=1
pkgdesc='Linux Userspace x86 Emulator with a twist'
arch=('armv7h')
url='https://github.com/ptitSeb/box86'
license=('MIT')
depends=('gcc-libs')
#optdepends=('')
makedepends=('git' 'cmake')
provides=(box86)
conflicts=(box86)
source=("git+https://github.com/ptitSeb/box86.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  cmake -B build -S . \
        -DARM_DYNAREC=ON \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd ${_pkgname}/build
  make DESTDIR=${pkgdir} install
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

