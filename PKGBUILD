# Maintainer: Simon Repp <simon@fdpl.io>

arch=('i686' 'x86_64')
conflicts=('ommpfritt')
depends=('kitemmodels' 'lib2geom-git' 'poppler-qt5' 'python' 'qt5-base' 'qt5-svg')
license=('GPL3')
makedepends=('cmake' 'git' 'pybind11' 'qt5-imageformats' 'qt5-tools' 'qt5-translations')
md5sums=(
  '39e4dba5aa7eff71507a96c49457edcc'
  'SKIP'
)
pkgdesc="Semantic, procedural, non-destructive vector modelling"
pkgname=ommpfritt-git
pkgrel=1
pkgver=0.1.4.r74.gf8a066a5
provides=('ommpfritt')
source=(
  ommpfritt.desktop
  "ommpfritt::git+https://github.com/pasbi/ommpfritt.git"
)
url="https://github.com/pasbi/ommpfritt"

build() {
  cd "${srcdir}"
  rm -rf ommpfritt-build
  mkdir ommpfritt-build
  # Configure (without icons present)
  cmake -S ommpfritt \
        -B ommpfritt-build \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${srcdir}"/ommpfritt-install \
        -DCMAKE_PREFIX_PATH="${QT_PREFIX}"
  # Build and install locally (without icons present)
  cmake --build ommpfritt-build \
        --config Release \
        --target install \
        -j2
  # Use local installation to generate icons
  cmake --build ommpfritt-build \
        --target icons
  # Configure again (with icons present)
  cmake -S ommpfritt \
        -B ommpfritt-build \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${srcdir}"/ommpfritt-install \
        -DCMAKE_PREFIX_PATH="${QT_PREFIX}"
  # Build again, without installing (with icons present)
  cmake --build ommpfritt-build \
        --config Release \
        -j2
}

package() {
  cd "${srcdir}"
  install -Dm644 ommpfritt.desktop "${pkgdir}"/usr/share/applications/ommpfritt.desktop

  cd "${srcdir}"/ommpfritt-build
  install -Dm755 ommpfritt "${pkgdir}"/usr/bin/ommpfritt
}

pkgver() {
    cd ommpfritt
    git describe --exclude continuous --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
