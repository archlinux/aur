# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=Weblate
pkgname=weblate
pkgver=4.2.2
pkgrel=1

pkgdesc="Web based localization tool with tight version control integration"
url="https://github.com/WeblateOrg/weblate"
arch=('any')
license=('GPL3')

depends=('python-bleach'
         'borg'
         'python-celery'
         'cython'
         'python-diff-match-patch>=20200713'
         'python-django-appconf'
         'python-django-compressor'
         'python-django-crispy-forms'
         'python-django-filter'
         'python-django-redis'
         'python-django'
         'python-django-rest-framework'
         'python-filelock'
         'python-gitpython'
         'python-hiredis'
         'python-html2text'
         'python-jellyfish'
         'python-jsonschema'
         'python-lxml'
         'python-misaka'
         'python-openpyxl'
         'python-pillow'
         'python-cairo'
         'python-gobject'
         'python-pyparsing'
         'python-dateutil'
         'python-redis-lock'
         'python-requests'
         'python-sentry_sdk'
         'python-setuptools'
         'python-siphashc'
         'python-social-auth-core'
         'python-social-auth-app-django'
         'translate-toolkit'
         'python-translation-finder'
         'python-user-agents'
         'python-weblate_schemas'
         'python-whoosh'
         'python-waitress'
         'python-cssselect'
         'python-methodtools'
         'systemd')
optdepends=('python-psycopg2: postgres support'
            'python-mysqlclient: MySQL support'
            'mercurial: mercurial repo support'
            'python-ruamel-yaml: Yaml support'
	    'hub: Github pull requst support'
            'lab: Gitlab merge request support'
            'git-review: gerrit support')
checkdepends=('python-selenium' 'python-responses')
backup=('etc/webapps/weblate/settings.py' 'etc/celery/weblate.conf')
install=weblate.install

source=("https://github.com/WeblateOrg/weblate/releases/download/weblate-${pkgver}/${_pkgname}-${pkgver}.tar.xz"
        'sysusers-weblate.conf'
        'tmpfiles-weblate.conf'
        'weblate.service'
        'celery-weblate.conf'
        'celery-weblate.service'
        'logrotate-celery')

sha256sums=('67f81fd4efd268204a9da45db4ea6c84527aa227d123d26816717a2aef58c478'
            '115c69062ac231d71596ce6b7d4afd0c6ea9b934f50de062c58315b2ef007137'
            '094525f9bf6e40f96c58e089fc596319f557a4a20bd1b23f426352f94fa43dad'
            '065247e8a96f6db16c0d08b919e53cd5e04d71a2be94f2ff949dd726dee06394'
            'bd05e7b9ce5b2f03ce4c687d8d9e0308c02057ade6a594678e9ba72cd7bb633d'
            'd96c6e95c1f021343382582c6233c61dfdf04f8a99c16a3a9be9fc4eb6030ad6'
            '9825ea64a5f66dc17622ad86659867ea98810e757b2ba679de9b9e10e9ac3e06')
install=weblate.install

build() {
	cd $_pkgname-$pkgver
        # don't pin any packages, this will just lead to breakage
	sed -i -e 's/,.*$//' -e 's/==/>=/' requirements.txt
	python setup.py build
}

package() {
	install -Dm644 ${pkgname}.service "$pkgdir"/usr/lib/systemd/system/${pkgname}.service
	install -Dm644 celery-${pkgname}.service "$pkgdir"/usr/lib/systemd/system/celery-${pkgname}.service
	install -dm755 "$pkgdir"/etc/celery
	install -Dm644 celery-${pkgname}.conf "$pkgdir"/etc/celery/${pkgname}.conf
	install -dm755 "$pkgdir"/etc/logrotate.d
	install -Dm644 logrotate-celery "$pkgdir"/etc/logrotate.d/celery
	cd $_pkgname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build

	install -dm755 "$pkgdir"/etc/webapps/${pkgname}
	cp ${pkgdir}/usr/lib/python3.8/site-packages/${pkgname}/settings_example.py ${pkgdir}/etc/webapps/${pkgname}/settings.py
	ln -s /etc/webapps/${pkgname}/settings.py ${pkgdir}/usr/lib/python3.8/site-packages/${pkgname}/settings.py

	install -Dm644 "$srcdir"/sysusers-weblate.conf "$pkgdir"/usr/lib/sysusers.d/weblate.conf
	install -Dm644 "$srcdir"/tmpfiles-weblate.conf "$pkgdir"/usr/lib/tmpfiles.d/weblate.conf
}
