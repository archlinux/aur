# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com.
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_name="libmpcdec"
pkgname="lib32-${_name}"
_revision=475
pkgver="0.1+r${_revision}"
pkgrel=5
epoch=1
_rel=475
pkgdesc="Musepack decoding library (32 bit)"
arch=('x86_64')
url="https://musepack.net"
license=('BSD-3-Clause')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('lib32-gcc-libs')
provides=("${_name}.so")
_pkgsrc="musepack_src_r${_revision}"
source=("${_pkgsrc}.tar.gz::https://files.musepack.net/source/${_pkgsrc}.tar.gz"
        '01_am-maintainer-mode.patch'
        '02_link-libm.patch'
        '03_mpcchap.patch'
        '04_link-order.patch'
        '05_visibility.patch'
        '1001_missing_extern_kw.patch'
        'add_subdir-objects.patch')
b2sums=('601762738199bd67278d934d927c35d6ba1d286be9fd57ebf2e89dca271f563e85cf023f8860bfd30b501039bba5fd68eaf2d65dce65d0dcf5ce6d75a6e692aa'
        '940b71df9e4d582a0da733174048168aacd1f80c69d9cf2f163545cf1cdd83165eca5c18597c4f271c52f55b8085f69079a9df4e3fee3875d2853062afbbb1cd'
        '65a3b3c2fd6e265d88075834f8d479fc40c0bf11d674c4d2ffce12b595460327bcf33931ae7c16a5b78273de10e962144764e950f2cb0ae74ece01b892526456'
        '9c10c33bcf991facf959d41a4f24a32162631db26d2aa33e969e7d1884094cef39103bcd9d0422af2d29ca1f5963cd8d91137ffcdbb31f36c221a2c4d74715ef'
        'a5c96c5a80d76cbbb25a5647c6d754d82203936949f2720772776267f6752811f2c511e8df59a58570bba9ffe3b9482b0294eeed4364e2a4602a15d142759add'
        'e96e7928ad05bc0713ede3fbc8b5053cf1a456067faa481fa17f5156d61f6c1052b47ff27fe0e7e70d4e40fd62fae9cd0c57c5e28b149501a37dc323031a8bb5'
        '5204b8b9596ef5663f7678cdd533a227df9722f3d66f66ea9fe151a76de6070e3801f51be657588cb14839239d6d2ed8c5a5f7e80a61f79a1eda22b72026658a'
        '366e7a668d9c47be947b3ae785db7e0804d3d3537aa5df4c833386e8b04fc98f3c4dc1f32a0beaabf7721deae853ad6bce9acd7bae1ad1621dae1bb908a200c2')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/01_am-maintainer-mode.patch"
  patch -Np1 -i "${srcdir}/02_link-libm.patch"
  patch -Np1 -i "${srcdir}/03_mpcchap.patch"
  patch -Np1 -i "${srcdir}/04_link-order.patch"
  patch -Np1 -i "${srcdir}/05_visibility.patch"
  patch -Np1 -i "${srcdir}/1001_missing_extern_kw.patch"
  patch -Np1 -i "${srcdir}/add_subdir-objects.patch"
}

build() {
  export CFLAGS+=" -m32 -Wno-error=incompatible-pointer-types"
  export CXXFLAGS+=" -m32 -Wno-error=incompatible-pointer-types"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --disable-mpcchap
  make -C "${_name}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make -C "${_name}" DESTDIR="${pkgdir}" install
}
