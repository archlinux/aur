# Maintainer: P6g9YHK6 <https://github.com/P6g9YHK6>
pkgname=openpilot-cabana
_pkgname=openpilot-cabana
pkgver=1.1.2.38.gc70419f
pkgrel=1
epoch=1
pkgdesc="CAN Bus Visualizer & Analyzer - Qt-based graphical tool for viewing, analyzing, and reverse-engineering raw CAN bus data"
arch=('x86_64')
url="https://github.com/deanlee/openpilot-cabana"
license=('MIT')
depends=(
  'capnproto'
  'zeromq'
  'curl'
  'openssl'
  'bzip2'
  'ffmpeg'
  'libxkbcommon'
  'libxcb'
  'libx11'
  'libglvnd'
  'ocl-icd'
  'qt6-base'
  'qt6-svg'
  'qt6-tools'
  'qt6-charts'
  'qt6-serialbus'
  'libusb'
  'zstd'
  'python'
  'python-numpy'
)
makedepends=('python-pip' 'git' 'cython' 'scons' 'clang')
provides=('cabana')
options=(!lto)

source=("git+https://github.com/deanlee/openpilot-cabana.git#commit=c70419f068a108f1775afe5af8796c4ff1287720"
        "archlinux.patch"
        "cabana.desktop"
        "cabana-icon.svg")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
  patch -p1 -i "$srcdir/archlinux.patch"
}

build() {
  cd "$_pkgname"
  python -m venv build_venv
  source build_venv/bin/activate
  pip install scons numpy cython setuptools pycapnp
  scons --cache-disable
}

package() {
  cd "$_pkgname"
  install -Dm755 cabana "$pkgdir/usr/bin/cabana"
  install -dm755 "$pkgdir/usr/share/cabana"
  cp -r data assets "$pkgdir/usr/share/cabana/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../../cabana.desktop "$pkgdir/usr/share/applications/cabana.desktop"
  install -Dm644 ../../cabana-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cabana.svg"
}
