# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sourcemod-smjansson
_name=SMJansson
# SMJansson has no releases: its version (smsdk_config.h), the number of commits and the latest
# commit, which fixes the build with current SourceMod
_commit=b811b3341254fff6756d66fbc6c928ee6e701a32
pkgver=2.6.0.1.r36.gb811b33
pkgrel=1
pkgdesc="SMJansson, a JSON extension of SourceMod (in the addons folder of sourcemod)"
arch=(x86_64)
url="https://github.com/davenonymous/SMJansson"
# The extension's code says GPL 3.0 with SourceMod's exceptions; the repository has no license file
license=(GPL-3.0-only LicenseRef-SourceMod-exception)
depends=(lib32-gcc-libs lib32-glibc lib32-jansson sourcemod)
# The sources of the installed SourceMod, which it's built against
makedepends=(ambuild clang python sourcemod-src)
checkdepends=(sourcemod-scripting)
# Where ./aur-packages commits reads the pins from: the commit pkgver names
_pins_lookup() {
  echo "_commit $(curl -fsSL "https://api.github.com/repos/davenonymous/SMJansson/commits/${pkgver##*.g}" | jq -r .sha)"
}
source=("$_name-$_commit.tar.gz::https://github.com/davenonymous/SMJansson/archive/$_commit.tar.gz"
  smjansson-system-jansson.patch)
sha512sums=('36e8b5db06dea90a205c3ad3266dd9d41ba19f5dba86be1e79506829432153245e3499bff7e97c74e6103a32bde949bf976059528f35e40b01f7ea8a082d1028'
  '197ac4ed92556f931cca36fad74b005b2b1f5a8a06a7b414224352965ae91b7864f57beab9981e087597bda15ce51ddbaac63657755dc18cdb78583e7d4885fe')
b2sums=('a5a6f5a53710c299caf381684d07a4f7a8eb6f92c8eaffcfd3d9dc84a76f87898b207abfd94586b61049a7d3b34c18bb93e7b28e684d5487641309584498bca4'
  'a1c6dc75875581de11a91e2a9f1005f923af556b89fb622882e9e663e61d0a7ae1fe019cc4a86b9aeb491bfdebaaba259e972f22d120caadccb0431bef3fde36')

prepare() {
  cd "$srcdir/$_name-$_commit" || exit
  # SourceMod's SDK manifests where the build script looks for them
  ln -s /usr/src/sourcemod/hl2sdk-manifests hl2sdk-manifests

  # The extension with the system's jansson and without SDKs (--sdks=), SourceMod's asm and
  # libudis86 (not used); configure.py with Python 3.14's argparse, which checks the help texts;
  # test.inc with the regex.inc it uses
  patch -Np1 -i "$srcdir/smjansson-system-jansson.patch"
  # Nothing prebuilt or bundled: the extension, the test plugin and jansson 2.6
  rm -r bin pawn/plugins jansson
}

build() {
  # Clang, like SourceMod's builds; position-independent code, which upstream only builds for
  # x86_64, so the library has no text relocations
  export CC=clang CXX=clang++
  CFLAGS+=" -fPIC"

  mkdir -p "$_name-$_commit/build"
  cd "$_name-$_commit/build" || exit
  # No SDK, as it's a plain extension. The build script requires the paths of Metamod:Source and a
  # jansson source to be folders, but uses neither: jansson's headers are in /usr/include.
  python ../configure.py --enable-optimize --targets=x86 --sdks= \
    --sm-path=/usr/src/sourcemod --mms-path="$srcdir" --jansson-path=/usr/include
  ambuild
}

check() {
  # The test plugin compiles against the include file and SourceMod's
  cd "$_name-$_commit/build/package/addons/sourcemod/scripting" || exit
  spcomp64 -iinclude -o"$srcdir/smjansson.test.smx" smjansson.test.sp
}

package() {
  # In the addons folder of sourcemod, as it uses no SDK: the extension, its include file and test
  # plugin, as in upstream's package
  install -d "$pkgdir/usr/lib/sourcemod"
  cp -r --no-preserve=ownership "$srcdir/$_name-$_commit/build/package/addons" "$pkgdir/usr/lib/sourcemod/"

  # SourceMod's license and exceptions, which the extension's code refers to
  install -Dm644 /usr/src/sourcemod/licenses/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
