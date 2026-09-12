# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Based on dislocker PKGBUILD maintained by: Rafal Malachowicz <k5hv@archlinux.info>
# Based on dislocker PKGBUILD maintained by: mrxx <mrxx at cyberhome dot at>

_pkgname=dislocker
pkgname=dislocker-patched
pkgver=0.7.3.r85.g0706462
pkgrel=1
pkgdesc="FUSE driver to read/write Windows' BitLocker-ed volumes. May include patches from Issues and PRs from official Aorimn/dislocker. Added aarch64."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Aorimn/dislocker"
license=('GPL-2.0-or-later')
depends=('mbedtls3' 'fuse3' 'ruby')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('ntfs-3g: NTFS file system support')
source=(
  'git+https://github.com/Aorimn/dislocker.git#commit=0706462db88efe8df88150e4c3e4332b808f4581'
)
sha512sums=('49d4761e07e79ba83efb9dddedbfe335a5e25889b83a3a8f202fd85d362261f2caaf778265f051685ce804133c20dc8ece1a07166afd1f832ac1f1a588acf75b')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "$srcdir/${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DMbedTLS_DIR=/usr/lib/mbedtls3/cmake/MbedTLS \
        -Dlibdir=/usr/lib \
        -D WARN_FLAGS:STRING="-Wall -Wextra" \
        .
  #sed -i 's/^#include "mbedtls\/config.h"/#include "mbedtls\/mbedtls_config.h"/;' include/dislocker/ssl_bindings.h
  #sed -i 's/^#    define SHA256(input, len, output)         mbedtls_sha256_ret(input, len, output, 0)/#    define SHA256(input, len, output)         mbedtls_sha256(input, len, output, 0)/' include/dislocker/ssl_bindings.h
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
