# Maintainer: M0N7Y5
# shellcheck shell=bash disable=SC2034,SC2154

# Repackages the last Arch build of LLDB 22 from the Arch Linux Archive so it
# can be installed next to the current lldb package, the way llvm22, clang22
# and lld22 are. Everything lives under /usr/lib/llvm22; only the library
# soname symlink is placed in /usr/lib, matching clang22.
# liblldb links libpython3.14, so python is pinned to that ABI; bump pkgrel
# with a rebuild of the source package if a newer archive build appears.

pkgname="lldb22-bin"
pkgver=22.1.8
_pkgrel_arch=1
pkgrel=1
pkgdesc="Next generation, high-performance debugger (LLVM 22, prebuilt Arch package)"
arch=("x86_64")
license=("Apache-2.0 WITH LLVM-exception")
url='https://lldb.llvm.org/'
depends=(
  clang22
  gcc-libs
  glibc
  libedit
  libxml2
  llvm22-libs
  ncurses
  'python>=3.14'
  'python<3.15'
  xz
  zlib
)
provides=("liblldb.so=22.1-64")
source=("https://archive.archlinux.org/packages/l/lldb/lldb-${pkgver}-${_pkgrel_arch}-x86_64.pkg.tar.zst")
sha512sums=('23a761af189a7235034d4ce9af5e00b631f6f361f11843aa727f6431ae238d03f3aaa0c4f7d333a6d61863f0b3f0b6d019d1b2c9916f59463c0500e1d8065208')
options=(!strip !debug)

package() {
  local prefix="$pkgdir/usr/lib/llvm22"
  install -d "$prefix"
  bsdtar -xf "lldb-${pkgver}-${_pkgrel_arch}-x86_64.pkg.tar.zst" --no-same-owner -C "$prefix" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' \
    --strip-components=1 'usr/*'

  # Soname symlink next to libLLVM.so.22.1 and libclang-cpp.so.22.1
  ln -s "llvm22/lib/liblldb.so.22.1" "$pkgdir/usr/lib/liblldb.so.22.1"

  install -d "$pkgdir/usr/share/licenses"
  mv "$prefix/share/licenses/lldb" "$pkgdir/usr/share/licenses/$pkgname"
  rmdir "$prefix/share/licenses"
}
# vim:set ts=2 sw=2 et:
