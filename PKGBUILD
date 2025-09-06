# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on dislocker PKGBUILD maintained by: Rafal Malachowicz <k5hv@archlinux.info>
# Based on dislocker PKGBUILD maintained by: mrxx <mrxx at cyberhome dot at>

# Sources for patches. They may be slightly modified for improvements.
# 0001: https://github.com/Aorimn/dislocker/pull/346/commits/337d05dc7447436539f2fb481eef0e528a000b66
# 0002: https://github.com/Aorimn/dislocker/pull/346/commits/60d6b75cc7965dcf900b9bee769d86e1cb33c48e
# 0003: https://github.com/Aorimn/dislocker/pull/341/commits/eeb79ba9aacb62ae37898255cf98332ac6368e31

_pkgname=dislocker
pkgname=dislocker-patched
pkgver=0.7.3.r46.g4572dc7
pkgrel=1
pkgdesc="FUSE driver to read/write Windows' BitLocker-ed volumes. Includes some patches from Issues and PRs from official Aorimn/dislocker"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Aorimn/dislocker"
license=('GPL-2.0-or-later')
depends=('mbedtls' 'fuse' 'ruby')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('ntfs-3g: NTFS file system support')
source=(
  'git+https://github.com/Aorimn/dislocker.git#commit=4572dc727940cc42249c9f967cee9c505f16b121'
  '0001-cmake-2.6-to-3.5.patch'
  '0002-metadata-linear-scan-VIRTUALIZATION-INF.patch'
  '0003-highlight-recovery-guid.patch'
)
sha512sums=('67d9845a02004b740aaf32bd1c381e578dbccc29207cb7373e646010b75717e66424dc5a84de8fec4926c49f18f562e1333ffe2be1185bdb31de1b17fe2337bc'
            '9fbb2ade8f770eb36bedbac120ced21f40a8f6718d68b2983104957ff0d667d95cb8a4621e3d974add61248f02e21ff4351c4ee189adbebd6cc452f6e912ce69'
            '65552ce0be66df39276970704ace71607a361b9da0e6f5f3095c87e5f8ea9c43e73eed36ef16e77b5d6b65df7dbe318caf736d6ad997e6ea4f894c1e89828674'
            '1ed73a8e2f1019a2706ae069469b36cfbe25611fece396d60bdbf3921d90005600ee14d7d93b58963a9989f2c14f8905245b68b6a7d85ecde9498456cb8e36a7')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd "$srcdir/${_pkgname}"
  patch -p1 -i "${srcdir}/0001-cmake-2.6-to-3.5.patch"
  patch -p1 -i "${srcdir}/0002-metadata-linear-scan-VIRTUALIZATION-INF.patch"
  patch -p1 -i "${srcdir}/0003-highlight-recovery-guid.patch"
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
