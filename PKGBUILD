# Maintainer: Aspenini <aspeninifeltner@gmail.com>
pkgname=quark-downloader
pkgver=0.3.0
pkgrel=1
pkgdesc='Interactive CLI and GUI wrapper for yt-dlp'
arch=('x86_64')
url='https://github.com/Aspenini/quark-downloader'
license=('MIT')
depends=('ffmpeg' 'gc' 'hicolor-icon-theme' 'libevent' 'openssl' 'pcre2' 'tk' 'yt-dlp' 'zlib')
makedepends=('crystal' 'shards')
optdepends=(
  'deno: JavaScript runtime support for YouTube downloads'
  'nodejs: JavaScript runtime support for YouTube downloads'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  export CRYSTAL_CACHE_DIR="${srcdir}/.crystal"

  crystal build --release --no-debug src/quark-downloader.cr -o quark-downloader
  crystal build --release --no-debug src/gui/quark-downloader-gui.cr -o quark-downloader-gui
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 quark-downloader "${pkgdir}/usr/lib/${pkgname}/quark-downloader"
  install -Dm755 quark-downloader-gui "${pkgdir}/usr/lib/${pkgname}/quark-downloader-gui"
  install -Dm644 src/gui/quark-downloader-gui.tcl "${pkgdir}/usr/lib/${pkgname}/quark-downloader-gui.tcl"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/${pkgname}/quark-downloader" "${pkgdir}/usr/bin/quark-downloader"
  ln -s "../lib/${pkgname}/quark-downloader-gui" "${pkgdir}/usr/bin/quark-downloader-gui"

  install -Dm644 packaging/quark-downloader.desktop "${pkgdir}/usr/share/applications/quark-downloader.desktop"
  install -Dm644 packaging/quark-downloader-gui.desktop "${pkgdir}/usr/share/applications/quark-downloader-gui.desktop"
  install -Dm644 icons/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/quark-downloader.png"
  install -Dm644 icons/icon-cli.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/quark-downloader-cli.png"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
