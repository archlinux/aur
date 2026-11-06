# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sourcemod-smjansson
_name=SMJansson
# Upstream's tags are jansson's version and a release of SMJansson for it (v2.15.1-1)
pkgver=2.15.1.1
pkgrel=2
_tag=v${pkgver%.*}-${pkgver##*.}
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
source=("$_name-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
  smjansson-ambuilder-binary-compiler.patch
  smjansson-system-jansson.patch)
sha512sums=('121574e7c7a6c6853bafb1de08761f72dcaad978ff30a3677c4203f7860c5f9ca1d2fa93fa7667879b920019b71c3d0f87f0b3b1cb95dfb4145c86fa29304b53'
  'fd859673e30df5e814e4664f36fccac4f8487d9e7041856786236dc6e025d799dd3c263e39d49bd0dfe117ea2a741b0ab34d0fae46da6181b585fc9a2479407b'
  'b35c431dfaee9e904f43712d85daf5705298dd299be88c8b049f12b75e3b4d6a2d28919c6788c7545aa306dbc34b0c4de82e9786ae65f824f8b94d279a0b1ae5')
b2sums=('9bbd71b5c3e6e99e22c29fd3e80ee130e43a670249a5dbdadc836f4f6603f3c0dc1af397bc7f43309f9ff5c63ce5798be3bc22127c61a97f99dc86b9c94eb959'
  '0dd35a75297218cdfa9d5076a39c0d19ce2a917fe0debf95837dad527197478bf2b2a89907cded625e1c568631e91922509042a6749180add752543785f67c5b'
  '6947c12ca8e2d3a30c1d1c36d83193c1a6b6c3655e26fb55b6f66ab3c4ef3f56e8cd21fe5749c737023ebc4508bded467240bf0d8ec24bfef4fb5d6830a2a251')

prepare() {
  cd "$srcdir/$_name-${_tag#v}" || exit
  # The platform flags (-fno-rtti, the libraries to link) on the extension's compiler, which
  # ExtLibrary() has cloned before the AMBuilder adds them
  # (https://github.com/davenonymous/SMJansson/pull/15)
  patch -Np1 -i "$srcdir/smjansson-ambuilder-binary-compiler.patch"
  # The system's jansson (the version it bundles) instead of the bundled sources
  patch -Np1 -i "$srcdir/smjansson-system-jansson.patch"

  # Nothing prebuilt or bundled: the test plugin, jansson's sources and its configuration headers
  rm -r pawn/plugins jansson jansson-config
}

build() {
  # Clang, like SourceMod's builds; position-independent code, which upstream only builds for
  # x86_64, so the 32-bit library has no text relocations
  export CC=clang CXX=clang++
  CFLAGS+=" -fPIC"

  mkdir -p "$_name-${_tag#v}/build"
  cd "$_name-${_tag#v}/build" || exit
  # The build script requires the path of a jansson source to be a folder, but uses nothing in it:
  # the headers are the system's
  python ../configure.py --enable-optimize --targets=x86,x86_64 --sm-path=/usr/src/sourcemod \
    --jansson-path=/usr/include
  ambuild
}

check() {
  # The test plugin compiles against the include file and SourceMod's
  cd "$_name-${_tag#v}/build/package/addons/sourcemod/scripting" || exit
  spcomp64 -iinclude -o"$srcdir/smjansson.test.smx" smjansson.test.sp
}

package() {
  # In the addons folder of sourcemod, as it uses no SDK: the extensions (the 64-bit one in x64/),
  # the include file and the test plugin, as in upstream's package
  install -d "$pkgdir/usr/lib/sourcemod"
  cp -r --no-preserve=ownership "$srcdir/$_name-${_tag#v}/build/package/addons" "$pkgdir/usr/lib/sourcemod/"

  # The licence with the exceptions, and the GPL texts it refers to
  install -Dm644 "$srcdir/$_name-${_tag#v}/LICENSE.txt" "$srcdir/$_name-${_tag#v}"/licenses/GPLv{2,3}.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
