# Maintainer: mia <mia@mia.jetzt>

pkgname=iceshrimp.net-akkoma-fe-git
pkgver=3.10.0.92d3cd4d
pkgrel=3
license=(AGPL)
arch=(any)
makedepends=(jq nodejs npm)
source=(akkoma-fe::git+https://iceshrimp.dev/iceshrimp/akkoma-fe.git)
sha256sums=(SKIP)

pkgver() {
  cd akkoma-fe
  echo "$(jq -r '.version' package.json).$(git rev-parse --short HEAD)"
}

build() {
  cd akkoma-fe
  corepack yarn
  corepack yarn build
}

take-static() {
  mv "$srcdir/akkoma-fe/dist/static/$1" "$srcdir/$1"
}

put-static() {
  ln -s "/etc/iceshrimp.net/akkoma-fe/$1" "$pkgdir/usr/share/iceshrimp.net/akkoma-fe/static/$1"
  install -Dm644 "$srcdir/$1" "$pkgdir/etc/iceshrimp.net/akkoma-fe/$1"
}

package() {
  install -dm644 "$pkgdir/usr/share/iceshrimp.net/akkoma-fe/static"

  # split out configurables into /etc
  install -dm755 "$pkgdir/etc/iceshrimp.net/akkoma-fe"

  take-static terms-of-service.html
  sed -i 's|$STATIC_DIR/static/terms-of-service.html|/etc/iceshrimp.net/akkoma-fe/terms-of-service.html|' "$srcdir/terms-of-service.html"
  put-static terms-of-service.html

  take-static config.json && put-static config.json
  take-static styles.json && put-static styles.json

  take-static custom.css
  sed -i 's|$static_dir/static/custom.css|/etc/iceshrimp.net/akkoma-fe/custom.css|' "$srcdir/custom.css"
  put-static custom.css

  # install compiled artifacts
  cp -dpTr --no-preserve=ownership "$srcdir/akkoma-fe/dist" "$pkgdir/usr/share/iceshrimp.net/akkoma-fe"
}
