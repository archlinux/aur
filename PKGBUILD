# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>
# Maintainer: FuzzyCheese

_pkgname=rsp_tcp
pkgname="${_pkgname}-git"
pkgver=v0.1.beta.r16.g61b8c91
pkgrel=3
pkgdesc="a rtl_tcp compatible IQ server for the RSP range of SDRPlay SDR"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/SDRplay/RSPTCPServer"
license=('GPL-3.0-or-later')
depends=('libusb>=1.0' 'libsdrplay>=3.7' 'glibc')
makedepends=('git' 'cmake')
provides=('rsp_tcp')
source=('git+https://github.com/SDRplay/RSPTCPServer')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/RSPTCPServer"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/RSPTCPServer"
  cmake -S . -B build/ \
    -D'CMAKE_POLICY_VERSION_MINIMUM=3.5' \
    -D'CMAKE_INSTALL_PREFIX=/usr'
}

build() {
  cd "${srcdir}/RSPTCPServer/build"
  make
}

package() {
  cd "${srcdir}/RSPTCPServer/"
  install -Dm 644 LICENSE -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd build/
  make DESTDIR="${pkgdir}" install
}
