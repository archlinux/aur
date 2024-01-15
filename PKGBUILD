# Based on dislocker PKGBUILD maintained by: Rafal Malachowicz <k5hv@archlinux.info>
# Based on dislocker PKGBUILD maintained by: mrxx <mrxx at cyberhome dot at>

_pkgname=dislocker
pkgname=$_pkgname-git
pkgver=0.7.3.r37.g845e20c
pkgrel=1
pkgdesc="FUSE driver to read/write Windows' BitLocker-ed volumes"
arch=('i686' 'x86_64')
url="https://github.com/Aorimn/dislocker"
license=('GPL2')
depends=('mbedtls' 'fuse' 'ruby')
makedepends=('git' 'cmake')
provides=($_pkgname)
conflicts=($_pkgname)
optdepends=('ntfs-3g: NTFS file system support')
source=('git+https://github.com/Aorimn/dislocker.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "$srcdir/${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        -D WARN_FLAGS:STRING="-Wall -Wextra" \
        .
  sed -i 's/^#include "mbedtls\/config.h"/#include "mbedtls\/mbedtls_config.h"/;' include/dislocker/ssl_bindings.h
  sed -i 's/^#    define SHA256(input, len, output)         mbedtls_sha256_ret(input, len, output, 0)/#    define SHA256(input, len, output)         mbedtls_sha256(input, len, output, 0)/' include/dislocker/ssl_bindings.h
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
