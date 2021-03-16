# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=glance
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=21.0.0
pkgrel=1
pkgdesc="OpenStack Image Service"
arch=('any')
url="https://docs.openstack.org/glance/latest/"
license=('Apache')
depends=(
	gettext
	libffi
	mariadb-libs
	postgresql-libs
	python
	python-pbr
	python-defusedxml
	python-sqlalchemy
	python-eventlet
	python-pastedeploy
	python-routes
	python-webob
	python-sqlalchemy-migrate
	python-sqlparse
	python-alembic
	python-httplib2
	python-oslo-config
	python-oslo-concurrency
	python-oslo-context
	python-oslo-upgradecheck
	python-oslo-utils
	python-stevedore
	python-futurist
	python-taskflow
	python-keystoneauth1
	python-keystonemiddleware
	python-wsme
	python-prettytable
	python-paste
	python-jsonschema
	python-pyopenssl
	python-six
	python-oslo-db
	python-oslo-i18n
	python-oslo-log
	python-oslo-messaging
	python-oslo-middleware
	python-oslo-reports
	python-oslo-policy
	python-retrying
	python-osprofiler
	python-glance-store
	python-debtcollector
	python-cryptography
	python-cursive
	python-iso8601
	python-os-win
	python-castellan
	python-pymysql
)
makedepends=(python-setuptools)
checkdepends=(
	python-pytest
	python-hacking
	python-babel
	python-coverage
	python-ddt
	python-fixtures
	python-requests
	python-testrepository
	python-testresources
	python-testscenarios
	python-testtools
	python-psutil
	python-oslotest
	python-stestr
	python-doc8
	python-pygments
	python-boto3
	python-pymysql
	python-psycopg2
	python-pysendfile
	python-xattr
	python-swiftclient
)
source=(
	"https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
	openstack-glance-api.service
	sysusers.conf
	tmpfiles.conf
)
md5sums=('95ced978f71751da21fdc83f21978e3b'
         '40fe040b0cda8bdd0343bd1bcceded7f'
         '745f0b78baf56f15f4291458428f9c5b'
         'b6124b27e12d81c9d310570b16ec99cb')
sha256sums=('567e26e3a92898025f6fc4764c2c5bdb5c78980ead42771b5c75b4a7aed93b22'
            '1e791e7de9c673604bff92faec87abf98d1df985e59b057434b2b9be384a2216'
            '1ec680f4917b757f7378c037e770d9ba8ef9b25f32677045d6f3fd68aca0bfef'
            '2d3acd49ac7be8dffc95053704e5c0e13abbbfabcd0afde01cf2ba1b33753749')
sha512sums=('83d49f96a82de0093fe3991f5138febc403964f5af1012de6e63395b82a368e08b2b7d142a889244c4261d1d019336e69050e9149d40b88e1c175f7a561e4f5d'
            '5af1000483b1784c163b38f7cc888318c41d60b37640008ac42b19477ac6de68dc2caa2149886d16e82429f5e85939f4aca58baf9b3b4175451c49733d8c547c'
            '49fdfe6cb42277f8f74e165a4fc70d15cae5a4442c8bae7fbbd69f27e61ee7f88d12d184816926be85de98fac88257bc975137c1fa7a3562dbf8abdd26d03b25'
            '32b080e9a93d6fbf431bf88e767f76d4004cd995d516ecb0d124d1c51de63fdf6c027c47157123c5660b6fed916164a640438285417e77c52c9b46a93c3cfab9')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
	sphinx-build -b html doc/source doc/build/html
}

check(){
	cd $_pyname-$pkgver
	PYTHONPATH=${PWD} stestr run
}

_package_pkg(){
	optdepends=(
		"python-openstackclient: OpenStack CLI Client"
		"openstack-glance-doc: Documents for OpenStack Image Service"
	)
	backup=(
		etc/glance/glance-api-paste.ini
		etc/glance/glance-api.conf
		etc/glance/glance-cache.conf
		etc/glance/glance-image-import.conf
		etc/glance/glance-manage.conf
		etc/glance/glance-scrubber.conf
		etc/glance/glance-swift.conf
	)
	cd $_pyname-$pkgver
	export PYTHONPATH=${PWD}
	python setup.py install --root "$pkgdir" --optimize=1
	mv "$pkgdir"{/usr,}/etc
	install -Dm644 ${srcdir}/openstack-glance-api.service "$pkgdir"/usr/lib/systemd/system/openstack-glance-api.service
	install -Dm644 ${srcdir}/tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$_pyname.conf
	install -Dm644 ${srcdir}/sysusers.conf "$pkgdir"/usr/lib/sysusers.d/$_pyname.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-api.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-scrubber.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-cache.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-manage.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-image-import.conf
	install -Dm644 etc/*.sample -t "$pkgdir"/usr/share/${pkgname}
	install -Dm644 etc/*.sample -t "$pkgdir"/etc/$_pyname
	for i in "$pkgdir"/etc/$_pyname/*.sample
	do mv -v $i ${i//.sample}
	done
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	cp -r httpd "${pkgdir}/usr/share/${pkgname}/"
	find "${pkgdir}" -name README -exec rm -f {} \;
}

_package_doc(){
	pkgdesc="OpenStack Image Service Documents"
	depends=()
	cd $_pyname-$pkgver
	mkdir -p "${pkgdir}/usr/share/doc"
	cp -r doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"
