# Maintainer: Nidal Jaafar <nidaljaafar.nj at gmail dot com>

pkgname=harness-session-manager
pkgver=1.2.1
pkgrel=1
pkgdesc='Terminal session manager for AI coding harnesses'
arch=('x86_64')
url='https://github.com/nidalJaafar/harness-session-manager'
license=('MIT')
depends=('bun' 'nodejs>=20' 'sqlite')
makedepends=('npm')
optdepends=(
  'git: project and worktree integration'
  'libnotify: desktop notifications'
  'xdg-utils: launching sessions in a new terminal window'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'hsm-wrapper'
)
sha256sums=('7db79ee03aacb352a43587d639192d44454552dfc6ce6979bbfe31f7a322e91f'
            '6473e9d742f7d970bf900c4f6de1e85570834bf62b6400571a585b14daeef60b')

build() {
  cd "$pkgname-$pkgver"
  npm ci --omit=dev --no-audit --no-fund
}

check() {
  cd "$pkgname-$pkgver"
  npm test
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/lib/$pkgname"
  cp -a src node_modules package.json package-lock.json "$pkgdir/usr/lib/$pkgname/"

  install -Dm755 "$srcdir/hsm-wrapper" "$pkgdir/usr/bin/hsm"
  ln -s hsm "$pkgdir/usr/bin/sessions"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/harness-plugins.md "$pkgdir/usr/share/doc/$pkgname/harness-plugins.md"
}
