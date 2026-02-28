# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kguiaddons-wayland-clipboard-fix
pkgver=6.23.0
pkgrel=1
pkgdesc='Addons to QtGui - fix Wayland clipboard delay from X11 atoms'
arch=(x86_64)
url='https://invent.kde.org/frameworks/kguiaddons'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs
         glibc
         libx11
         qt6-base
         wayland)
makedepends=(doxygen
             extra-cmake-modules
             plasma-wayland-protocols
             pyside6
             python-build
             python-setuptools
             qt6-declarative
             qt6-tools
             wayland-protocols)
optdepends=('pyside6: Python bindings'
            'qt6-declarative: QML bindings')
provides=(kguiaddons=$pkgver)
conflicts=(kguiaddons)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/kguiaddons-$pkgver.tar.xz{,.sig})
sha256sums=('b9c5ad9fd8fd8aeff2ae01b1317a0dad3011e4259e50e4f2e5685fee00047b48'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB  # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D  # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1) # Nicolas Fella <nicolas.fella@kde.org>

prepare() {
  cd kguiaddons-$pkgver

  # Skip X11 selection atoms (SAVE_TARGETS, TARGETS, MULTIPLE, TIMESTAMP) in
  # Wayland clipboard data-control. These are advertised by XWayland apps but
  # cannot be served via pipe, causing 1s timeout each before real mime types
  # (like text/plain) are read. With 3+ atoms this adds 3+ seconds of delay
  # to every clipboard operation.
  for _f in src/systemclipboard/waylandclipboard.cpp src/systemclipboard/wlrwaylandclipboard.cpp; do
    sed -i '/Q_UNUSED(type);/a\
    static const QStringList x11Atoms = {QStringLiteral("SAVE_TARGETS"), QStringLiteral("TARGETS"), QStringLiteral("MULTIPLE"), QStringLiteral("TIMESTAMP")};\
    if (x11Atoms.contains(mimeType)) return QVariant();' "$_f"
  done
}

build() {
  cmake -B build -S kguiaddons-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
