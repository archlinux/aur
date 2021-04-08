# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=tempest
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=27.0.0
pkgrel=1
pkgdesc="OpenStack Integration Testing"
arch=(any)
url="https://docs.openstack.org/tempest/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-cliff
	python-jsonschema
	python-testtools
	python-paramiko
	python-netaddr
	python-oslo-concurrency
	python-oslo-config
	python-oslo-log
	python-stestr
	python-oslo-serialization
	python-oslo-utils
	python-six
	python-fixtures
	python-pyaml
	python-subunit
	python-stevedore
	python-prettytable
	python-urllib3
	python-debtcollector
)
makedepends=(
	python-openstackdocstheme
	python-reno
	python-sphinx
	python-sphinxcontrib-svg2pdfconverter
	python-setuptools
)
checkdepends=(
	python-hacking
	python-coverage
	python-oslotest
	python-pycodestyle
	python-flake8-import-order
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('1f1d4e5dcf1fc333c4f15bc44812ed73')
sha256sums=('8dc8b629cc15a578f25b79a517fa9bfe1630f59a0f07268c911724722e0b0c80')
sha512sums=('2a484be6b8715c981c59576dab2fca1720c995321ff1b6f9fbe710bbb66848d918bd99f10ee14d1ec1e1c54ea6ba871a165e3ecc13f093667f4503c5a318df9e')

export PBR_VERSION=$pkgver

build(){
	cd "$_pyname-$pkgver"
	python setup.py build
	sphinx-apidoc -f -o doc/source/tests/compute tempest/api/compute
	sphinx-apidoc -f -o doc/source/tests/identity tempest/api/identity
	sphinx-apidoc -f -o doc/source/tests/image tempest/api/image
	sphinx-apidoc -f -o doc/source/tests/network tempest/api/network
	sphinx-apidoc -f -o doc/source/tests/object_storage tempest/api/object_storage
	sphinx-apidoc -f -o doc/source/tests/scenario tempest/scenario
	sphinx-apidoc -f -o doc/source/tests/volume tempest/api/volume
	rm -rf doc/build
	GENERATE_TEMPEST_PLUGIN_LIST=false sphinx-build -b html doc/source doc/build/html
}

check(){
	cd "$_pyname-$pkgver"
	stestr --test-path tempest/tests run
}

_package_pkg(){
	optdepends=(
		"python-openstackclient: OpenStack CLI Client"
		"${pkgbase}-doc: Documents for ${pkgdesc}"
	)
	backup=(
		etc/tempest/accounts.yaml
		etc/tempest/allow-list.yaml
		etc/tempest/logging.conf
		etc/tempest/rbac-persona-accounts.yaml
		etc/tempest/tempest.conf
	)
	cd "$_pyname-$pkgver"
	export PYTHONPATH="${PWD}"
	python setup.py install --root "$pkgdir" --optimize=1
	mv "$pkgdir"{/usr,}/etc
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	oslo-config-generator --config-file tempest/cmd/config-generator.tempest.conf
	install -Dm644 etc/*.sample -t "$pkgdir/usr/share/$pkgname/conf"
	install -Dm644 etc/*.yaml   -t "$pkgdir/usr/share/$pkgname/conf"
	install -Dm644 etc/*.sample -t "$pkgdir/etc/$_pyname"
	install -Dm644 etc/*.yaml   -t "$pkgdir/etc/$_pyname"
	for i in "$pkgdir"/etc/tempest/*.sample
	do mv -v $i ${i//.sample}
	done
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
