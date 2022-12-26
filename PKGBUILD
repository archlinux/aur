# Maintainer: Aaron Coach <aur at ezpz dot cz>

pkgname=ghostfolio
pkgver=1.220.0
pkgrel=1
pkgdesc="Open source wealth management software."
arch=('x86_64')
url="https://ghostfol.io/"
license=(AGPL)
depends=('nodejs-lts-gallium' 'yarn' 'postgresql' 'redis')
backup=('etc/ghostfolio.env')
source=("ghostfolio-$pkgver.tar.gz::https://github.com/ghostfolio/ghostfolio/archive/refs/tags/$pkgver.tar.gz"
        "ghostfolio.service"
        "ghostfolio.sysusers"
        "ghostfolio.tmpfiles")
sha256sums=('8d5ddd2cea334e286d6a7cc18d0c10806d78f8c589de9524d56c603b395f2032'
            '4992b5c87b0088585b23104d334f3705f7eeca2588a71c0edb6fe1ebd4b45540'
            '128f0df32f5af102e7915b96c3868a90e9f33421d2376adbea63197f0257fcc1'
            'e640d2239e5308198b9ee84cefa9825d156dbd6151f86559e0d7f94dd1144b44')

prepare() {
  cd "$srcdir/ghostfolio-$pkgver"
  yarn install
  node decorate-angular-cli.js

  sed -i -e '1 i\NODE_ENV=production' -e 's|ghostfolio-development|ghostfolio|' .env
}

build() {
  cd "$srcdir/ghostfolio-$pkgver"
  yarn build:all
  cd dist/apps/api
  yarn
  cp -R ../../../{package.json,prisma} .
  yarn database:generate-typings
}

package() {
  mkdir -p "$pkgdir/usr/lib"
  cp -R "$srcdir/ghostfolio-$pkgver/dist/apps" "$pkgdir/usr/lib/ghostfolio"
  install -D "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
  install -D "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -D "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -D "$srcdir/ghostfolio-$pkgver/.env" "$pkgdir/etc/$pkgname.env"
  install -Dm0644 "$srcdir/ghostfolio-$pkgver/LICENSE" "$pkgdir/usr/share/licences/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
