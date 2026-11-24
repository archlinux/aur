# Maintainer: Agil <your-email@example.com>

pkgname=neonctl
pkgver=9.9.5
pkgrel=1
pkgdesc='Neon CLI: manage Neon serverless Postgres from the terminal (provides neon and neonctl)'
arch=('x86_64' 'aarch64')
url='https://github.com/neondatabase/neon-pkgs'
license=('Apache-2.0')
depends=('nodejs>=20.19')
makedepends=('npm')
optdepends=('postgresql: native psql client for the --psql flag (an embedded fallback is used otherwise)'
            'libsecret: system keyring access for stored credentials')
noextract=("$pkgname-$pkgver.tgz")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('42aeeff7857f2880cac8c725c140302d29b53b392df54c5918e9a10c69f463f3')

package() {
  npm install -g \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" \
    --no-audit --no-fund --no-update-notifier \
    "$srcdir/$pkgname-$pkgver.tgz"

  rm -rf "$pkgdir/usr/etc" "$srcdir/npm-cache"
  find "$pkgdir" -name package.json -print0 | xargs -0 -r sed -i "s|$pkgdir||g;s|$srcdir||g"

  chown -R root:root "$pkgdir"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  install -d "$pkgdir/usr/share/bash-completion/completions"
  HOME="$srcdir" "$pkgdir/usr/bin/neon" completion \
    > "$pkgdir/usr/share/bash-completion/completions/neon"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
