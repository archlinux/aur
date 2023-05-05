# Maintainer: Steven De Bondt <egnappah at gmail dot com>

pkgname=graphite-web
pkgver=1.1.10
pkgrel=3
pkgdesc="a Django-based web application that renders graphs and dashboards"
url="https://github.com/graphite-project/graphite-web/"
license=('Apache')
depends=('python-pytz' 'python-six' 'python-flask' 'python-structlog'
         'python-yaml' 'python-tzlocal' 'python-cairocffi' 'python-pyparsing'
         'python-django' 'python3-django-tagging')
makedepends=('python-setuptools' 'python-pip')
optdepends=('python-flask-cache: For caching'
            'python-raven: For sentry support')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/graphite-project/${pkgname}/archive/${pkgver}.tar.gz"
        "graphite-web.service")
sha256sums=('SKIP'
            '5e2d2a0b026e07d1f50baeef4526ba7f44bb300a3e89d2c1fd18300d5a952694')

build() {
        cd "$srcdir/$pkgname-$pkgver"

	#Dirty fixing obselete references
	find . -type f -exec sed -i 's/post-install/post_install/g' {} +
	find . -type f -exec sed -i 's/readfp/read_file/g' {} +

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

	python -m build --wheel
}

package() {
        cd "$srcdir/$pkgname-$pkgver"

	pip install --no-deps --root="$pkgdir" dist/*.whl

	#Fix dir structure
	mkdir -p $pkgdir/opt/graphite/
	mv $pkgdir/usr/* $pkgdir/opt/graphite/
	mkdir -p $pkgdir/opt/graphite/webapp/graphite/
	mv $pkgdir/opt/graphite/lib/python3.11/site-packages/graphite/* $pkgdir/opt/graphite/webapp/graphite/

        mkdir -p "$pkgdir/var/lib/graphite"
        install -Dm0644 "$srcdir/graphite-web.service" "$pkgdir/usr/lib/systemd/system/graphite-web.service"
}
