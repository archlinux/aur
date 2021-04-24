# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=keystone
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=19.0.0
pkgrel=1
pkgdesc="OpenStack Identity"
arch=(any)
url="https://opendev.org/openstack/keystone"
license=(Apache)
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
	openstack-tempest
	python-requests
)
options=('!emptydirs')
source=(
	"https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
	sysusers.conf
	tmpfiles.conf
	wsgi-keystone.conf
	0000-httpd-config-path.patch
	0001-fix-tests-assertItemsEqual.patch
)
md5sums=('beef0d054c2b98a7da888df4bb1244e5'
         'a110a86d00a4d9feea328be3b3659cf2'
         '1c5d5d6f9e2d5fd7af60ead1c722fd62'
         '151474571c660abda387ead70a1a4da1'
         '933d5fcbdb9c202dd9645bea793ab027'
         'd25722f3b4a2bde96d2e7c8fab0bbaf8')
sha256sums=('dc5654ff1148c3e48c9892ec22da1195a23bf9ec503241a89f18548987394f89'
            '008afd2e7e24945a7d2609f936ae52c829157330cac03628c44a71aff512fb85'
            'f74083084fe20aaa5cd83d321d00d0f7f64fc7ff25d8723faea5ca6317639f14'
            'fc44ad3720e7a58f281efa01e4a6ec02041a30411084d661f34fd393d76a44e5'
            'a55dcf6033f1a0c956a0d8ce74a64dc4e77ed3c75d11fd0c852a0a533daeccda'
            '09a38ba3f256f71c3e1a093173de454282d5d25a69fa926e02d188b64a0f41ec')
sha512sums=('4a514a5fe7891441726bade7ccc0b5ad1ae29468daab6272fdd055969eda8fc025bce6710abf4cfb8a7092cc5c4a8f73ff21c2fc3e6c150e4db4ecedc7939942'
            '01a24019b32684ae339b058742b63fc69b17eb97d5b47e90266dad32729293bead3495edb58960a974a7c88d3f35ccd158730f9c625ef9bc4d6f0b1ff319fdf8'
            '664014795d38fe2eac93a11a1233b59098fe475ca57d31f4c2578dd5e968708a51036fefde34f43ff4f5599820c9ededb7e129dcc78bebcf00b56a56784ec9f3'
            '9f6449f18757cefb349356e956e964bb21e225de28f961ddc4a3ff024289d5dfe1498c6950823880c5f806f5f2bf41c53c8ce2301728a046b76c554a51c81dca'
            'e5f1462e2e496e5f1c58b5d12e9bbd958fdd831d8327e116a894ee7f2f28e06f77587b727d3509f952ce648dd50fcbdb389e814acb89d2b985f29a22c6e7493b'
            'b1d5b39bbea8805189e8993e64c081ea252c995a66e67664a5ecf07a177117654e2299c464f17eb47636d62e1e2184cfd232803b1ded52ea30c3c9bf386a6fa9')

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
	[ -d doc/config-generator ]||ln -s ../config-generator doc/
	PYTHONPATH="${PWD}" make -C doc man html
}

check(){
	cd "$_pyname-$pkgver"
	stestr run
}

_package_pkg(){
	optdepends=(
		"apache: wsgi api support"
		"mod_wsgi: apache wsgi support"
		"python-pymysql: MySQL sql database support"
		"python-pymemcache: memcached cache support"
		"python-redis: Redis cache support"
		"python-openstackclient: OpenStack CLI Client"
		"${pkgbase}-doc: Documents for ${pkgdesc}"
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
	pkgdesc="${pkgdesc} Documents"
	depends=()
	cd "$_pyname-$pkgver"
	mkdir -p "$pkgdir/usr/share/doc"
	cp -r doc/build/html "$pkgdir/usr/share/doc/$_pyname"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"
