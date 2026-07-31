# Maintainer: b83c <b83c@outlook.com>
# Contributor:

pkgname=('libm2k' 'm2k-cli')
pkgbase=m2k-cli
pkgver=0.9.0
pkgrel=1
pkgdesc='Command-line frontend for libm2k - control the ADALM2000 (M2k) oscilloscope, signal generator, logic analyzer, power supply and digital protocols'
arch=('x86_64')
url='https://github.com/analogdevicesinc/libm2k'
license=('LGPL-2.1-or-later' 'GPL-2.0-or-later')
makedepends=('cmake' 'ninja')
source=("https://github.com/analogdevicesinc/libm2k/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d58c7d5c9d9f1300e392893b0eb76e24e8eed0834695d2a9368210c16297ff5')

build() {
  export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=${srcdir}=/usr/src/${pkgbase}"

  cmake -B build -S "libm2k-${pkgver}" -Wno-author \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_SKIP_RPATH=ON \
    -DENABLE_TOOLS=ON \
    -DENABLE_PYTHON=OFF \
    -DENABLE_CSHARP=OFF \
    -DENABLE_LABVIEW=OFF \
    -DENABLE_DOC=OFF \
    -DENABLE_LOG=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DINSTALL_UDEV_RULES=ON

  cmake --build build
}

package_libm2k() {
  pkgdesc='C++ library for interfacing with the ADALM2000 (M2k)'
  depends=('libiio' 'glibc')
  provides=('libm2k=0.9.0')
  conflicts=('libm2k' 'libm2k-git')

  DESTDIR="${pkgdir}" cmake --install build

  rm -f "${pkgdir}/usr/bin/m2kcli"
}

package_m2k-cli() {
  depends=('libm2k=0.9.0' 'glibc')
  optdepends=('socat: USB to serial UART adapter script (m2k_tty.sh)')

  install -Dm755 "build/tools/m2kcli/m2kcli" "${pkgdir}/usr/bin/m2kcli"
  install -Dm755 "libm2k-${pkgver}/tools/m2kcli/examples/m2k_tty.sh" \
    "${pkgdir}/usr/share/m2k-cli/m2k_tty.sh"
}
