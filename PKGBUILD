# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sourcemod-smjansson
_name=SMJansson
# Upstream's tags are jansson's version and a release of SMJansson for it (v2.15.1-1)
pkgver=2.15.1.1
pkgrel=4
# The latest commit: v2.15.1-1 with the build fixes merged right after it (#15, #16, #18, #19),
# which spares their patches; the next release's tag replaces it
_commit=49886bbc0f8520b4c335a12e974c1aa044aa5b8f
pkgdesc="SMJansson, a JSON extension of SourceMod (in the addons folder of sourcemod)"
arch=(x86_64)
url="https://github.com/davenonymous/SMJansson"
# GPL 3.0 with exceptions like SourceMod's, which the SMJansson authors grant for its code
# (LICENSE.txt)
license=(GPL-3.0-only LicenseRef-SMJansson-exception)
# The 32-bit and the 64-bit extension, for the servers of both architectures
depends=(glibc jansson lib32-gcc-libs lib32-glibc lib32-jansson libgcc sourcemod)
# The sources of the installed SourceMod, which it's built against
makedepends=(ambuild clang python sourcemod-src)
checkdepends=(sourcemod-scripting)
source=("$_name-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('edee38448f9b9e6cd5b81bb497e04b091f3d4099d6d4890ada02911b2f4fe6ed183b4bc62d8d2c971860d1ede9a0e3927564a0328abb5f12fb31f45e49ce6f9b')
b2sums=('2cad9699ad5387bccabcd8844272b1ae366d2f527bf014f85d4bee0ab3729f69ffc6d3dddf49e0a4d1bbc8875a1d2949df7a7353aaa50114a9c2555ecdd5e659')

prepare() {
  cd "$srcdir/$_name-$_commit" || exit
  # Nothing prebuilt or bundled: the test plugin, jansson's sources and its configuration headers
  rm -r pawn/plugins jansson jansson-config
}

build() {
  # Clang, like SourceMod's builds; position-independent code, which upstream only builds for
  # x86_64, so the 32-bit library has no text relocations
  export CC=clang CXX=clang++
  CFLAGS+=" -fPIC"

  mkdir -p "$_name-$_commit/build"
  cd "$_name-$_commit/build" || exit
  # The system's jansson (2.15.1, the version it bundles)
  python ../configure.py --enable-optimize --targets=x86,x86_64 --sm-path=/usr/src/sourcemod \
    --system-jansson
  ambuild
}

check() {
  # The test plugin compiles against the include file and SourceMod's
  cd "$_name-$_commit/build/package/addons/sourcemod/scripting" || exit
  spcomp64 -iinclude -o"$srcdir/smjansson.test.smx" smjansson.test.sp
}

package() {
  # In the addons folder of sourcemod, as it uses no SDK: the extensions (the 64-bit one in x64/),
  # the include file and the test plugin, as in upstream's package
  install -d "$pkgdir/usr/lib/sourcemod"
  cp -r --no-preserve=ownership "$srcdir/$_name-$_commit/build/package/addons" "$pkgdir/usr/lib/sourcemod/"

  # The licence with the exceptions, and the GPL texts it refers to
  install -Dm644 "$srcdir/$_name-$_commit/LICENSE.txt" "$srcdir/$_name-$_commit"/licenses/GPLv{2,3}.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
