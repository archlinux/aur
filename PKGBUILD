# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=placement
_pycname=openstack-${_pyname}
pkgbase=$_pycname
pkgname=($_pycname{,-doc})
pkgver=4.0.0
pkgrel=1
pkgdesc="Resource provider inventory usage and allocation service"
arch=('any')
url="https://docs.openstack.org/placement/latest/"
license=('Apache')
depends=(
	python
	python-pbr
	python-sqlalchemy
	python-keystonemiddleware
	python-routes
	python-webob
	python-jsonschema
	python-requests
	python-setuptools
	python-oslo-concurrency
	python-oslo-config
	python-oslo-context
	python-oslo-log
	python-oslo-serialization
	python-oslo-utils
	python-oslo-db
	python-oslo-policy
	python-oslo-middleware
	python-oslo-upgradecheck
	python-os-resource-classes
	python-os-traits
	python-microversion-parse
	python-psycopg2
	python-pymysql
)
makedepends=(
	python-setuptools
	python-sphinx
	python-sphinxcontrib-actdiag
	python-sphinxcontrib-seqdiag
	python-sphinx-feature-classification
	python-os-api-ref
	python-openstackdocstheme
	python-reno
	python-whereto
	python-osprofiler
)
checkdepends=(
	python-hacking
	python-pyflakes
	python-coverage
	python-fixtures
	python-oslotest
	python-stestr
	python-testtools
	bandit
	python-gabbi
	python-wsgi-intercept
	python-osprofiler
)
options=('!emptydirs')
source=(
	"https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz"
	wsgi-placement-api.conf
	sysusers.conf
	tmpfiles.conf
)
md5sums=('1ed89a904895eee0d973839b11fb8f82'
         'b61f4a6dd8921197426a07668af90497'
         '068a5d4a7483c8654d9f7d362405b5b4'
         'a58a1812012c7095c97d9824d61798d6')
sha256sums=('bd052f9e2d1a1480bb9dc55456492a3072a36435df54f89569a517f095c592e8'
            'a616f40f5c91584ec0af4c83ba8f52520e5a82891b12f22b893f7a5603278712'
            'f0f112e74248179028f6d96173c13a99e81ec28c938174eef1fa6b94c60ab48a'
            '330d6afdb001430a9995207ebaa3ada47c483e4cfce729b27219f3333927fd8c')
sha512sums=('32ff30f7216ea56b073582c2e1c4b501229d941f3c6fc501245ab92544234774df63a9b9674ba5f1225d462ab205b2512185907e309e4135e01e1776d554b293'
            '5ac7481641cf9d78b88a366bf016891481d6c6feeee125bf01243d23f473e0e11c1a301dc47b206311eb36e3d8dacc716e66c63a234423c3ee66c5f9bf368a71'
            '9ac7e51aaf172165a62ecc9ee4c9642b8534b4e9f4a58e996f7da7fb8aef1aee7fe1807b295da516533c309ac95add6d462cbd4c0b79a047c2c8d2457e844e66'
            '4e32e3648f36f1a3287698b6b93afb6cb868bf8f30ea2abc174d282c5205de4113dcc7c7c00a2592890099eccbe2c17d409965684b6222f5b9844a583116fc37')

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
	cd "$_pycname-$pkgver"
	python setup.py build
	sphinx-build -b html doc/source doc/build/html
}

check(){
	cd $_pycname-$pkgver
	stestr run
}

_package_pkg(){
	optdepends=(
		"apache: wsgi api support"
		"mod_wsgi: apache wsgi support"
		"python-openstackclient: OpenStack CLI Client"
		"${pkgbase}-doc: Documents for ${pkgdesc}"
	)
	backup=(
		etc/httpd/conf/extra/wsgi-placement-api.conf
		etc/placement/placement.conf
		etc/placement/policy.json
		etc/placement/policy.yaml
	)
	cd "$_pycname-$pkgver"
	export PYTHONPATH="$PWD"
	_DATADIR="$pkgdir/usr/share"
	_CONFDIR="$pkgdir/etc"
	_DOCDIR="$_DATADIR/doc"
	DATADIR="$_DATADIR/$_pyname"
	DOCDIR="$_DOCDIR/$_pyname"
	LIBDIR="$pkgdir/usr/lib"
	CONFDIR="$_CONFDIR/$_pyname"
	python setup.py install --root "$pkgdir" --optimize=1
	mkdir -p "$pkgdir"/{usr/share,var/{log,lib}}/"$_pyname"
	oslo-config-generator --config-file=etc/placement/config-generator.conf
	oslopolicy-sample-generator --config-file=etc/placement/policy-generator.conf
	install -Dm644 "$srcdir/tmpfiles.conf" "$LIBDIR/tmpfiles.d/$_pyname.conf"
	install -Dm644 "$srcdir/sysusers.conf" "$LIBDIR/sysusers.d/$_pyname.conf"
	install -Dm644 "$srcdir/wsgi-placement-api.conf" -t "$_CONFDIR/httpd/conf/extra"
	install -Dm644 "$srcdir/wsgi-placement-api.conf" -t "$DATADIR"
	install -Dm644 LICENSE "$_DATADIR/licenses/$_pyname/LICENSE"
	install -Dm644 etc/placement/placement.conf.sample "$CONFDIR/placement.conf"
	install -Dm644 etc/placement/placement.conf.sample -t "$DATADIR"
	install -Dm644 etc/placement/policy.yaml.sample "$CONFDIR/policy.yaml"
	install -Dm644 etc/placement/policy.yaml.sample -t "$DATADIR"
	echo '{}' >"$CONFDIR/policy.json"
}

_package_doc(){
	pkgdesc="${pkgdesc} Documents"
	depends=()
	cd "$_pycname-$pkgver"
	_DOCDIR="$pkgdir/usr/share/doc"
	DOCDIR="$_DOCDIR/$_pyname"
	mkdir -p "${_DOCDIR}"
	cp -r doc/build/html "$DOCDIR"
	rm -r "$DOCDIR/.doctrees"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"
