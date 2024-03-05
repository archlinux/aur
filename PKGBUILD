# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('opencl-caps-viewer-x11' 'opencl-caps-viewer-wayland')
pkgbase=opencl-caps-viewer
pkgver=1.20
pkgrel=3
pkgdesc="OpenCL Hardware Capability Viewer"
arch=('x86_64')
url="https://opencl.gpuinfo.org/"
license=('GPL-2.0-or-later')
makedepends=('git' 'opencl-icd-loader' 'qt5-wayland' 'qt5-x11extras')
_commit=fd813b28108521d6d6f530d9b65fb38a89926984  # tags/1.20^0
source=("git+https://github.com/SaschaWillems/OpenCLCapsViewer.git#commit=${_commit}"
        'git+https://github.com/KhronosGroup/OpenCL-Headers.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd OpenCLCapsViewer
  git describe --tags | sed 's/_fixed//;s/-/+/g'
}

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
  qmake-qt5 ../OpenCLCapsViewer.pro \
    DEFINES+=X11 \
    CONFIG+=release \
    PREFIX=/usr
  make
  popd

  # Wayland
  pushd build-wayland
  qmake-qt5 ../OpenCLCapsViewer.pro \
    DEFINES+=WAYLAND \
    CONFIG+=release \
    PREFIX=/usr
  make
  popd
}

package_opencl-caps-viewer-x11() {
  pkgdesc+=" (X11)"
  depends=('opencl-icd-loader' 'qt5-x11extras')
  provides=('opencl-caps-viewer')
  conflicts=('opencl-caps-viewer')

  cd OpenCLCapsViewer/build-x11
  make INSTALL_ROOT="$pkgdir/" install
  install -m644 ../Resources/icon.png \
    "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/openclCapsViewer.png
}

package_opencl-caps-viewer-wayland() {
  pkgdesc+=" (Wayland)"
  depends=('opencl-icd-loader' 'qt5-wayland')
  provides=('opencl-caps-viewer')
  conflicts=('opencl-caps-viewer')

  cd OpenCLCapsViewer/build-wayland
  make INSTALL_ROOT="$pkgdir/" install
  install -m644 ../Resources/icon.png \
    "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/openclCapsViewer.png
}
