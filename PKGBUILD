# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sourcemod-steamworks
_name=SteamWorks
# The latest commit, versioned like git describe from the last tag: its SteamWorks.inc compiles
# with current SourceMod, the release's doesn't
_commit=f0c1b62dff615511b27824aaa2815c7dc58d2716
pkgver=1.2.3c.r7.gf0c1b62
pkgrel=1
pkgdesc="SteamWorks, a SourceMod extension exposing Steamworks functions (in the addons folder of sourcemod)"
arch=(x86_64)
url="https://github.com/KyleSanderson/SteamWorks"
# The extension: GPL 3.0 with SourceMod's exceptions. The Steamworks headers of the Source SDK it's
# built with (steamworks-sdk.txt).
license=(GPL-3.0-only LicenseRef-SourceMod-exception LicenseRef-Steamworks-SDK)
# libsteam_api.so is the game's (bin/libsteam_api.so)
depends=(lib32-gcc-libs lib32-glibc sourcemod)
# The Steamworks headers and link library of the SDK of CS:GO (hl2sdk)
# The sources of the installed SourceMod and Metamod:Source, which it's built against
makedepends=(ambuild clang hl2sdk metamod-source-src python sourcemod-src)
checkdepends=(sourcemod-scripting)
# Where ./aur-packages commits reads the pins from: the commit pkgver names
_pins_lookup() {
  echo "_commit $(curl -fsSL "https://api.github.com/repos/KyleSanderson/SteamWorks/commits/${pkgver##*.g}" | jq -r .sha)"
}
source=("$_name-$_commit.tar.gz::https://github.com/KyleSanderson/SteamWorks/archive/$_commit.tar.gz"
  steamworks-sourcemod-1.12.patch
  steamworks-sdk.txt)
sha512sums=('89fc51f990b79c1188f3e184d73c376cda8b17b06bd7290c6762beab6e746ee4bdb6a4e7ef7582191287f9e16185ad95c50010bc4124cc4c9c724093c3e231df'
  '926e6401bd77acd16eea032c8581ec9c2f3945fd7a1b4579ebdd76052dd361549c7f9f507364c94f8305a81b4c29ea90c927144dc5a141c61cdb9220cdba1be2'
  'b1892658b7aee13d2d56ce3694626e7d8c49e22ed3bd6e043d46d93c77b8643ace1538c698ff4031f19c33f639beb9ac8c50840636cdf3a2f5542f19a791d868')
b2sums=('3405aec6618a3d58788b4cc0e505d6159c5892b6eda3ef42b82c87dda0f783f3b4210f146aaf55438666cdf19530e6162b020df4ad6e2205aae3bfd876f54a6e'
  'bd0a932b039402fba16fef6b4d01af98f6deb0644c181679109afb1684de8d1536e7a2022a3ddaf86346583f43d61b93e71ff60be91a842284a5ac2c9ce082a0'
  '34812f414b4468365c6ad5e40d0a44e5453ffe3c4479dd4fb6d610a49302f45160518fb8e0e738d05b50b7155c16a67919cb4be328b2350fa8b74f1c89a103b9')

prepare() {
  # A Steamworks SDK of the headers and link library of CS:GO's SDK, the layout of Valve's: its
  # branch has the newest ones of the SDKs, including isteamgamecoordinator.h, which Valve's
  # Steamworks SDK no longer has. The extension is linked against libsteam_api.so, which the game
  # brings.
  local _csgo=/usr/lib/hl2sdk/hl2sdk-csgo
  mkdir -p "$srcdir/steamworks-sdk"/{public,redistributable_bin/linux32}
  ln -sfn "$_csgo/public/steam" "$srcdir/steamworks-sdk/public/steam"
  ln -sf "$_csgo/lib/linux/libsteam_api.so" \
    "$srcdir/steamworks-sdk/redistributable_bin/linux32/libsteam_api.so"

  cd "$srcdir/$_name-$_commit" || exit
  # The SDK of the Steamworks headers and their newer API, and the headers of SourceMod 1.12 (C++17)
  patch -Np1 -i "$srcdir/steamworks-sourcemod-1.12.patch"
}

build() {
  # Clang, like SourceMod's builds; position-independent code, so the library has no text
  # relocations
  export CC=clang CXX=clang++
  CFLAGS+=" -fPIC"

  mkdir -p "$_name-$_commit/build"
  cd "$_name-$_commit/build" || exit
  python ../configure.py --enable-optimize --target=x86 --sdks=csgo --hl2sdk-root=/usr/lib/hl2sdk \
    --sm-path=/usr/src/sourcemod --mms-path=/usr/src/metamod-source \
    --steamworks-path="$srcdir/steamworks-sdk"
  ambuild
}

check() {
  # The example plugin compiles against the include file and SourceMod's
  cd "$_name-$_commit/build/package/addons/sourcemod/scripting" || exit
  spcomp64 -iinclude -E -o"$srcdir/swag.smx" swag.sp
}

package() {
  # In the addons folder of sourcemod, as it works with any game's SDK: the extension, its include
  # file and example plugin, as in upstream's package
  install -d "$pkgdir/usr/lib/sourcemod"
  cp -r --no-preserve=ownership "$srcdir/$_name-$_commit/build/package/addons" "$pkgdir/usr/lib/sourcemod/"

  install -Dm644 /usr/src/sourcemod/licenses/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/steamworks-sdk.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
