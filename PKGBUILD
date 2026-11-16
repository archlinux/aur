# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgbase=metamod-source
pkgname=(metamod-source metamod-source-src)
# Metamod:Source's version: the stable branch's tag, <version>.<build>, the build being the number of
# commits, which its versioning counts with git
pkgver=1.12.0.1230
pkgrel=1
pkgdesc="Metamod:Source, the plugin loader of SourceMod, for Source engine game servers, for the games of hl2sdk with Linux servers (the addons folder of a server)"
arch=(x86_64)
url="https://www.metamodsource.net"
license=(Zlib)
# The SDKs of the games, with their static libraries
makedepends=(ambuild clang git hl2sdk python)
# The full history of Metamod:Source, its versioning counts the commits. The submodules at the
# commits the tag pins.
source=("git+https://github.com/alliedmodders/metamod-source.git#tag=$pkgver"
  "git+https://github.com/alliedmodders/amtl.git"
  "git+https://github.com/alliedmodders/hl2sdk-manifests.git"
  metamod-ubsan.patch
  source-sdk.txt)
sha512sums=('ba6d2370526eb4ea5d48f8c0179c3114aedfa0c52b81bd9cecd4a43fdaa22a76939fcf442860b94d32289eb92cda4d1654ff1fb2b97c5887dfb373753be16fdf'
  'SKIP'
  'SKIP'
  '3dec8a576592e58891b1b2d3eacfa6b62822c501d828b459c1b8e1e4dcd8e2770fd3b95e4fc67468963f63ae782f0caa0acb57829ca77292d2c989907193e3a1'
  'f427709e7137dd0249070ffa3aedaf9c04b434172d56d8d453ada2d0c439c2b31a9c82551da5c993468fc286edba756d86073268894394ba5190fc1475ca09b3')
b2sums=('456fb2e53379e4a26c09695d4b7914c387a07d35f1461a2e55a69338ba0ba763f1989d2bb9fe392f416097b65b4e6117e69be37a57c391d1ba4e101b6791a8b5'
  'SKIP'
  'SKIP'
  'a05c033d5fe6580d545d7caaf3333bfb78d87b023e1ce02303b7aa929c8426e4f8eb3267d6221c46b38cdbbf85318f346c1066b4166b7cb168c50b3772c8288e'
  'b856088fc19f7c921a5e2b3320a776e27b10a8d3d77c21041cb59348b2efde62491163c57227080c0091eb77e74c0d1fc2c0b72a01e0770df27777dc077ad600')

# Clang, like upstream's builds: the code builds with -Werror
_compilers() {
  export CC=clang CXX=clang++
}

prepare() {
  cd "$pkgbase" || exit
  local _submodule
  for _submodule in third_party/amtl hl2sdk-manifests; do
    git submodule init "$_submodule"
    git config "submodule.$_submodule.url" "$srcdir/${_submodule##*/}"
  done
  # --force: on a rebuild makepkg only resets the main checkout, the submodules would keep the
  # previous build's changes
  git -c protocol.file.allow=always submodule update --force third_party/amtl hl2sdk-manifests

  # Without the undefined behaviour UBSan reports: SourceHook's code generator copies no null
  # buffer on its first write (and checks its allocation before using it), and its thunks for odd
  # vtable entries write the jump's 32-bit offset and the 64-bit address with memcpy rather than
  # through unaligned pointers (on x86_64 the offset was written as 8 bytes), as does the
  # temporary detour of tier0's Error() at start. Upstream replaced SourceHook with KHook after
  # 1.12; the detour is still there.
  patch -Np1 -i "$srcdir/metamod-ubsan.patch"
}

build() {
  _compilers
  mkdir -p "$pkgbase/build"
  cd "$pkgbase/build" || exit
  # Every game of hl2sdk, for its servers' architectures. The SDKs' shared libraries (tier0,
  # vstdlib) are only linked against, the games bring their own.
  python ../configure.py --enable-optimize --enable-tests --sdks=present --targets=x86,x86_64 \
    --hl2sdk-root=/usr/lib/hl2sdk
  ambuild
}

check() {
  cd "$pkgbase/build" || exit
  # SourceHook's tests, the hooking library of Metamod:Source. 32-bit only: upstream doesn't build
  # them for 64-bit Linux ("for now", alliedmodders/metamod-source@5d48696), and its next version
  # replaces SourceHook with KHook.
  ./core/sourcehook/test/test_sourcehook/linux-x86/test_sourcehook -v
}

_package_amtl_license() {
  # AMTL has no licence file, its licence is in each of its files
  sed -n 3,28p "$srcdir/$pkgbase/third_party/amtl/amtl/am-string.h" | sed 's|^// \?||' |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/${FUNCNAME[1]#package_}/AMTL.txt"
}

package_metamod-source() {
  pkgdesc="Metamod:Source, the plugin loader of SourceMod, for Source engine game servers, for the games of hl2sdk with Linux servers (the addons folder of a server)"
  # Metamod:Source (zlib licence), the Source SDK's libraries it links (source-sdk.txt)
  license=(Zlib LicenseRef-Source-SDK)
  # The games' 32-bit and 64-bit servers
  depends=(gcc-libs glibc lib32-gcc-libs lib32-glibc)

  # The addons folder of a game (e.g. doi/addons), with metamod.vdf, which loads Metamod:Source, to
  # copy into a server: the same for each game, with the binaries of every game (metamod.2.<game>.so,
  # bin/linux64 for the 64-bit servers). In /usr/lib, as it's mostly libraries. Without a cd, which
  # namcap's parser, running the package functions in a restricted shell, can't do.
  install -d "$pkgdir/usr/lib/metamod"
  cp -r --no-preserve=ownership "$srcdir/$pkgbase/build/package/addons" "$pkgdir/usr/lib/metamod/"

  local _licenses="$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}"
  install -Dm644 "$srcdir/$pkgbase/LICENSE.txt" -t "$_licenses"
  install -Dm644 "$srcdir/source-sdk.txt" -t "$_licenses"
}

package_metamod-source-src() {
  pkgdesc="Metamod:Source's sources the metamod-source package is built from, for building SourceMod and plugins or extensions against it (--mms-path=/usr/src/metamod-source)"
  arch=(any)
  # Metamod:Source (zlib licence), AMTL (BSD 3-clause)
  license=(Zlib BSD-3-Clause)

  # The tree of the build with its submodules (AMTL, the SDK manifests), without the build and git's
  # files, read-only: builds against it write into their own build folders. Without what's prebuilt:
  # SourceHook's generator worker (shworker.bin and .exe, from shworker/), the Windows installer of
  # cruft/, and AMTL's googletest, an empty submodule.
  install -d "$pkgdir/usr/src/metamod-source"
  tar -C "$srcdir/$pkgbase" --exclude=.git --exclude=./build --exclude=__pycache__ \
    --exclude=./core/sourcehook/generate/shworker.bin --exclude=./core/sourcehook/generate/shworker.exe \
    --exclude=./cruft --exclude=./third_party/amtl/third_party -c . |
    tar -C "$pkgdir/usr/src/metamod-source" -x --no-same-owner

  install -Dm644 "$srcdir/$pkgbase/LICENSE.txt" -t "$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}"
  _package_amtl_license
}
