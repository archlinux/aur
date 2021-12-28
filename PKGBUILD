# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Maintainer:  chn <g897331845@gmail.com>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
# Contributor: Brian Lam <blamm9[at]gmail[dot]com>
# Contributor: AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor: Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>

pkgname=ovito
pkgver=3.6.0
pkgrel=1
pkgdesc="Open Visualization Tool"
url="http://www.ovito.org"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'python' 'netcdf' 'ffmpeg' 'qt5-base')
makedepends=('cmake' 'boost' 'qscintilla-qt5' 'qt5-svg' 'libxslt' 'git'
             'python-sphinx_rtd_theme')
conflicts=("$pkgname-git")
source=("https://gitlab.com/stuko/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2"
        "https://www.ovito.org/wp-content/uploads/logo_rgb-768x737.png"
        "ovito.desktop")
sha256sums=('506ce49202433707e20a5aa335a654b6a26486a2ce954e7572950e82a7388727'
            '14e98851e5de9bee0c8dabd035a83450895c476c1ad9e9898e2bf0c68261e9f2'
            '09b16de717b1b4140678d17958dcee2ea96ff5ae3a1c75f3168a0ad17f62f4ea')

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-v$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DOpenGL_GL_PREFERENCE=GLVND \
      -DOVITO_BUILD_DOCUMENTATION=ON \
      -DOVITO_QT_MAJOR_VERSION=Qt5 \
      -DOVITO_BUILD_PLUGIN_VULKAN=ON
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  install -m644 "${srcdir}/logo_rgb-768x737.png" "${pkgdir}/usr/share/pixmaps/ovito.png"
  mkdir -p "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/ovito.desktop" "${pkgdir}/usr/share/applications/"
}
