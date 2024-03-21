# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel-git
_pkgname=${pkgname/-git}
__pkgname=DPITunnel
pkgver=1.0.0.r0.g4d2e735
pkgrel=2
pkgdesc="Free, simple and serverless solution against censorship for Linux PCs and routers"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/txtsd/DPITunnel"
license=('GPL-3.0-or-later')
depends=('libnl' 'gcc-libs' 'zlib' 'openssl' 'glibc' 'brotli')
makedepends=('git' 'cpp-httplib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}"
        "git+https://github.com/yhirose/cpp-httplib")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${__pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${__pkgname}"
  git submodule init
  git config submodule.cpp-httplib.url "${srcdir}/cpp-httplib"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${__pkgname}"
  cmake -B build .
  cmake --build build
}

package() {
  cd "${__pkgname}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
