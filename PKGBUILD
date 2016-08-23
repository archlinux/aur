# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Based-on: aur/graphite-api-git by Justin Dray <justin@dray.be>

pkgname=graphite-api
pkgver=1.1.3
pkgrel=1
pkgdesc="Graphite-web, without the interface. Just the rendering HTTP API."
url="https://github.com/brutasse/graphite-api"
license=('Apache')
depends=('python' 'python-pytz' 'python-six' 'python-flask' 'python-structlog'
         'python-yaml' 'python-tzlocal' 'python-cairocffi' 'python-pyparsing'
         'gunicorn')
makedepends=('python-setuptools' 'python-mock')
optdepends=('python-flask-cache: For caching'
            'python-raven: For sentry support'
            'python-statsd: For statsd support')
backup=('etc/graphite-api.yaml')
arch=('any')
source=("https://github.com/brutasse/${pkgname}/archive/${pkgver}.tar.gz"
        "graphite-api.service")
sha256sums=('801bb3142046b614956a5c7cf27da502306d27faa60a314719855d9d30282d1e'
            '08a960632c1db95ee0c46cdb0b5c8a511cf0fe7c0ffac7a0ed0adb877aa2af37')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="${pkgdir}/" --optimize=1
        mkdir -p "$pkgdir/var/lib/graphite"
        install -Dm0644 "$srcdir/graphite-api.service" "$pkgdir/usr/lib/systemd/system/graphite-api.service"
        install -Dm0644 "$srcdir/$pkgname-$pkgver/fpm/conf/etc/graphite-api.yaml" "$pkgdir/etc/graphite-api.yaml"
        sed -i 's|/srv/|/var/lib/|g' "$pkgdir/etc/graphite-api.yaml"
}
