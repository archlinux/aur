# Maintainer: phtty <dzzwmqj@outlook.com>

pkgname=arm-toolchain-for-embedded-bin
pkgver=23.1.0
pkgrel=1
pkgdesc="LLVM-based bare-metal compiler toolchain for Arm (ATfE, binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/arm/arm-toolchain"
license=('Apache-2.0 WITH LLVM-exception')
depends=('gcc-libs' 'glibc' 'libedit' 'zlib')
options=(!strip !debug staticlibs)
install="$pkgname.install"

_release="release-${pkgver}-ATfE"

# Upstream spells the host arch differently in the artefact file names (x86_64 vs AArch64)
_srcname_x86_64="ATfE-${pkgver}-Linux-x86_64"
_srcname_aarch64="ATfE-${pkgver}-Linux-AArch64"

source_x86_64=("${url}/releases/download/${_release}/${_srcname_x86_64}.tar.xz")
source_aarch64=("${url}/releases/download/${_release}/${_srcname_aarch64}.tar.xz")
sha256sums_x86_64=('a7be511613af15151c93961ad39c8cf9ae6889a453c8b547f42f4051a416dc8e')
sha256sums_aarch64=('df3b055d05659d8fda710d820e6c1ceff7bca3234c5067abe82a16e781d8de99')

package() {
  local _srcname
  case "$CARCH" in
    x86_64)  _srcname="$_srcname_x86_64" ;;
    aarch64) _srcname="$_srcname_aarch64" ;;
  esac

  # The release binaries use unprefixed tool names (clang, lld, llvm-*) that
  # would conflict with the official clang/llvm/lld packages, so install the
  # self-contained toolchain into /opt and let the user add its bin/ to PATH.
  install -d "$pkgdir/opt"
  cp -a "$srcdir/$_srcname" "$pkgdir/opt/atfe"

  install -Dm644 "$srcdir/$_srcname/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 "$srcdir/$_srcname/THIRD-PARTY-LICENSES.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.txt"
  cp -a "$srcdir/$_srcname/third-party-licenses" \
    "$pkgdir/usr/share/licenses/$pkgname/third-party-licenses"
}
