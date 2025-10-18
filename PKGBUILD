# Maintainer: James Osborne <incentive@circlewithadot.net>

pkgname=relibre
pkgver=0.2.0
pkgrel=1
pkgdesc="Music release one-page generator (native WebKitGTK app that exports a single self-hostable HTML file)"
arch=('x86_64') # <-- this must include your arch
url="https://git.circlewithadot.net/incentive/relibre"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk') # Arch package name is 'webkit2gtk'
makedepends=('go')
source=("https://git.circlewithadot.net/incentive/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('36a4e4bd61da0e1e7f0f845c47c7d13cd7af1da84e38894676263d87b3e91577')

build() {
  cd "$srcdir"/relibre* # Gitea tarball top-level can vary
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

  # Icon
  install -Dm644 dist/com.circlewithadot.Relibre.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/relibre.png"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
