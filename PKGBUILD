# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: asyync1024 <async1024 at proton dot me>

_name="jsoncpp"
pkgname="lib32-$_name"
pkgver=1.9.6
pkgrel=2
pkgdesc="C++ library for interacting with JSON (32-bit)"
arch=('x86_64')
url="https://github.com/open-source-parsers/$_name"
license=('MIT' 'custom:Public_Domain')
depends=("${_name}>=${pkgver}" 'lib32-gcc-libs' 'lib32-glibc')
makedepends=(
  'meson'
  # 'python'
)
provides=("lib${_name}.so")
options=('staticlibs')
_pkgsrc="${url##*/}-${pkgver}"
source=("${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz")
sha512sums=('006d81f9f723dcfe875ebc2147449c07c5246bf97dd7b9eee1909decc914b051d6f3f06feb5c3dfa143d28773fb310aabb04a81dc447cc61513309df8eba8b08')
b2sums=('efa5dea68ddc175391200077666204f7ec66cd1f96a889a2a3c53d0e22e1f96ead1a2e7a871940f60dbd4261650f133b83de428b9c8b663fa13bd7ab4b9fdffe')

prepare() {
  cd "$srcdir/$_pkgsrc"
  echo "$pkgver" > version
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "$srcdir"
  arch-meson "$_pkgsrc" "$_pkgsrc/build-shared" --default-library shared --cross-file lib32
  meson compile -C "$_pkgsrc/build-shared"

  export CXXFLAGS+=" -ffat-lto-objects"
  arch-meson "$_pkgsrc" "$_pkgsrc/build-static" --default-library static --cross-file lib32
  meson compile -C "$_pkgsrc/build-static"
}

check() {
  cd "${srcdir}"
  meson test -C "$_pkgsrc/build-shared" --print-errorlogs

  # cd "${_pkgsrc}/test"
  # python runjsontests.py ../build/jsontestrunner
  # python rununittests.py ../build/jsoncpp_test
}

package() {
  cd "$srcdir"
  meson install -C "$_pkgsrc/build-shared" --destdir "$pkgdir"
  meson install -C "$_pkgsrc/build-static" --destdir "$pkgdir"

  cd "$pkgdir/usr"
  rm -rf "bin" "include" "share"

  cd "lib32"
  # Remove broken cmake config https://github.com/open-source-parsers/jsoncpp/issues/1568
  rm -rf "cmake"
  cd "$srcdir/$_pkgsrc"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
