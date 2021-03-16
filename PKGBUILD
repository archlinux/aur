# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=keystone
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=18.0.0
pkgrel=1
pkgdesc="OpenStack Identity"
arch=('any')
url="https://opendev.org/openstack/glance"
license=('Apache')
depends=(
	python
	python-lxml
	python-ldap
	python-ldappool
	python-freezegun
	python-pbr
	python-webob
	python-flask
	python-flask-restful
	python-cryptography
	python-sqlalchemy
	python-sqlalchemy-migrate
	python-stevedore
	python-passlib
	python-keystoneclient
	python-keystonemiddleware
	python-bcrypt
	python-scrypt
	python-oslo-cache
	python-oslo-config
	python-oslo-context
	python-oslo-messaging
	python-oslo-db
	python-oslo-i18n
	python-oslo-log
	python-oslo-middleware
	python-oslo-policy
	python-oslo-serialization
	python-oslo-upgradecheck
	python-oslo-utils
	python-oauthlib
	python-pysaml2
	python-pyjwt
	python-dogpile.cache
	python-jsonschema
	python-pycadf
	python-msgpack
	python-osprofiler
	python-pytz
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-sphinxcontrib-apidoc
	python-sphinxcontrib-seqdiag
	python-sphinx-feature-classification
	python-sphinxcontrib-blockdiag
	python-reno
	python-os-api-ref
	python-ldap
	python-ldappool
)
checkdepends=(
	python-pytest
	python-hacking
	python-pep257
	python-flake8-docstrings
	python-bashate
	python-stestr
	python-freezegun
	python-pytz
	python-oslo-db
	python-coverage
	python-fixtures
	python-lxml
	python-oslotest
	python-webtest
	python-testtools
	python-tempest
	python-requests
)
options=('!emptydirs')
source=(
	"https://pypi.io/packages/source/k/$_pyname/$_pyname-$pkgver.tar.gz"
	sysusers.conf
	tmpfiles.conf
	wsgi-keystone.conf
	0000-httpd-config-path.patch
)
md5sums=('b4942ccf6f7827d40d89cee0bc69c3ae'
         'a110a86d00a4d9feea328be3b3659cf2'
         '1c5d5d6f9e2d5fd7af60ead1c722fd62'
         '8766b18f1108cd23fbd35f997c57d8f6'
         'fd882a2029c40c99f92e97d3e39c2bd1')
sha256sums=('35a5e13cf89124c3d50d93968c7f4b05422e1b81c7a950da118c02d2d9331272'
            '008afd2e7e24945a7d2609f936ae52c829157330cac03628c44a71aff512fb85'
            'f74083084fe20aaa5cd83d321d00d0f7f64fc7ff25d8723faea5ca6317639f14'
            '0ddfbfab3105402f6a0874ef972e6cb676a1f75d33f16e2edf30f35a65f301ad'
            'c462b3f3d4479db1256ff097656ef566678cd9b79eff4fd72e88cd5bea3ad136')
sha512sums=('48aa9aae46e0f61596222aa37def152cdb48876afb7edc1eadf84ea91c8bd2f6bfd645d64e9bfb82cf9d041d7ae432c34d25e34130b32b4815d9a73cea903ffc'
            '01a24019b32684ae339b058742b63fc69b17eb97d5b47e90266dad32729293bead3495edb58960a974a7c88d3f35ccd158730f9c625ef9bc4d6f0b1ff319fdf8'
            '664014795d38fe2eac93a11a1233b59098fe475ca57d31f4c2578dd5e968708a51036fefde34f43ff4f5599820c9ededb7e129dcc78bebcf00b56a56784ec9f3'
            'ffa7ef72157404fba656f38630953dc2a98cf988418e5ffda0a82f8adf8166fab850c93f67504635526266717f56608fb1a715c1b331809261aa55107b770724'
            '2c91f58ea58eba0bea2c99cf92234acfbb49fad67c6346a31a32a330627d4dfde87d8d3e76f5b088cfa8722e9e537a0e8bdf13b74a6053d7aa4891ff44c6db18')

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
	cd $_pyname-$pkgver
	python setup.py build
	[ -d doc/config-generator ]||ln -s ../config-generator doc/
	PYTHONPATH=${PWD} make -C doc man text
}

#check(){
#	cd $_pyname-$pkgver
#	stestr run
#}

_package_pkg(){
	optdepends=(
		"apache: wsgi api support"
		"mod_wsgi: apache wsgi support"
		"python-pymysql: MySQL sql database support"
		"python-pymemcache: memcached cache support"
		"python-redis: Redis cache support"
		"python-openstackclient: OpenStack CLI Client"
		"openstack-keystone-doc: Documents for OpenStack Identity"
	)
	backup=(
		etc/httpd/conf/extra/wsgi-keystone.conf
		etc/keystone/keystone.conf
		etc/keystone/logging.conf
		etc/keystone/keystone.policy.yaml
		etc/keystone/sso_callback_template.html
	)
	cd "$_pyname-$pkgver"
	export PYTHONPATH="$PWD"
	_DATADIR="$pkgdir/usr/share"
	_CONFDIR="$pkgdir/etc"
	_DOCDIR="$_DATADIR/doc"
	DATADIR="$_DATADIR/$_pyname"
	DOCDIR="$_DOCDIR/$_pyname"
	LIBDIR="$pkgdir/usr/lib"
	CONFDIR="$_CONFDIR/$_pyname"
	python setup.py install --root "$pkgdir" --optimize=1
	mv "$pkgdir"{/usr,}/etc
	mkdir -p "$pkgdir"/{usr/share,var/{log,lib}}/"$_pyname"
	oslo-config-generator --config-file=config-generator/keystone.conf
	oslopolicy-sample-generator --config-file config-generator/keystone-policy-generator.conf
	install -Dm644 "$srcdir/tmpfiles.conf" "$LIBDIR/tmpfiles.d/$_pyname.conf"
	install -Dm644 "$srcdir/sysusers.conf" "$LIBDIR/sysusers.d/$_pyname.conf"
	install -Dm644 "$srcdir/wsgi-keystone.conf" -t "$_CONFDIR/httpd/conf/extra"
	install -Dm644 "$srcdir/wsgi-keystone.conf" -t "$DATADIR"
	install -Dm644 httpd/uwsgi-keystone.conf -t "$DATADIR"
	install -Dm644 httpd/keystone-uwsgi-admin.ini -t "$DATADIR"
	install -Dm644 httpd/keystone-uwsgi-public.ini -t "$DATADIR"
	install -Dm644 doc/build/man/keystone-manage.1 "$_DATADIR/man/man1/keystone-manager.1"
	install -Dm644 LICENSE "$_DATADIR/licenses/$_pyname/LICENSE"
	install -Dm644 etc/*.sample -t "$DATADIR"
	install -Dm644 etc/*.html   -t "$DATADIR"
	install -Dm644 etc/*.sample -t "$CONFDIR"
	install -Dm644 etc/*.html   -t "$CONFDIR"
	for i in "$CONFDIR/"*.sample
	do mv -v "$i" "${i//.sample}"
	done
	find "$pkgdir" -name README -exec rm -f {} \;
}

_package_doc(){
	pkgdesc="OpenStack Identity Documents"
	depends=()
	cd "$_pyname-$pkgver"
	export PYTHONPATH="$PWD"
	DOCDIR="$pkgdir/usr/share/doc/$_pyname"
	mkdir -p "$DOCDIR/doc"
	cp -r doc/build/text "$DOCDIR/$pkgbase"
	find "$pkgdir" -name README -exec rm -f {} \;
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"
