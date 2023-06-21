# Maintainer: Jan-Jaap Korpershoek <jjkorpershoek96 at gmail dot com>
pkgname=php-language-server
pkgver=5.4.6
pkgrel=4
pkgdesc="PHP language server implementation"
arch=('x86_64')
url="https://github.com/felixfbecker/php-language-server"
license=('ISC')
depends=('php74')
makedepends=('composer')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/felixfbecker/$pkgname/archive/v$pkgver.tar.gz"
    "exception.patch::https://github.com/felixfbecker/$pkgname/commit/d5bbffb30db1d117184518713a4bea191fc6ab22.diff"
    "php-language-server"
)
sha256sums=('289873a9d2f42b829eb66ff5251476e611de3102bca2b52f9fefd7d4f98e7357'
            'eff140afa56f5f2bcda7b6da6e599ef86e9de4692a357ff06c4aaf9dfed36000'
            'b4cfc545e3edb8c8e9a664b8d853f378fe4ed11960a721318d04d9388c2d5fcd')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # Avoid a crash due to badly catched exception.
    # See https://github.com/felixfbecker/php-language-server/pull/756
    patch -p1 -i ../exception.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    php7 /usr/bin/composer install
    php7 /usr/bin/composer run-script parse-stubs
}

package() {
    path="$pkgdir/usr/share/php7/$pkgname"
    mkdir -p $path
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 php-language-server "$pkgdir/usr/bin/"
    cd "$srcdir/$pkgname-$pkgver"
    cp -dr --no-preserve=ownership . "$path"
}
