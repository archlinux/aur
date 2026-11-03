# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgbase=metamod-source
pkgname=(metamod-source metamod-source-src)
# Metamod:Source's version: the stable branch's tag, <version>.<build>, the build being the number of
# commits, which its versioning counts with git
pkgver=1.12.0.1229
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
  source-sdk.txt)
sha512sums=('b0cd1b9fae5f7e6e463775748a5cf9b3c1ded6f9a5442e1d27af175cea664cc96fbff41ffab4782ce684528e7e4a26ae680cf896b3c3475b23485295cd2bb60c'
  'SKIP'
  'SKIP'
  'f427709e7137dd0249070ffa3aedaf9c04b434172d56d8d453ada2d0c439c2b31a9c82551da5c993468fc286edba756d86073268894394ba5190fc1475ca09b3')
b2sums=('e9bd2d1442d3cca1df7a42394d07d3117de790f1ce72651c579da12b9f6fbaaba12ece78b13a069ecc168436edaf9b00adb5e2acb86da63e4c2457c11115d5bf'
  'SKIP'
  'SKIP'
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
  git -c protocol.file.allow=always submodule update third_party/amtl hl2sdk-manifests
}

build() {
  _compilers
  mkdir -p "$pkgbase/build"
  cd "$pkgbase/build" || exit
  # Position-independent code for the SDKs' tier1 and mathlib, which the build compiles into the
  # plugins: l4d2's manifest doesn't add -fPIC like the others, which leaves text relocations
  CXXFLAGS+=" -fPIC"
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

  cd "$pkgbase/build/package" || exit

  # The addons folder of a game (e.g. doi/addons), with metamod.vdf, which loads Metamod:Source, to
  # copy into a server: the same for each game, with the binaries of every game (metamod.2.<game>.so,
  # bin/linux64 for the 64-bit servers). In /usr/lib, as it's mostly libraries.
  install -d "$pkgdir/usr/lib/metamod"
  cp -r --no-preserve=ownership addons "$pkgdir/usr/lib/metamod/"

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
