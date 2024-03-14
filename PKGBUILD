# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anton Kudelin <kudelin at proton dot me>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
# Contributor: Brian Lam <blamm9[at]gmail[dot]com>
# Contributor: AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor: Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>
pkgname=ovito
pkgver=3.10.4
pkgrel=1
pkgdesc="Open Visualization Tool"
url="https://www.${pkgname}.org"
arch=(x86_64 aarch64)
license=(GPL-3.0-or-later)
depends=(netcdf-openmpi ffmpeg qt6-base openssh)
makedepends=(cmake boost qscintilla-qt6 qt6-svg libxslt python-sphinx_rtd_theme)
conflicts=($pkgname-git)
source=(https://gitlab.com/stuko/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2
  ${url}/wp-content/uploads/logo_rgb-768x737.png
  ${pkgname}.desktop)
sha512sums=('942109ea031cdfb1412d31a5c39eb6079ab6ff58df2e3e5720df9345d04c479e3d921bc031e6008f9c8ac0f9555feba22ddb8e329f43bc06ce0266a6df7783eb'
  '1afe91e9634a6574ba58535cb9b636b63daa02d9157f50d9c5c959c9da151e9635ca73d0616fd8ccac2e7742f2289a6eba05e62b206baee4f738c53526ec4bb8'
  'fdf21d1821855b1ea93c598ef062669c29c15975a288f72240c183b8f10e8b6d38f96b15fdf02949d66bd94f76df0daed87e9c4d2201db61d4c2750be574e8cd')

build() {
  cmake -S ${pkgname}-v${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DOVITO_BUILD_DOCUMENTATION=ON \
    -DOVITO_BUILD_SSH_CLIENT=ON \
    -DOVITO_BUILD_PLUGIN_VULKAN=OFF

  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install

  install -Dm644 "$srcdir/logo_rgb-768x737.png" \
    "$pkgdir/usr/share/pixmaps/ovito.png"
  install -Dm644 "$srcdir/ovito.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -Dm644 ${pkgname}-v${pkgver}/LICENSE.GPL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
