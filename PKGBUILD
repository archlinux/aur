# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>

# shellcheck shell=bash disable=SC2034,SC2164

_crt=ucrt
_distro=ubuntu-22.04

pkgname=llvm-mingw-w64-toolchain-${_crt}-bin
pkgver=20251216
pkgrel=1
pkgdesc="LLVM/Clang/LLD based mingw-w64 toolchain (UCRT) targeting i686, x86-64, armv7, and aarch64"
arch=('x86_64' 'aarch64')
url="https://github.com/mstorsjo/llvm-mingw"
license=('Apache-2.0 WITH LLVM-exception') # The toolchain itself
license+=('ISC') # Wrapper scripts
depends=('gcc-libs' 'glibc' 'python' 'python-yaml' 'sh' 'xz' 'zlib' 'zstd')
makedepends=('patchelf')
provides=('llvm-mingw-w64-toolchain')
source_x86_64=("https://github.com/mstorsjo/llvm-mingw/releases/download/${pkgver}/llvm-mingw-${pkgver}-${_crt}-${_distro}-x86_64.tar.xz")
source_aarch64=("https://github.com/mstorsjo/llvm-mingw/releases/download/${pkgver}/llvm-mingw-${pkgver}-${_crt}-${_distro}-aarch64.tar.xz")
sha256sums_x86_64=('db561734a05eb4a0695d5e901aadd6c1cda74bba4c9e102b677f81c6fd59849a')
sha256sums_aarch64=('2950bc65bdd289a2138f48ffb4b200c06c6dc71d8c105452ebd9fa7d567497ec')

package() {
   mkdir -p "${pkgdir}"/opt/llvm-mingw/llvm-mingw-${_crt}
   cp -dpr --no-preserve=ownership "${srcdir}"/llvm-mingw-${pkgver}-${_crt}-${_distro}-${CARCH}/* "${pkgdir}"/opt/llvm-mingw/llvm-mingw-${_crt}

   cd "${pkgdir}"/opt/llvm-mingw/llvm-mingw-${_crt}

   # Remove insecure RPATH
   patchelf --remove-rpath bin/lldb-mi

   # Install the license files
   mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
   grep "Copyright" bin/ld-wrapper.sh -A12 | sed 's/# //g' | tr -d '#' > "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.ISC
   install -Dm644 LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
