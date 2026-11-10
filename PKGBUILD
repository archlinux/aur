# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sourcemod-steamworks
_name=SM-SteamWorks
pkgver=1.2.167
pkgrel=2
pkgdesc="SteamWorks, a SourceMod extension exposing Steamworks functions (in the addons folder of sourcemod)"
arch=(x86_64)
url="https://github.com/alliedmodders/SM-SteamWorks"
# The extension: GPL 3.0 with SourceMod's exceptions. The Steamworks SDK's headers it's built with
# (steamworks-sdk.txt).
license=(GPL-3.0-only LicenseRef-SourceMod-exception LicenseRef-Steamworks-SDK)
# libsteam_api.so is the game's (bin/libsteam_api.so)
depends=(glibc lib32-gcc-libs lib32-glibc libgcc sourcemod)
# The sources of the installed SourceMod and Metamod:Source, which it's built against; SourceMod's
# from -6 on, whose SafetyHook (the extension's detours) has its fixes (the bundled Zydis.h, no
# unaligned accesses)
makedepends=(ambuild clang metamod-source-src python 'sourcemod-src>=1.12.0.7260-6')
checkdepends=(sourcemod-scripting)
# The Steamworks SDK upstream builds with (STEAMWORKS_SDK_COMMIT of its CI), 1.32: the extension is
# written against its API and looks up the newer interfaces it uses itself
_sdkcommit=3aa76d12fa787eec528e404fb7d9268bb02eaf28
# Where ./aur-packages commits reads the pins from: the SDK of the release's CI
_pins_lookup() {
  echo "_sdkcommit $(curl -fsSL "https://raw.githubusercontent.com/alliedmodders/SM-SteamWorks/v$pkgver/.github/workflows/ci.yml" |
    sed -n -E 's/^ *STEAMWORKS_SDK_COMMIT: *([0-9a-f]{40}).*/\1/p')"
}
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "SteamworksSDK-$_sdkcommit.tar.gz::https://github.com/rlabrecque/SteamworksSDK/archive/$_sdkcommit.tar.gz"
  steamworks-sdk.txt)
sha512sums=('db26ae087fbc077b3de5eadb1446f59e3bf13c7e377c3dfc74342e25261c17b77873a0676194079efb23eefd7c5669d38ff1528c66c47a2ae28dd7c7f1b2a336'
  'cab2549caa6adf04a95dedf5a78458526b8a04de3eea329b4b9587ae1af58711777bf26080d0ab6653d34dfe456b2f26587e573d31fcba3d8e65876246df9c73'
  'ee4421299f36e5179bfd60c605e9d303e1ad9aa27757121cedbcb7326ba328591762a9311fa4947102462337e1048615990dc5d70b6d7db495c4b3fef2256c99')
b2sums=('6d1bcffc436567130b30dc31486b325403b78a17f873e4b5725e9d603e56b97dfcd35b1ba17031da459eacb936cb54821a04f235ffe465c5df8c539f25c59df9'
  '22631974e707e85b6501e59e9a63085820f86f8a7d7c00c38f1502a06fceb7b7eb4c249a2c1dafbaa97bf2294a6c1b17f3182b6a5405b2f6e01e2563c1e6958b'
  '70ce8e33202d921ef45467270536c52396fda2e681cb843616fa6dc1558371672981d864b352a60ff138133435909721880f0fe0c4c4b5efe9ca3eef5d93f95f')

build() {
  # Clang, like SourceMod's builds; position-independent code, so the library has no text
  # relocations
  export CC=clang CXX=clang++
  CFLAGS+=" -fPIC"

  # For the 32-bit and 64-bit servers, like SourceMod: one architecture per build folder
  local _target
  for _target in x86 x86_64; do
    mkdir -p "$srcdir/build-$_target"
    cd "$srcdir/build-$_target" || exit
    python "$srcdir/$_name-$pkgver/configure.py" --enable-optimize --target="$_target" \
      --version="$pkgver" --sm-path=/usr/src/sourcemod --mms-path=/usr/src/metamod-source \
      --steamworks-path="$srcdir/SteamworksSDK-$_sdkcommit"
    ambuild
  done
}

check() {
  # The example plugin compiles against the include file and SourceMod's
  cd "$_name-$pkgver/Pawn" || exit
  spcomp64 -iincludes -E -o"$srcdir/swag.smx" swag.sp
}

package() {
  # In the addons folder of sourcemod, as it works with any game's SDK: the extensions (x64/ for
  # the 64-bit one) and the include file, as in upstream's packages
  install -d "$pkgdir/usr/lib/sourcemod"
  cp -r --no-preserve=ownership "$srcdir"/build-{x86,x86_64}/package/addons "$pkgdir/usr/lib/sourcemod/"

  install -Dm644 /usr/src/sourcemod/licenses/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/steamworks-sdk.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
