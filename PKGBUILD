# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=prusa-slicer
pkgname=(prusa-slicer slicer-udev)
pkgver=2.6.1
pkgrel=1
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=('x86_64')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL3')
depends=('gtk3')
makedepends=('cmake' 'systemd' 'glu' 'ninja' 'git')
options=('!makeflags')
source=(https://github.com/prusa3d/PrusaSlicer/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('516eb34835cd8f301e639fa77f9f12297300ce012ebc3b7b6a73275c6245011d')

build() {
  cd PrusaSlicer-version_${pkgver}

  # This is super ugly right now: We're using 100% vendored deps but upstream
  # won't provide any support if we use system deps. We think this is dirty but
  # it's really not worth the fight. There were multiple bugs when we didn't
  # use their vendored deps.
  cd deps
  cmake \
      -G Ninja \
      -B build \
      -DDEP_WX_GTK3=ON
  ninja -C build
  cd ..

  mkdir build
  cd build
  cmake .. \
      -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_PREFIX_PATH=$(pwd)/../deps/build/destdir/usr/local \
      -DSLIC3R_STATIC=1 \
      -DSLIC3R_FHS=ON \
      -DSLIC3R_PCH=OFF \
      -DSLIC3R_GTK=3
  ninja
}

check() {
  cd PrusaSlicer-version_${pkgver}/build

  ctest -v
}

package_prusa-slicer() {
  optdepends=('slicer-udev: 3D printer connection rules')

  cd PrusaSlicer-version_${pkgver}
  DESTDIR="$pkgdir" ninja -C build install

  # Desktop icons
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer.svg
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer-gcodeviewer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer-gcodeviewer.svg

  # Split udev rule
  mv "${pkgdir}"/usr/lib/udev/ "$srcdir"
}

package_slicer-udev() {
  depends=() # Reset dependencies

  install -d "${pkgdir}"/usr/lib/
  mv udev "${pkgdir}"/usr/lib/
}
