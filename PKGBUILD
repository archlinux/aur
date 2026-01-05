# Maintainer: Aster O'Connor <archlinux.anatomist477 at passmail dot net>
pkgname=hylo-llvm-bin
pkgver=20251214_185311
_llvm_ver=20.1.6
pkgrel=1
pkgdesc="LLVM library and binaries compatible with Swift and Hylo"
arch=('x86_64' 'aarch64')
url="https://github.com/hylo-lang/llvm-build"
license=('Apache-2.0 WITH LLVM-exception')
depends=('curl' 'bash' 'gcc-libs' 'glibc' 'zstd' 'ncurses' 'libxml2')
options=('!debug' '!strip' 'staticlibs')
source=("https://github.com/hylo-lang/llvm-build/releases/download/${pkgver//_/-}/llvm-${_llvm_ver}-${CARCH}-unknown-linux-gnu-MinSizeRel.tar.zst")
sha256sums=('4eb3c1e9b6938244fea5aa684c088543ffbab7433c4749580394e959303ed809')

# We install llvm.pc to /usr/lib/pkgconfig/llvm.pc
# This is a little scary sounding, but is required for
# SwiftPM to see our build of LLVM, and is okay due to LLVM
# not providing any package-config files, only CMake modules.
package() {
   local _lib_prefix="/usr/lib/hylo-llvm"
   local _destdir="$pkgdir$_lib_prefix"
   mkdir -p "$_destdir"

   echo "Installing artifacts..."
   cp -r "$srcdir/llvm-${_llvm_ver}-${CARCH}-unknown-linux-gnu-MinSizeRel"/* "$_destdir/"
   rm -f "$_destdir/llvm-${_llvm_ver}-${CARCH}-unknown-linux-gnu-MinSizeRel.tar.zst"

   mkdir -p "$pkgdir/usr/bin"
   for _binary in "$_destdir/bin/"*; do
      local _basename="$(basename "$_binary")"
      ln -s "$_lib_prefix/bin/$_basename" "$pkgdir/usr/bin/${_basename}-hylo"
   done

   # install license
   echo "Installing LICENSE..."
   install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   rm LICENSE.txt

   # handle pc file
   mkdir -p "$_destdir/lib/pkgconfig"
   local _pc_file="$_destdir/lib/pkgconfig/llvm.pc"

   if [ -f "$_destdir/pkgconfig/llvm.pc" ]; then
      mv "$_destdir/pkgconfig/llvm.pc" "$_pc_file"
   fi

   if [ -f "$_pc_file" ]; then
      echo "Patching llvm.pc..."
      sed -i "s|\${pcfiledir}/..|$_lib_prefix|g" "$_pc_file"
   else
      echo "llvm.pc was not found"
      return 1
   fi

   # create symlink
   echo "Creating symlink for llvm.pc..."
   mkdir -p "$pkgdir/usr/lib/pkgconfig"
   ln -s "$_lib_prefix/lib/pkgconfig/llvm.pc" "$pkgdir/usr/lib/pkgconfig/llvm.pc"
}

prepare() {
   curl "https://llvm.org/LICENSE.txt" > LICENSE.txt
}
