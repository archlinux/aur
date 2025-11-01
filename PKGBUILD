# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('opencl-caps-viewer-x11' 'opencl-caps-viewer-wayland')
pkgbase=opencl-caps-viewer
pkgver=1.30
pkgrel=1
pkgdesc="OpenCL Hardware Capability Viewer"
arch=('x86_64')
url="https://opencl.gpuinfo.org/"
license=('GPL-2.0-or-later')
depends=(
  'hicolor-icon-theme'
  'opencl-icd-loader'
  'qt6-base'
)
makedepends=('git')
source=("git+https://github.com/SaschaWillems/OpenCLCapsViewer.git#tag=$pkgver"
        'git+https://github.com/KhronosGroup/OpenCL-Headers.git')
sha256sums=('ef0f857ada1312c641c3b9fc61bdd6dc7f079fb902fb9d7717ac6f90a3e7c288'
            'SKIP')

prepare() {
  cd OpenCLCapsViewer
  git submodule init
  git config submodule.OpenCL-Headers.url "$srcdir/OpenCL-Headers"
  git -c protocol.file.allow=always submodule update

  # Correct binary install path
  sed -i 's|target.path = /opt/$${TARGET}/bin|target.path = /usr/bin|g' OpenCLCapsViewer.pro

  # Create build directories
  mkdir -p build-x11 build-wayland
}

build() {
  cd OpenCLCapsViewer

  # X11
  pushd build-x11
  qmake6 ../OpenCLCapsViewer.pro \
    DEFINES+=X11 \
    CONFIG+=release \
    PREFIX=/usr
  make
  popd

  # Wayland
  pushd build-wayland
  qmake6 ../OpenCLCapsViewer.pro \
    DEFINES+=WAYLAND \
    CONFIG+=release \
    PREFIX=/usr
  make
  popd
}

package_opencl-caps-viewer-x11() {
  pkgdesc+=" (X11)"
  provides=('opencl-caps-viewer')
  conflicts=('opencl-caps-viewer')

  cd OpenCLCapsViewer/build-x11
  make INSTALL_ROOT="$pkgdir/" install

  install -m644 ../Resources/icon.png \
    "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/openclCapsViewer.png
}

package_opencl-caps-viewer-wayland() {
  pkgdesc+=" (Wayland)"
  provides=('opencl-caps-viewer')
  conflicts=('opencl-caps-viewer')

  cd OpenCLCapsViewer/build-wayland
  make INSTALL_ROOT="$pkgdir/" install

  install -m644 ../Resources/icon.png \
    "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/openclCapsViewer.png
}
