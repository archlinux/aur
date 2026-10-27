# Maintainer: Alex Dewar <a.dewar@imperial.ac.uk>
pkgname=kimai-cli
pkgver=2.0.0
pkgrel=1
pkgdesc='Console application to manage your Kimai time-tracking data remotely'
arch=(any)
url=https://github.com/kimai/cli
license=(MIT)
depends=(php)
makedepends=(composer)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        kimai.sh)
sha256sums=('f473707708a78cb86ed907a9e72a5e1ce52d8fc9c6ec02397a11063d5381964a'
            '23e045edb14b8a39f54b2dbf5562ee20d74dc9b5013080341966c941bc52c562')

prepare() {
  cd "cli-$pkgver"
  # Fill the placeholders that box would normally replace
  # GitHub archives carry the tagged commit's date as file mtime
  local release_date
  release_date=$(date -u -d "@$(stat -c %Y src/Constants.php)" +%Y-%m-%d)
  sed -i \
    -e "s/@git-commit-short@/$pkgver/" \
    -e "s/@release-date@/$release_date/" \
    src/Constants.php
}

build() {
  cd "cli-$pkgver"
  # Arch ships iconv as a module that is disabled by default
  php -d extension=iconv /usr/bin/composer install --no-dev --optimize-autoloader --no-interaction
  find vendor -type d \( -iname tests -o -iname test \) -prune -exec rm -rf {} +
}

check() {
  cd "cli-$pkgver"
  php -d extension=iconv bin/kimai --version
  php -d extension=iconv bin/kimai list >/dev/null
}

package() {
  cd "cli-$pkgver"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r bin src vendor "$pkgdir/usr/share/$pkgname/"
  install -Dm755 "$srcdir/kimai.sh" "$pkgdir/usr/bin/kimai"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
