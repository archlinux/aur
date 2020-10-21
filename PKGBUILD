# Maintainer: Bart De Vries <bart at mogwai dot be>

_pkgname=box86
pkgname=${_pkgname}-git
pkgver=v0.1.2.r302.g6c4b047b
pkgrel=1
pkgdesc='Linux Userspace x86 Emulator with a twist'
arch=('armv7h')
url='https://github.com/ptitSeb/box86'
license=('MIT')
depends=('gcc-libs')
#optdepends=('')
makedepends=('git' 'cmake')
source=("git+https://github.com/ptitSeb/box86.git#branch=master"
        "binfmt-install-directory.patch")
sha256sums=('SKIP'
            'e9738f52f26c23828ea8cdcd3125af3fb773d29348bf94ad86f34c492ad05ca7')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  patch --forward --strip=1 --input="${srcdir}/binfmt-install-directory.patch"
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

