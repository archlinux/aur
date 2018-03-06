# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=deployer
pkgver=6.1.0
pkgrel=1
pkgdesc="A deployment tool written in PHP with support for popular frameworks out of the box."
arch=('any')
url="https://deployer.org"
license=('MIT')
depends=('php')
makedepends=('composer')
source=("https://github.com/deployphp/deployer/archive/v$pkgver.tar.gz")
sha256sums=('c685d83fa8d5128c5016a1cfe7f02a12ad5ea41f6ec0fab4deb72bcb6c55b559')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # we install with dev dependencies because symfony/finder is required
    # to build the final phar (bin/build line 37)
    # composer install --prefer-dist --no-dev
    composer install --prefer-dist

    # similarly, we need to remove the shell out to composer which
    # also calls --no-dev (and besides we've called composer install here
    # so we don't need to call it again...)
    sed -i "/^exec('composer install --no-dev');$/d" bin/build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    php -d phar.readonly=Off bin/build -v"$pkgver"
    chmod +x deployer.phar
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 deployer.phar "$pkgdir/usr/bin/dep"
}
