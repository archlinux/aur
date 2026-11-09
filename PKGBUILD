# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgbase=metamod-source-dev
pkgname=(metamod-source-dev metamod-source-dev-src)
_name=metamod-source
# Metamod:Source's development builds: the tags of master's builds (2.0, released by upstream as
# prereleases), <version>.<build>, the build being the number of commits, which its versioning
# counts with git
pkgver=2.0.0.1490
pkgrel=1
pkgdesc="Metamod:Source, a plugin loader for Source engine game servers (development builds)"
arch=(x86_64)
url="https://www.metamodsource.net"
license=(Zlib)
# The SDKs of the games, with their static libraries
makedepends=(ambuild clang git hl2sdk python)
# The Zydis release KHook's SafetyHook's amalgamated copy (4.0.0) is generated from again, as for
# SourceMod's SafetyHook: the 4.1 decoder fixes, the API SafetyHook uses is the same
_zydisver=4.1.1
# The full history of Metamod:Source, its versioning counts the commits. The submodules at the
# commits the tag pins, KHook's SafetyHook too (not its googletest and gtest-parallel, only for its
# tests).
source=("git+https://github.com/alliedmodders/metamod-source.git#tag=$pkgver"
  "git+https://github.com/alliedmodders/amtl.git"
  "git+https://github.com/alliedmodders/hl2sdk-manifests.git"
  "git+https://github.com/Kenzzer/KHook.git"
  "git+https://github.com/alliedmodders/safetyhook.git"
  "git+https://github.com/zyantific/zydis.git#tag=v$_zydisver"
  "git+https://github.com/zyantific/zycore-c.git"
  loader-test-khook.patch
  source-sdk.txt)
sha512sums=('752a8557d98b738d7e4167914f712a3fa62d69f832af3de7069b721e475444493cf9fcb89e8c575584ab94e83bf18868da0482568792218ac372e9ce20ade289'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '7ca4fc08ad5074f7ae7115f8eb511ad53b84edcf6770395d43512bee73e38ffad0e1b59850e7732454abdf880266307cf5fd396ac516ef1f9489d4fb592a455b'
  'SKIP'
  'a32501433e60802869ad970419ea1f73ba7af90aa6825299576184e6e43f06858a51727291a837129553af078354e150cb1265a85aa4528772ae018d21666e61'
  'f427709e7137dd0249070ffa3aedaf9c04b434172d56d8d453ada2d0c439c2b31a9c82551da5c993468fc286edba756d86073268894394ba5190fc1475ca09b3')
b2sums=('db0fcd0edb527a29a3889ef826f12d335663d09a54943589b3cac5d4b4ad29039e8b690653c8e328b18e5833d161de557ab8c8f9b5468c3e69fe5212f30774d7'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'a596fe2649f4f9d5644b3abe7df3fa1d921ec378324691f04e17df60e3ebec39f3877ecb68519b71fde1a0a8144e48b35556febb241fa3cc631794c7e866f8d5'
  'SKIP'
  '18c1a5f6046c090d2107ea3d0bfdd1e4aaa49e1f7659d281403fe3a0b619fcff0b786af73482237e5849e176da50044d8fbf134eb12b11fdf1e7600be2b0979d'
  'b856088fc19f7c921a5e2b3320a776e27b10a8d3d77c21041cb59348b2efde62491163c57227080c0091eb77e74c0d1fc2c0b72a01e0770df27777dc077ad600')

# Clang, like upstream's builds: the code builds with -Werror
_compilers() {
  export CC=clang CXX=clang++
}

prepare() {
  cd "$_name" || exit
  local _submodule
  local -A _submodules=(["third_party/amtl"]=amtl ["hl2sdk-manifests"]=hl2sdk-manifests
    ["third_party/khook"]=KHook)
  for _submodule in "${!_submodules[@]}"; do
    git submodule init "$_submodule"
    git config "submodule.$_submodule.url" "$srcdir/${_submodules[$_submodule]}"
  done
  # --force: on a rebuild makepkg only resets the main checkout, the submodules would keep the
  # previous build's changes
  git -c protocol.file.allow=always submodule update --force "${!_submodules[@]}"
  git -C third_party/khook submodule init third_party/safetyhook
  git -C third_party/khook config submodule.third_party/safetyhook.url "$srcdir/safetyhook"
  git -C third_party/khook -c protocol.file.allow=always submodule update --force third_party/safetyhook

  # The loader's tests with KHook's headers, which the loader's sources include, like the loader,
  # and without SourceHook's, which is gone. Upstream wants to rework the tests for the move to KHook
  # instead (https://github.com/alliedmodders/metamod-source/pull/293)
  patch -Np1 -i "$srcdir/loader-test-khook.patch"

  # SafetyHook's Zydis, amalgamated from Zydis and Zycore at the release's commits by Zydis's
  # script, with the static build defines SafetyHook's copy starts with (without them, Zydis
  # declares its functions as imported from a shared library)
  cd "$srcdir/zydis" || exit
  git submodule init dependencies/zycore
  git config submodule.dependencies/zycore.url "$srcdir/zycore-c"
  git -c protocol.file.allow=always submodule update --force dependencies/zycore
  python assets/amalgamate.py >/dev/null
  local _zydis="$srcdir/$_name/third_party/khook/third_party/safetyhook/zydis"
  grep -q '^#define ZYDIS_STATIC_BUILD$' "$_zydis/Zydis.h" || exit
  printf '#define ZYCORE_STATIC_BUILD\n#define ZYDIS_STATIC_BUILD\n' |
    cat - amalgamated-dist/Zydis.h >"$_zydis/Zydis.h"
  cp amalgamated-dist/Zydis.c "$_zydis/Zydis.c"
}

build() {
  _compilers
  mkdir -p "$_name/build"
  cd "$_name/build" || exit
  # Position-independent code for the SDKs' tier1 and mathlib, which the build compiles into the
  # plugins: l4d2's manifest doesn't add -fPIC like the others, which leaves text relocations
  CXXFLAGS+=" -fPIC"
  # Every game of hl2sdk, for its servers' architectures: its Source 1 games, the Source 2 ones
  # (cs2, dota, deadlock) need SDKs hl2sdk doesn't have. The SDKs' shared libraries (tier0,
  # vstdlib) are only linked against, the games bring their own.
  python ../configure.py --enable-optimize --enable-tests --sdks=present --targets=x86,x86_64 \
    --hl2sdk-root=/usr/lib/hl2sdk
  ambuild
}

check() {
  cd "$_name/build" || exit
  # The loader's tests, 32 and 64-bit
  local _test
  for _test in loader/test/test_loader/linux-*/test_loader; do
    "$_test"
  done
}

_package_amtl_license() {
  # AMTL has no licence file, its licence is in each of its files
  sed -n 3,28p "$srcdir/$_name/third_party/amtl/amtl/am-string.h" | sed 's|^// \?||' |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/${FUNCNAME[1]#package_}/AMTL.txt"
}

_package_hook_licenses() {
  # KHook, the hooking library of Metamod:Source 2.0, and its SafetyHook with Zydis and Zycore
  local _licenses="$pkgdir/usr/share/licenses/${FUNCNAME[1]#package_}"
  install -Dm644 "$srcdir/$_name/third_party/khook/LICENSE" "$_licenses/KHook.txt"
  install -Dm644 "$srcdir/safetyhook/LICENSE" "$_licenses/SafetyHook.txt"
  install -Dm644 "$srcdir/zydis/LICENSE" "$_licenses/Zydis.txt"
  install -Dm644 "$srcdir/zycore-c/LICENSE" "$_licenses/Zycore.txt"
}

package_metamod-source-dev() {
  pkgdesc="Metamod:Source, a plugin loader for Source engine game servers, for the Source 1 games of hl2sdk with Linux servers (development builds)"
  # Metamod:Source and KHook (zlib licence), SafetyHook (Boost), Zydis and Zycore (MIT), AMTL (BSD
  # 3-clause), the Source SDK's libraries it links (source-sdk.txt)
  license=(Zlib BSL-1.0 MIT BSD-3-Clause LicenseRef-Source-SDK)
  # The games' 32-bit and 64-bit servers
  depends=(gcc-libs glibc lib32-gcc-libs lib32-glibc)
  # Not a metamod-source for SourceMod, which builds against Metamod:Source 1.12 (with SourceHook,
  # which 2.0 replaces with KHook), as SourceMod's own builds do
  conflicts=(metamod-source)

  cd "$_name/build/package" || exit

  # The addons folder of a game (e.g. doi/addons), with metamod.vdf, which loads Metamod:Source, to
  # copy into a server: the same for each game, with the binaries of every game (metamod.2.<game>.so,
  # bin/linux64 for the 64-bit servers). In /usr/lib, as it's mostly libraries.
  install -d "$pkgdir/usr/lib/metamod"
  cp -r --no-preserve=ownership addons "$pkgdir/usr/lib/metamod/"

  local _licenses="$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}"
  install -Dm644 "$srcdir/$_name/LICENSE.txt" -t "$_licenses"
  install -Dm644 "$srcdir/source-sdk.txt" -t "$_licenses"
  _package_amtl_license
  _package_hook_licenses
}

package_metamod-source-dev-src() {
  pkgdesc="Metamod:Source's sources the metamod-source-dev package is built from, for building plugins against it (--mms-path=/usr/src/metamod-source)"
  arch=(any)
  # As metamod-source-dev's, without the Source SDK's libraries
  license=(Zlib BSL-1.0 MIT BSD-3-Clause)
  # In the place of metamod-source-src, which SourceMod builds against
  conflicts=(metamod-source-src)

  # The tree of the build with its submodules (AMTL, the SDK manifests, KHook with SafetyHook and
  # the regenerated Zydis), without the build and git's files, read-only: builds against it write
  # into their own build folders. Without the Windows installer of cruft/, prebuilt, and the empty
  # submodules: AMTL's googletest, KHook's googletest and gtest-parallel.
  install -d "$pkgdir/usr/src/metamod-source"
  tar -C "$srcdir/$_name" --exclude=.git --exclude=./build --exclude=__pycache__ --exclude=./cruft \
    --exclude=./third_party/amtl/third_party --exclude=./third_party/khook/third_party/googletest \
    --exclude=./third_party/khook/third_party/gtest-parallel -c . |
    tar -C "$pkgdir/usr/src/metamod-source" -x --no-same-owner

  install -Dm644 "$srcdir/$_name/LICENSE.txt" -t "$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}"
  _package_amtl_license
  _package_hook_licenses
}
