# Maintainer: Steven De Bondt <egnappah at gmail dot com>

pkgname=graphite-web
pkgver=1.1.10
pkgrel=2
pkgdesc="a Django-based web application that renders graphs and dashboards"
url="https://github.com/graphite-project/graphite-web/"
license=('Apache')
depends=('python-pytz' 'python-six' 'python-flask' 'python-structlog'
         'python-yaml' 'python-tzlocal' 'python-cairocffi' 'python-pyparsing'
         'python-django')
makedepends=('python-setuptools')
optdepends=('python-flask-cache: For caching'
            'python-raven: For sentry support')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/graphite-project/${pkgname}/archive/${pkgver}.tar.gz"
        "graphite-web.service")
sha256sums=('SKIP'
            '5e2d2a0b026e07d1f50baeef4526ba7f44bb300a3e89d2c1fd18300d5a952694')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build

	#Dirty Fixing old django references
	sed -i 's/url\b/re_path/g' webapp/graphite/urls.py
	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/render/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/render/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/composer/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/composer/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/metrics/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/metrics/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/browser/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/browser/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/account/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/account/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/dashboard/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/dashboard/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/whitelist/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/whitelist/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/version/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/version/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/events/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/events/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/tags/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/tags/urls.py

	sed -i 's/django.conf.urls/django.urls/g' webapp/graphite/functions/urls.py
	sed -i 's/url\b/re_path/g' webapp/graphite/functions/urls.py
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="${pkgdir}/" --optimize=1
        mkdir -p "$pkgdir/var/lib/graphite"
        install -Dm0644 "$srcdir/graphite-web.service" "$pkgdir/usr/lib/systemd/system/graphite-web.service"
}
