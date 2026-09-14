# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: asyync1024 <async1024 at proton dot me>

_name="jsoncpp"
pkgname="lib32-$_name"
pkgver=1.9.8
pkgrel=1
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
sha512sums=('849957d9c87edc1d375698a9ea2709b7304cabc2b05ba180dc09f68653e32316e1ae4fe0108ab63ec7b56d255ccbc6ccf8715cf8396c1438edda775bec74b05b')
b2sums=('5af250cf6d641cc7d8c4897222cc97ccdcf110db0858abf11656835e91eb1976ee82c2cdf26e0b244aa914e2b2d8ca796a9642419f6d567bbd234a6b02bf82ff')

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
