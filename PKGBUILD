# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Based on dislocker PKGBUILD maintained by: Rafal Malachowicz <k5hv@archlinux.info>
# Based on dislocker PKGBUILD maintained by: mrxx <mrxx at cyberhome dot at>

_pkgname=dislocker
pkgname=dislocker-patched
pkgver=0.7.3.r91.g6d8be24
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
  'git+https://github.com/Aorimn/dislocker.git#commit=6d8be248896fceb728e9aa5c6da64fca246c3a31'
)
sha512sums=('fd5bee749ee4fd140763be05592a21cb4c2129d5124f2f24e70ec0253cd06f795a40e4ead44cd5dd1f6daf7f162e579f2c1d522fab359fc170ce11cc5f0fba8c')

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

check() {
  ctest --test-dir "$srcdir/${_pkgname}" --output-on-failure
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
