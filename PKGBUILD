# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=glance
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=22.0.0
pkgrel=1
pkgdesc="OpenStack Image Service"
arch=(any)
url="https://docs.openstack.org/glance/latest/"
license=(Apache)
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
	sudoers.conf
)
md5sums=('baab79bde4c5ce421aea2ed310a4efab'
         '40fe040b0cda8bdd0343bd1bcceded7f'
         '745f0b78baf56f15f4291458428f9c5b'
         'b6124b27e12d81c9d310570b16ec99cb'
         '6dbfee57bf274e2b155989939b902200')
sha256sums=('fe4c48facebdce46275a403dfbf0cd93b13416cdc2dcd3a7067a97c66efcf541'
            '1e791e7de9c673604bff92faec87abf98d1df985e59b057434b2b9be384a2216'
            '1ec680f4917b757f7378c037e770d9ba8ef9b25f32677045d6f3fd68aca0bfef'
            '2d3acd49ac7be8dffc95053704e5c0e13abbbfabcd0afde01cf2ba1b33753749'
            '8eaa11829714ec6b341955468da053d9b67e1b0b3d86a65295224fc3f69165c1')
sha512sums=('5dc4ad3bf127b52853c336b2551e02896203d6037408716590545e3b8d34f34bd5ec5aa15842cc76edb9c34851a980e39ed6c92426cf2915bd5aeac7b11c82b9'
            '5af1000483b1784c163b38f7cc888318c41d60b37640008ac42b19477ac6de68dc2caa2149886d16e82429f5e85939f4aca58baf9b3b4175451c49733d8c547c'
            '49fdfe6cb42277f8f74e165a4fc70d15cae5a4442c8bae7fbbd69f27e61ee7f88d12d184816926be85de98fac88257bc975137c1fa7a3562dbf8abdd26d03b25'
            '32b080e9a93d6fbf431bf88e767f76d4004cd995d516ecb0d124d1c51de63fdf6c027c47157123c5660b6fed916164a640438285417e77c52c9b46a93c3cfab9'
            'd54d6e5ca0f1f7606eec13375e29af8d41c323b314e9c38c2e4e88e0087f89aba67b945bfe76530f6a30e3c6c11a5093becdd646edc314585ed2bb002958e10c')

export PBR_VERSION=$pkgver

prepare(){
	for i in "${source[@]}"
	do case "${i}" in
		?*.patch)
			msg2 "Apply patch ${i}"
			patch -Np1 <"${i}"
		;;
	esac
	done
}

build(){
	cd "$_pyname-$pkgver"
	python setup.py build
	sphinx-build -b html doc/source doc/build/html
}

check(){
	cd "$_pyname-$pkgver"
	PYTHONPATH=${PWD} stestr run
}

_package_pkg(){
	optdepends=(
		"python-openstackclient: OpenStack CLI Client"
		"${pkgbase}-doc: Documents for ${pkgdesc}"
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
	cd "$_pyname-$pkgver"
	export PYTHONPATH="${PWD}"
	python setup.py install --root "$pkgdir" --optimize=1
	mv "$pkgdir"{/usr,}/etc
	install -Dm644 ${srcdir}/sudoers.conf "$pkgdir"/etc/sudoers.d/$_pyname
	install -Dm644 "$srcdir/openstack-glance-api.service" "$pkgdir/usr/lib/systemd/system/openstack-glance-api.service"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir"/usr/lib/tmpfiles.d/$_pyname.conf
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir"/usr/lib/sysusers.d/$_pyname.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-api.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-scrubber.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-cache.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-manage.conf
	oslo-config-generator --config-file etc/oslo-config-generator/glance-image-import.conf
	install -Dm644 etc/*.sample -t "$pkgdir/usr/share/$pkgname"
	install -Dm644 etc/*.sample -t "$pkgdir/etc/$_pyname"
	for i in "$pkgdir/etc/$_pyname/"*.sample
	do mv -v $i ${i//.sample}
	done
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -r httpd "$pkgdir/usr/share/$pkgname/"
	find "$pkgdir" -name README -exec rm -f {} \;
	chmod 0750 $pkgdir/etc/sudoers.d
	chmod 0440 $pkgdir/etc/sudoers.d/*
}

_package_doc(){
	pkgdesc="${pkgdesc} Documents"
	depends=()
	cd "$_pyname-$pkgver"
	DOCDIR=$pkgdir/usr/share/doc
	mkdir -p "$DOCDIR"
	cp -r doc/build/html "$DOCDIR/$pkgbase"
	rm -r "$DOCDIR/$pkgbase/.doctrees"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"
