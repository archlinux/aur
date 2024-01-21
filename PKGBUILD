# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=opencl-caps-viewer
pkgver=1.20
pkgrel=2
pkgdesc="OpenCL Hardware Capability Viewer"
arch=("x86_64")
depends=("opencl-icd-loader" "qt5-x11extras")
url="https://opencl.gpuinfo.org/"
makedepends=('git')
license=("GPL-2.0-or-later")

source=("git+https://github.com/SaschaWillems/OpenCLCapsViewer.git#tag=${pkgver}"
        "git+https://github.com/KhronosGroup/OpenCL-Headers.git")

sha256sums=("SKIP"
            "SKIP")

prepare() {
  cd "$srcdir/OpenCLCapsViewer"
  git submodule init
  git config submodule.OpenCL-Headers.url "$srcdir/OpenCL-Headers"
  git -c protocol.file.allow=always submodule update

  # Correct binary install path
  sed -i 's|target.path = /opt/$${TARGET}/bin|target.path = /usr/bin|g' OpenCLCapsViewer.pro
}

build() {
  cd "$srcdir/OpenCLCapsViewer"
  qmake-qt5 OpenCLCapsViewer.pro \
    DEFINES+=X11 \
    CONFIG+=release \
    PREFIX=/usr
  make
}

package() {
  cd "$srcdir/OpenCLCapsViewer"
  make INSTALL_ROOT="$pkgdir/" install
  install -m644 Resources/icon.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/openclCapsViewer.png
}
