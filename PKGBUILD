# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anton Kudelin <kudelin at proton dot me>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
# Contributor: Brian Lam <blamm9[at]gmail[dot]com>
# Contributor: AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor: Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>
pkgname=ovito
pkgver=3.10.1
pkgrel=2
pkgdesc="Open Visualization Tool"
url="https://www.${pkgname}.org"
arch=(x86_64 aarch64)
license=(GPL)
depends=(netcdf-openmpi ffmpeg qt6-base)
makedepends=(cmake boost qscintilla-qt6 qt6-svg libxslt python-sphinx_rtd_theme)
conflicts=($pkgname-git)
source=(https://gitlab.com/stuko/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2
  ${url}/wp-content/uploads/logo_rgb-768x737.png
  ${pkgname}.desktop)
sha512sums=('5e04ed9ac5d3adc77ba11ce416ae7facbcff02ec675712782eb19192eed84567ae880d6038a59b7ace69ceb239591eade065bf5facdf5d07473a2d9c02a6b0a9'
  '1afe91e9634a6574ba58535cb9b636b63daa02d9157f50d9c5c959c9da151e9635ca73d0616fd8ccac2e7742f2289a6eba05e62b206baee4f738c53526ec4bb8'
  'ba7bc11314a2f55f216b91dc15e981e65063d44e8eac05481aaf98979f1ebee0769f3c4ab99c6d51216d70ec4b5ef863e47c91758a154fb97249e9b2e1ebbc0a')

build() {
  cmake -S ${pkgname}-v${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DOVITO_BUILD_DOCUMENTATION=ON \
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
