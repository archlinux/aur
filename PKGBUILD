# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_plugins_pkgver=3.16
pkgname=nomacs
pkgver=3.17.2206
pkgrel=12
epoch=1
pkgdesc="A Qt image viewer"
arch=('x86_64')
url="https://nomacs.org/"
license=('GPL3')
depends=('exiv2' 'gcc-libs' 'glibc' 'libraw' 'libtiff' 'opencv' 'qt5-base'
'qt5-svg' 'quazip')
optdepends=('qt5-imageformats: support additional image formats')
makedepends=('cmake' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}-plugins-${_plugins_pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}-plugins/archive/${_plugins_pkgver}.tar.gz"
        "${pkgname}-3.17.2206-quazip-1.0.0.patch"
        )
sha512sums=('3137a64d2688abf17940fc1f6bf7a94c7a08365c67f30cc47e14dac31455e01c1cd32a58f39c2e3a83368a957a2ef619c881637dcd6ce7f25ff926b085b94b31'
            'cd72f6ddbe3e07d7ed97f08405bac7574f4f3285c81e835f5630e011c8a9b105f23d892fed8084cb35ce521aca5524db071d0edb8bb04850dd2209d9ed019747'
            '4f1d3d14d4b49967a9395ae90d6edb190d9b265275d270ad259608b4f617ac05cd9a00443a80772ab023e6119353d4645bd7c62311123cd251ee6eb0409ac4e2')
b2sums=('943126c32c3e58f2ef1d389d3114f9fc1ba7d85a15dd4490c1f39b3b521d6f792e4635cb3c8877af478815ef7ffdffbf7a4f06a5f1bad5d1a9109f6e1baafdb8'
        '2bda4f36d56709653f6696af3404e416fd2d9fe7fa11de9636643c728028018ac769df3e2e519799322c5c42006cdc114d0e6406f9f60294234b07d9fd8d8409'
        'cb76ba2dcb8bbbfea9f9fa4d2802d0cfd83791add36e2a2b714e59489a154b5d06ea061005d58c4a602c799855c2c5da435e814deaf9a3857604ab594b5578ed')

prepare() {
  cd "${pkgname}-${pkgver}"
  # find quazip >= 1.0.0 and remove versioning script call:
  # https://github.com/nomacs/nomacs/issues/566
  patch -Np1 -i ../"${pkgname}-3.17.2206-quazip-1.0.0.patch"
  # copy plugin sources into place
  cp -av "${srcdir}/${pkgname}-plugins-${_plugins_pkgver}/"* "ImageLounge/plugins"
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DUSE_SYSTEM_QUAZIP=ON \
        -DENABLE_AVIF=ON \
        -DENABLE_TRANSLATIONS=ON \
        -W no-dev \
        -B build \
        -S ./ImageLounge
  make VERBOSE=1 -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install -C build
}
