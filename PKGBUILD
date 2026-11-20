# Maintainer: @aardbol
pkgname=video-downloader-mygo-bin
_pkgname=video-downloader
pkgver=3.3.0
pkgrel=1
pkgdesc='Native video downloader with queue, built with Go, MyGo, yt-dlp and FFmpeg'
arch=('x86_64' 'aarch64')
url='https://github.com/fazi-gondal/video-downloader-mygo'
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
  'zlib'
  'gtk3'
  'webkit2gtk-4.1'
  'hicolor-icon-theme'
)
optdepends=(
  'deno: JavaScript runtime for some yt-dlp YouTube challenge flows'
  'xdg-desktop-portal: desktop integration'
)
conflicts=('video-downloader' 'video-downloader-git')
options=('!debug' '!strip')
source=("LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
sha256sums=('6343be74bc7c2e695fd937106bc40a6417da892589dcf230bd2acc0fb2885da7')
sha256sums_x86_64=('6596ef3e48a808ba1580ce2cee7855028d7ef4385873da14b8c764da626a7790')
sha256sums_aarch64=('f7f7d117b15475516b30bc2bd9ede992520815480ebc5ba1a781576aad08f56d')

package() {
  # Keep the app tree intact in /opt: the binary resolves its bundled
  # ffmpeg/ffprobe/yt-dlp and the .mygo-files manifest relative to itself.
  local appdir="$pkgdir/opt/${pkgname%-bin}"
  install -d "$appdir"
  cp -a "$srcdir/bin" "$appdir/"
  install -Dm755 "$srcdir/${_pkgname}" "$appdir/${_pkgname}"
  install -Dm644 "$srcdir/.mygo-files" "$appdir/.mygo-files"
  install -Dm644 "$srcdir/README.md" "$appdir/README.md"
  install -Dm644 "$srcdir/${_pkgname}.desktop" "$appdir/${_pkgname}.desktop"
  local png
  for png in "$srcdir"/*.png; do
    install -Dm644 "$png" "$appdir/$(basename "$png")"
  done

  install -Dm644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "$srcdir/${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-bin}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
