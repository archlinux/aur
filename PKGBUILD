# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=bento4
pkgver=1.4.3.608
_pkgverstr=1.4.3-608
pkgrel=1
pkgdesc="C++ class library and tools designed to read and write ISO-MP4 files"
arch=('i686' 'x86_64')
url="https://www.bento4.com/"
license=('GPL')
makedepends=('cmake')
optdepends=('python')
source=("https://github.com/axiomatic-systems/Bento4/archive/v${_pkgverstr}.tar.gz")
sha256sums=('f3e2ae92eb7b1d09e3ae1bfc02a1ab546207bc11033e9e7d6c7a46db53b9a4ca')
_config="Release"
if [[ $CARCH == "i686" ]]; then
  _arch="x86"
else
  _arch=$CARCH
fi

build() {
  cd "${srcdir}/Bento4-${_pkgverstr}/Build/Targets/$_arch-unknown-linux/"
  sed -i "6s/.*/AP4_BUILD_CONFIG = $_config/" ../../Makefiles/Bootstrap.mak
  make sdk AP4_BUILD_CONFIG=$_config
  # make shared library manually
  cd "${srcdir}/Bento4-${_pkgverstr}/Build/Targets/$_arch-unknown-linux/$_config/SDK/lib"
  mkdir shared
  cd shared
  ar x ../libAP4.a
  g++ -shared -Wl,-soname,libAP4.so.$pkgver -o libAP4.so.$pkgver *.o
}

package() {
  cd "${srcdir}/Bento4-${_pkgverstr}/Build/Targets/$_arch-unknown-linux/$_config/SDK"
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/include/$pkgname/"
  pushd ./bin
  for file in *; do
    # prefix binaries with "bento4-" to avoid conflicts
    install -m755 -D "./$file" "$pkgdir/usr/bin/bento4-$file"
  done
  popd
  install -m644 -D ./lib/*.a "$pkgdir/usr/lib/" # static lib is usually removed anyways
  install -m644 -D ./lib/shared/*.so.* "$pkgdir/usr/lib/"
  install -m644 -D ./include/*.h "$pkgdir/usr/include/$pkgname/"
  cd "$pkgdir/usr/lib/"
  ln -s libAP4.so.$pkgver libAP4.so
}
