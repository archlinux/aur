# Maintainer: James Osborne <incentive@circlewithadot.net>

pkgname=relibre
pkgver=0.2.0
pkgrel=1
pkgdesc="Music release one-page generator (native WebKitGTK app that exports a single self-hostable HTML file)"
arch=('x86_64')
url="https://git.circlewithadot.net/incentive/relibre"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk') # Arch provides 4.1; the pkg name is 'webkit2gtk'
makedepends=('go')
source=("https://git.circlewithadot.net/incentive/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('88eed221ffb97f1dbc58a5cfc6939855713dbfb450fc8baad79e8267d1efd9a6')

build() {
  cd "$srcdir"/relibre* # handle Gitea’s tarball top-level dir name
  CGO_ENABLED=1 go build -trimpath -ldflags "-s -w" -o relibre-app
}

package() {
  cd "$srcdir"/relibre*

  # Binary
  install -Dm755 relibre-app "$pkgdir/usr/bin/relibre"

  # Desktop file
  if [[ -f dist/com.circlewithadot.Relibre.desktop.arch ]]; then
    install -Dm644 dist/com.circlewithadot.Relibre.desktop.arch \
      "$pkgdir/usr/share/applications/relibre.desktop"
  else
    install -Dm644 dist/com.circlewithadot.Relibre.desktop \
      "$pkgdir/usr/share/applications/relibre.desktop"
  fi

  # Icon (512x512)
  install -Dm644 dist/com.circlewithadot.Relibre.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/relibre.png"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
