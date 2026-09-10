# Maintainer: Anıl Akpınar <meme4empty@gmail.com>
pkgname=cad-viewer
pkgver=1.7.0
pkgrel=1
pkgdesc="Browser-based DWG/DXF CAD viewer, packaged as a desktop app on system Electron"
arch=('any')
url="https://github.com/mlightcad/cad-viewer"
license=('MIT')
depends=('electron' 'bash' 'hicolor-icon-theme')
makedepends=('nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'cad-viewer-main.js'
        'cad-viewer.desktop'
        'cad-viewer.sh')
sha256sums=('bccd434d05d35a2149aa919bb2f8b069e67a36c4c63ffe52b1e7a40fe57916d4'
            '69172019cdfb40c8777d336ecd083ddc7892a938a4e3161d8f3095b69fa06fef'
            'f5c19db2b6aa8357b3a1f34e5ff2bdddf19d4a8fcf43ccac4f12e651b68a70eb'
            'a92dffbe01ca171a6a7e26a92d3254f0be24da0d81b942531047ffdd18e5bb72')

build() {
  cd "$pkgname-$pkgver"
  export NX_DAEMON=false
  pnpm install --frozen-lockfile
  pnpm exec nx run @mlightcad/cad-viewer-example:build
}

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/cad-viewer"
  cp -r packages/cad-viewer-example/dist "$pkgdir/usr/lib/cad-viewer/web"
  install -Dm644 "$srcdir/cad-viewer-main.js" "$pkgdir/usr/lib/cad-viewer/main.js"

  install -Dm755 "$srcdir/cad-viewer.sh" "$pkgdir/usr/bin/cad-viewer"
  install -Dm644 "$srcdir/cad-viewer.desktop" \
    "$pkgdir/usr/share/applications/cad-viewer.desktop"
  install -Dm644 packages/cad-viewer/src/svg/mlightcad.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/cad-viewer.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
