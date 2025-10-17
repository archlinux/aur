# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Based on dislocker PKGBUILD maintained by: Rafal Malachowicz <k5hv@archlinux.info>
# Based on dislocker PKGBUILD maintained by: mrxx <mrxx at cyberhome dot at>

# Sources for patches. They may be slightly modified for improvements.
# 0001: https://github.com/Aorimn/dislocker/pull/346/commits/337d05dc7447436539f2fb481eef0e528a000b66
# 0002: https://github.com/Aorimn/dislocker/pull/346/commits/60d6b75cc7965dcf900b9bee769d86e1cb33c48e
# 0003: https://github.com/Aorimn/dislocker/pull/341/commits/eeb79ba9aacb62ae37898255cf98332ac6368e31
# 0004: https://github.com/Aorimn/dislocker/pull/340/commits/37284e0c120279867deb6cadd9c33684cbc843f7
# 0005: https://github.com/Aorimn/dislocker/pull/338/commits/a32a6de8412947f55a7910543442534b4951accb
# 0006: https://github.com/Aorimn/dislocker/pull/336/commits/e749eade55f242d03fb9d10c05ff4b11c66dcbbe
#       https://github.com/Aorimn/dislocker/pull/336/commits/e000d91a55b3d4081a8cc5e7acba5bb29deaf83a
# 0007: https://github.com/Aorimn/dislocker/pull/333/commits/817116a77c1d769548d6c06cb631ab77e35247e8
# 0008: https://github.com/Aorimn/dislocker/pull/347/commits/eef3cd9fb9fcfc903f363a292e95b9831daff599

_pkgname=dislocker
pkgname=dislocker-patched
pkgver=0.7.3.r46.g4572dc7
pkgrel=10
pkgdesc="FUSE driver to read/write Windows' BitLocker-ed volumes. Includes some patches from Issues and PRs from official Aorimn/dislocker. Added aarch64."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Aorimn/dislocker"
license=('GPL-2.0-or-later')
depends=('mbedtls' 'fuse3' 'ruby')
makedepends=('git' 'cmake' 'fuse3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('ntfs-3g: NTFS file system support')
source=(
  'git+https://github.com/Aorimn/dislocker.git#commit=4572dc727940cc42249c9f967cee9c505f16b121'
  '0001-cmake-2.6-to-3.5.patch'
  '0002-metadata-linear-scan-VIRTUALIZATION-INF.patch'
  '0003-highlight-recovery-guid.patch'
  '0004-switch-to-fuse3.patch'
  '0005-ruby3-file-exist.patch'
  '0006-mbedtls-3.patch'
  '0007-multibyte-password.patch'
  '0008-cmakelists-version-release-2-to-3.patch'
)
sha512sums=('67d9845a02004b740aaf32bd1c381e578dbccc29207cb7373e646010b75717e66424dc5a84de8fec4926c49f18f562e1333ffe2be1185bdb31de1b17fe2337bc'
            '53fcc42cd2aea380cecdfb1e64f33e6f143e2e9022bb9511ab829a20b98fdf0f454f8c046592a4e469e61bbf9c0ec505a1812b4d2905bc6bb94f6fcc2b3e4c47'
            '65552ce0be66df39276970704ace71607a361b9da0e6f5f3095c87e5f8ea9c43e73eed36ef16e77b5d6b65df7dbe318caf736d6ad997e6ea4f894c1e89828674'
            '3c694b11740be886855878da2cc217a144540c1067d3fbc5c10695fbf8b51168e35cb0404297fd348f1a6c2b1d1b3785e5719f5e5b40e6becc3cfdd1535151aa'
            '22034ae1aee46397c81b3f265ce05e29f51f581af004b448d27d7859625970428010b29c2f11934b1a42d2d871957c0ecb9c977b6ec432c2b6e238ea95d3a98a'
            'a0f7ebcc1aba31362a6c2d7123858234e5d41bf86eec3e8e3fbeca1908034699b6d8c86b3d98eb78caa34cd48a41ac56719d4a43b85ee49e465b733b2b400726'
            '7b5d4e3620c9adb510ab30efd53de067bc77b2a796cf963d016fc2da72fd6c9ae37d25e7bf961483bbec0e15830bd582506ab1bad961726be09fa916831ac0a3'
            '3f7374a004e26adf9024c52ff751acc375b3bebe0cd0c5882f0f61c5c8ec607b9701b93f72efe5ba1dc34aca41cdffdeb10f623b376bdee6088542c4c28929b4'
            '35dfbc5941498a251ff9ccc70eef185db37a88a3416a91ef969e82ee345f920dd0e65da04bf2bb15c9d90d7e0471d8eabc4fd6684fc6be38d0dafb760b41073f')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd "$srcdir/${_pkgname}"
  patch -p1 -i "${srcdir}/0001-cmake-2.6-to-3.5.patch"
  patch -p1 -i "${srcdir}/0002-metadata-linear-scan-VIRTUALIZATION-INF.patch"
  patch -p1 -i "${srcdir}/0003-highlight-recovery-guid.patch"
  patch -p1 -i "${srcdir}/0004-switch-to-fuse3.patch"
  patch -p1 -i "${srcdir}/0005-ruby3-file-exist.patch"
  patch -p1 -i "${srcdir}/0006-mbedtls-3.patch"
  patch -p1 -i "${srcdir}/0007-multibyte-password.patch"
  patch -p1 -i "${srcdir}/0008-cmakelists-version-release-2-to-3.patch"
  #mv include/dislocker/ssl_bindings.h.in include/dislocker/ssl_bindings.h
}

build() {
  cd "$srcdir/${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
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
