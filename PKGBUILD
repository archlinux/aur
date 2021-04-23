# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgname=renovate
pkgname=renovate-git
pkgver=24.107.0.r0.gfa6d1e32a
pkgrel=1
pkgdesc="Universal dependency update tool that fits into your workflows."
arch=(any)
url="https://github.com/renovatebot/renovate"
source=("$pkgname::git+https://github.com/renovatebot/renovate")
license=('AGPL3')
makedepends=('yarn')
depends=('nodejs')
sha256sums=('SKIP')

build () {
  cd "$srcdir/$pkgname"
  yarn version --new-version "$(git describe --abbrev=0 --tags)-$(git rev-parse --short HEAD)"
  yarn install
  yarn build
}

package() {  
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname/dist" "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname/data" "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname/package.json" "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname/license" "$pkgdir/opt/$pkgname"

  chmod 755 "$pkgdir/opt/$pkgname/dist/renovate.js"
  chmod 755 "$pkgdir/opt/$pkgname/dist/config-validator.js"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/dist/renovate.js" "$pkgdir/usr/bin/$_pkgname"

  cd "$pkgdir/opt/$pkgname"
  yarn install --production
  
  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
