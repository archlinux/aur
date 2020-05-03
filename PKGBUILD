# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint
pkgver=13.3.3
pkgrel=1
pkgdesc='A linter for CSS-like syntaxes like SCSS, Sass, Less and SugarSS'
arch=('any')
url='https://stylelint.io/'
license=('MIT')
depends=('nodejs')
optdepends=('stylelint-config-standard: config for common conventions')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('7691a41622514d9b8298511907c7b58e5d83aeeba63482481706c21294d34085')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Install license in the usual place
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  install -Dm644 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
