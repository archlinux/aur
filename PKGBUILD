# Maintainer: Corey Powell (mistdragon100@gmail.com)
# Swiped from the official libyaml package and modified for mingw-w64
pkgname=mingw-w64-libyaml
pkgver=0.1.6
pkgrel=1
pkgdesc="YAML 1.1 library (mingw-w64)"
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
url="http://pyyaml.org/wiki/LibYAML"
license=('MIT')
source=(http://pyyaml.org/download/libyaml/yaml-${pkgver}.tar.gz)
md5sums=('5fe00cda18ca5daeb43762b80c38e06e')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_config="mingw"
build() {
  cd "${srcdir}/yaml-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    cp -R ${srcdir}/yaml-${pkgver} ${srcdir}/yaml-${pkgver}-${_arch}
    cd ${srcdir}/yaml-${pkgver}-${_arch}
    #Finally compile
    ./configure \
      --prefix=/usr/${_arch} --host=${_arch} \
      CFLAGS="-DYAML_DECLARE_STATIC" --enable-static --disable-shared
    make all
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/yaml-${pkgver}-${_arch}"
    make DESTDIR="${pkgdir}" install
    #make DESTDIR="${pkgdir}" install
    install -m644 -D LICENSE "${pkgdir}/usr/${_arch}/share/licenses/${pkgname}/LICENSE"
  done
}
