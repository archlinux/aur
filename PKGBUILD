# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sourcemod-smjansson
_name=SMJansson
# Upstream's tags are jansson's version and a release of SMJansson for it (v2.15.1-1)
pkgver=2.15.1.1
pkgrel=3
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
  smjansson-system-jansson.patch
  smjansson-test-deherit-unused.patch
  smjansson-packagescript-always-copy.patch)
sha512sums=('121574e7c7a6c6853bafb1de08761f72dcaad978ff30a3677c4203f7860c5f9ca1d2fa93fa7667879b920019b71c3d0f87f0b3b1cb95dfb4145c86fa29304b53'
  'fd859673e30df5e814e4664f36fccac4f8487d9e7041856786236dc6e025d799dd3c263e39d49bd0dfe117ea2a741b0ab34d0fae46da6181b585fc9a2479407b'
  'dfb236544358669a9b7216d0db32580810d05daafeb8e6b0e6ff78e0ba60da486d422c0295ffa1e90988df337fa6ed7769e1513832f04948cfac706ad972c497'
  '0678ef0fca6f783caeeaf39fdd6d8dbd77ed3b67e05b7ebf73ec81793da88bfd18004e5d3a652217d0dc8d4014dcf08285a9df5950bd8e5ecf01cb4b36cd325c'
  'a5d5ff87ee4201a185f6215246d0e376e746bd882902dcac451dffb7fe84d92f300d524f59394e3110d2a4db7f31bac93109211cbc1ad8872b21f327aaeba045')
b2sums=('9bbd71b5c3e6e99e22c29fd3e80ee130e43a670249a5dbdadc836f4f6603f3c0dc1af397bc7f43309f9ff5c63ce5798be3bc22127c61a97f99dc86b9c94eb959'
  '0dd35a75297218cdfa9d5076a39c0d19ce2a917fe0debf95837dad527197478bf2b2a89907cded625e1c568631e91922509042a6749180add752543785f67c5b'
  '1dbdd36f30e909220e1dfaf177e3f1e63ef32cd7a1620df2efdfada3c11daf92677d3bf2373d437e248449df4ff676ab3d105db17f19768e3646063c857e92d5'
  '4e3257dfad08eaddb6b01c887f03bdc15bf82971ffcbb53f8340b24805b7333763816c4f4b310b6316834697bfe04a5ed1355409016ace575cea1a220e6b51d0'
  '9ad7d3aee5a183aedeedec40bd578caeb7ef58e043147a61acd989cd7d7c539f4fea2d1c0ad77c181fa81d235b723e0db9dc12a4cc80627d8d4db02637be1ae2')

prepare() {
  cd "$srcdir/$_name-${_tag#v}" || exit
  # The platform flags (-fno-rtti, the libraries to link) on the extension's compiler, which
  # ExtLibrary() has cloned before the AMBuilder adds them, merged upstream after v2.15.1-1
  # (https://github.com/davenonymous/SMJansson/pull/15)
  patch -Np1 -i "$srcdir/smjansson-ambuilder-binary-compiler.patch"
  # Test_Deherit()'s parameter marked as unused, so the test plugin compiles without warnings,
  # merged upstream after v2.15.1-1 (https://github.com/davenonymous/SMJansson/pull/16)
  patch -Np1 -i "$srcdir/smjansson-test-deherit-unused.patch"
  # --system-jansson, which links the installed jansson instead of building the bundled one
  # (https://github.com/davenonymous/SMJansson/pull/18)
  patch -Np1 -i "$srcdir/smjansson-system-jansson.patch"
  # The scripting files copied again when the build is configured again, as in a build without -C,
  # instead of removed (https://github.com/davenonymous/SMJansson/pull/19)
  patch -Np1 -i "$srcdir/smjansson-packagescript-always-copy.patch"

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
  # The system's jansson (2.15.1, the version it bundles)
  python ../configure.py --enable-optimize --targets=x86,x86_64 --sm-path=/usr/src/sourcemod \
    --system-jansson
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
