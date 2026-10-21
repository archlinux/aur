# SPDX-FileCopyrightText: 2026 Paul Woisard
# SPDX-License-Identifier: GPL-3.0-or-later
# Render with tools/packaging/prepare.py; never publish the template itself.
pkgname=galleoncore
pkgver=0.1.0
pkgrel=1
pkgdesc='Corsair Galleon Stream Deck daemon, Bosun settings, widgets and wallpapers'
arch=('x86_64' 'aarch64')
url='https://github.com/Paullux/GalleonCore'
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later' 'CC-BY-SA-4.0')
depends=('qt6-base>=6.4' 'qt6-declarative>=6.4' 'hidapi' 'systemd' 'glib2' 'xdg-utils' 'ttf-dejavu')
makedepends=('cmake' 'gcc' 'make' 'pkgconf')
checkdepends=('dbus')
optdepends=('ffmpeg: video thumbnails and screensavers' 'wireplumber: system volume' 'openrgb: dial rings')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('be2fd1703a1d2a0eac6653aacba70bf0da3ed0a43537718dd7cb1ff679ced9a4')

build() {
  cmake -S "$pkgname-$pkgver" -B build -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
    -DGALLEON_SOURCE_TREE_PATHS=OFF -DBUILD_TESTING=ON -DGALLEON_WERROR=OFF
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  sh "$pkgname-$pkgver/tools/packaging/install-extras.sh" "$pkgname-$pkgver" "$pkgdir"
}
