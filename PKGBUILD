# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Maintainer:  chn <g897331845@gmail.com>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
# Contributor: Brian Lam <blamm9[at]gmail[dot]com>
# Contributor: AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor: Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>

pkgname=ovito
pkgver=3.8.5
pkgrel=1
pkgdesc="Open Visualization Tool"
url="https://www.ovito.org"
arch=(x86_64 aarch64)
license=(GPL)
depends=(netcdf ffmpeg qt6-base)
makedepends=(cmake boost qscintilla-qt6 qt6-svg libxslt git
             python-sphinx_rtd_theme vulkan-icd-loader vulkan-headers)
conflicts=($pkgname-git)
source=(https://gitlab.com/stuko/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2
        https://www.ovito.org/wp-content/uploads/logo_rgb-768x737.png
        ovito.desktop)
sha256sums=('37010701500f02ceed82f2fecdcbe6e524fbed5834103b2644b8ddeecc18a867'
            '14e98851e5de9bee0c8dabd035a83450895c476c1ad9e9898e2bf0c68261e9f2'
            '09b16de717b1b4140678d17958dcee2ea96ff5ae3a1c75f3168a0ad17f62f4ea')

build() {
  cd "$srcdir"
  cmake -B build -S $pkgname-v$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DOVITO_BUILD_DOCUMENTATION=ON \
    -DOVITO_BUILD_PLUGIN_VULKAN=ON \
    -DVulkan_INCLUDE_DIR=/usr/include
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/logo_rgb-768x737.png" \
    "$pkgdir/usr/share/pixmaps/ovito.png"
  install -Dm644 "$srcdir/ovito.desktop" -t \
    "$pkgdir/usr/share/applications/"
}
