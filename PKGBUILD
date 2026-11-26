# Maintainer: Michal Skorupka <michal@skorupka.me>
pkgname=superfar
pkgver=0.9.7
pkgrel=1
pkgdesc="Dual-pane file manager: Directory Opus workflow, Thunar weight, FAR-style function keys"
arch=('x86_64' 'aarch64')
url="https://github.com/crustovsky/superfar"
license=('MIT')
depends=('qt6-base' 'glib2' 'glycin' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'pkgconf')
optdepends=('gvfs: trash, mounts, network shares, administrator access'
            'libarchive: open archives as folders, pack into them'
            'tumbler: thumbnails and media previews'
            'poppler: PDF pages in the preview'
            'ffmpeg: video playback in the preview'
            'bat: syntax colours in the viewer and the preview'
            'xdg-terminal-exec: F4 and the command line in your terminal')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a291d253d14deaf9c68924932bb3385b0a2ab2a8c80786459e26b118b71abfb')

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  # Natural sort follows the locale; a C locale sorts by byte value.
  LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
