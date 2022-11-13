# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Maintainer:  chn <g897331845@gmail.com>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
# Contributor: Brian Lam <blamm9[at]gmail[dot]com>
# Contributor: AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor: Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>

pkgname=ovito
pkgver=3.7.11
pkgrel=1
pkgdesc="Open Visualization Tool"
url="https://www.ovito.org"
arch=('x86_64')
license=('GPL')
depends=('netcdf' 'ffmpeg' 'qt6-base')
makedepends=('cmake' 'boost' 'qscintilla-qt6' 'qt6-svg' 'libxslt' 'git'
             'python-sphinx_rtd_theme' 'vulkan-icd-loader' 'vulkan-headers')
conflicts=("$pkgname-git")
source=("https://gitlab.com/stuko/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2"
        "https://www.ovito.org/wp-content/uploads/logo_rgb-768x737.png"
        "ovito.desktop")
sha256sums=('6d685d1b6b1a128c7b2054f9427f1251c7297a3d7d22bef974e154bd09a8b701'
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
      -DOVITO_QT_MAJOR_VERSION=Qt6 \
      -DOVITO_BUILD_PLUGIN_VULKAN=ON \
      -DVulkan_INCLUDE_DIR=/usr/include
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  install -m644 "${srcdir}/logo_rgb-768x737.png" "${pkgdir}/usr/share/pixmaps/ovito.png"
  mkdir -p "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/ovito.desktop" "${pkgdir}/usr/share/applications/"
}
