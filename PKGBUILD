# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=tempest
pkgname=openstack-$_pyname
pkgver=26.1.0
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
md5sums=('7d8f867ab17f4b7c2a7dfc8245f11c62')
sha256sums=('860c7cd48e3810e34ffa21224186d72f893994ae27a66eb1c068b4e7dc0894be')
sha512sums=('4420840f767efa401fd43601a115b56696018f3c719e276cd0b9ec316ef47849f890493fe831081e88388ce04daf509ddf853d3d1b5ba9e62f1b4f850c4cf688')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
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

#check(){
#	cd $_pyname-$pkgver
#	stestr run
#}

package(){
	cd $_pyname-$pkgver
	export PYTHONPATH=${PWD}
	python setup.py install --root "$pkgdir" --optimize=1
	mv "$pkgdir"{/usr,}/etc
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	oslo-config-generator --config-file tempest/cmd/config-generator.tempest.conf
	install -Dm644 etc/*.sample -t "$pkgdir"/usr/share/${pkgname}/conf
	install -Dm644 etc/*.yaml -t "$pkgdir"/usr/share/${pkgname}/conf
	install -Dm644 etc/*.sample -t "$pkgdir"/etc/tempest
	install -Dm644 etc/*.yaml -t "$pkgdir"/etc/tempest
	for i in "$pkgdir"/etc/tempest/*.sample
	do mv -v $i ${i//.sample}
	done
	mkdir -p "${pkgdir}/usr/share/doc"
	cp -r doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
}
