# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# Contributor: Raziel23 <venom23 at runbox dot com>

pkgname=vcmi
pkgver=0.99
pkgrel=4
pkgdesc="Open-source engine for Heroes of Might and Magic III"
arch=('i686' 'x86_64')
url="http://vcmi.eu"
license=('GPL2')
depends=('boost-libs' 'ffmpeg' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'qt5-base' 'libxkbcommon-x11'
         'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('boost' 'cmake')
optdepends=('innoextract: required by vcmibuilder'
            'unshield: required by vcmibuilder'
            'unzip: required by vcmibuilder')
conflicts=('fuzzylite')
install="${pkgname}.install"
source=(https://github.com/vcmi/${pkgname}/archive/${pkgver}.tar.gz
        0001-Launcher-add-sanity-checks-for-QDir-removeRecursivel.patch
        boostasiofix.patch)
sha256sums=('b7f2459d7e054c8bdcf419cbb80040e751d3dbb06dc1113ac28f7365930f902e'
            'fefca8818a11bc753a9dfd828fc1e3f6f64d104713e64fa76088c3ce05f60143'
            'e270050db24c2cd717c490d9d121b43d19574fd92345105374f3bc1c8386ea35')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/0001-Launcher-add-sanity-checks-for-QDir-removeRecursivel.patch"
  patch -p1 -l -i "${srcdir}/boostasiofix.patch"
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DCMAKE_SKIP_RPATH='FALSE' \
    -DFORCE_BUNDLED_FL='ON' \
    -DCMAKE_BUILD_TYPE='Release'
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
