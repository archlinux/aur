# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel-git
_pkgname=${pkgname/-git}
__pkgname=DPITunnel
pkgver=0.9.0.r4.g864c06e
pkgrel=1
pkgdesc="Free, simple and serverless solution against censorship for Linux PCs and routers"
arch=('x86_64')
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
	install -Dm755 "build/${__pkgname}-exec" "${pkgdir}/usr/bin/${_pkgname}"
}
