pkgname=paintdotjs-bin
pkgver=2.1.3
pkgrel=1
pkgdesc='A desktop port of Paint.NET for Linux and macOS'
arch=('x86_64')
url='https://paintjs.net/'
license=('MIT')
depends=('fuse2' 'gtk3' 'nss')
makedepends=('nodejs')
provides=('paintdotjs')
conflicts=('paintdotjs')
options=('!strip')
source=(
  "paintdotjs-${pkgver}-source.tar.gz::https://github.com/LabyStudio/paintdotjs/archive/refs/tags/v${pkgver}.tar.gz"
  "paintdotnet.zip::https://github.com/paintdotnet/release/releases/download/v5.1.12/paint.net.5.1.12.portable.x64.zip"
)
source_x86_64=("paintdotjs-${pkgver}.AppImage::https://github.com/LabyStudio/paintdotjs/releases/download/v${pkgver}/paintdotjs-${pkgver}-linux-x86_64.AppImage")
noextract=('paintdotnet.zip' "paintdotjs-${pkgver}.AppImage")
sha256sums=('09ddd33ef174832309c12b5257dcc3b7ba0fda2b7df885628dd9d908b478476d' 'd5ae7043f2fb9d365b48dfe243a2aca1c74924de99b04b6445916c95354aefa3')
sha256sums_x86_64=('802e66316c770ea1f8878e56d9060e91e555d41ff98df72559cad369f4dc2d5b')

prepare() {
  mkdir -p paintdotnet-source
  bsdtar -xf paintdotnet.zip -C paintdotnet-source
}

package() {
  local project="paintdotjs-${pkgver}"
  install -Dm755 "paintdotjs-${pkgver}.AppImage" "$pkgdir/opt/paintdotjs/paintdotjs.AppImage"
  node "$project/scripts/install_desktop_assets.js" \
    --source paintdotnet-source \
    --output "$pkgdir/opt/paintdotjs/assets" \
    --manifest "$project/desktop-resources/asset-manifest.json"

  install -Dm755 "$project/aur/paintdotjs" "$pkgdir/usr/bin/paintdotjs"
  install -Dm644 "$project/aur/paintdotjs.desktop" "$pkgdir/usr/share/applications/paintdotjs.desktop"
  install -Dm644 "$project/aur/x-paintdotnet.xml" "$pkgdir/usr/share/mime/packages/x-paintdotnet.xml"
  install -Dm644 "$project/desktop-resources/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/paintdotjs.png"
  install -Dm644 "$project/desktop-resources/file-icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/mimetypes/application-x-paintdotnet.png"
  install -Dm644 "$project/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
