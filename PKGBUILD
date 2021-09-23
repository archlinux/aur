# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=horizon
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=20.1.0
pkgrel=1
pkgdesc="OpenStack Dashboard"
arch=('any')
url="https://docs.openstack.org/horizon/latest/"
license=('Apache')
depends=(
	gettext
	python
	python-pbr
	python-six
	python-babel
	python-debtcollector
	python-django
	python-django-compressor
	python-django-debreach
	python-django-pyscss
	python-futurist
	python-iso8601
	python-keystoneauth1
	python-netaddr
	python-oslo-concurrency
	python-oslo-config
	python-oslo-i18n
	python-oslo-policy
	python-oslo-serialization
	python-oslo-upgradecheck
	python-oslo-utils
	python-osprofiler
	python-pymongo
	python-pyscss
	python-cinderclient
	python-glanceclient
	python-keystoneclient
	python-neutronclient
	python-novaclient
	python-swiftclient
	python-pytz
	python-pyaml
	python-requests
	python-semantic-version
	python-xstatic
	python-xstatic-angular
	python-xstatic-angular-bootstrap
	python-xstatic-angular-fileupload
	python-xstatic-angular-gettext
	python-xstatic-angular-lrdragndrop
	python-xstatic-angular-schema-form
	python-xstatic-bootstrap-datepicker
	python-xstatic-bootstrap-scss
	python-xstatic-bootswatch
	python-xstatic-d3
	python-xstatic-hogan
	python-xstatic-font-awesome
	python-xstatic-jasmine
	python-xstatic-jquery
	python-xstatic-jquery-migrate
	python-xstatic-jquery-quicksearch
	python-xstatic-jquery-tablesorter
	python-xstatic-jquery-ui
	python-xstatic-jsencrypt
	python-xstatic-mdi
	python-xstatic-objectpath
	python-xstatic-rickshaw
	python-xstatic-roboto-fontface
	python-xstatic-smart-table
	python-xstatic-spin
	python-xstatic-termjs
	python-xstatic-tv4
	python-enmerkar
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-reno
	python-sphinx
	python-doc8
	python-mock
	python-pytest
)
checkdepends=(
	ffmpeg
	firefox
	xorg-server-xvfb
	python-hacking
	python-coverage
	python-freezegun
	python-nodeenv
	python-pytest
	python-pytest-django
	python-pytest-html
	python-memcached
	python-selenium
	python-testscenarios
	python-testtools
	python-xvfbwrapper
)
source=(
	"https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
	0000-set-default-not-debug.patch
	wsgi-horizon.conf
	tmpfiles.conf
	sysusers.conf
)
md5sums=('b5c84a4f161f1c6e8ec9674d8b805f5e'
         'd8207cc37544a97a6ace55f37cf22e96'
         '94282686c3903ff4a15e75c519186541'
         'ca5311dc0f58af1e2f5a306038128ce7'
         'c656448ba05ca49ffc6897d4e92e64d8')
sha256sums=('940fc81816ca0b3cd5e8e341a603c58f1443d0c28249e883875469fc52995379'
            'e8982ef8ba683116e517801482280f59736cc6903d6e30b9fb3ecdcc3c163f8b'
            'be5b591bde6abef4b445170a2cef4325106e516c5adf15d3de6cd7f34753dc6f'
            'fab8d2aaf442c5e7760808a72a1e3209f3099377a7ae9fa7eb1d446effdcdee3'
            'bef6fe090baba05e6a72fb118ba709eb945133ae8094ad5aa932bbf76a9ffe23')
sha512sums=('ba36fccadc6a73cc7b917fb37c96052858947277b3c5e794fdddf3c27a97ccd3550f0b72787f2a3655a6a883b01c066507f217323cb44b84220bb5573f4b37ce'
            'c7bd6d72218a2e11a1903a29899856ef00c0cf43fa1f0890023d7839e099eee5202956a948eaa19975348dbb619f6297d46f8e185406d58a85861d8352737ac5'
            'd2fc3f55fcd224127c18b904be724da6eaeaf1ac7841b1415df038e192a91d6b18421ab17aae817bbbba5a8492e98f96e73539dd1f356c9c844abe141ef31a50'
            '127e9a9eb8ee19773ee579d86cf19bf8d41be1d222a7a241a3f36b4091d965249f96afba44cded8c79eeb10733f79b7b78bc8beb2c9446e43774a31bd5a04bf4'
            '58567414da7c38c5987158f2206e7b13617565944b233381faf3576b7124e4e2dc4244c55c791b104d047f2450ce55379c935e259af4f387b1415e60a972f29d')

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
	sphinx-build -b html doc/source doc/build/html
}

#check(){
#	cd $_pyname-$pkgver
#	PYTHONPATH=${PWD} stestr run
#}

_package_pkg(){
	optdepends=(
		"apache: wsgi api support"
		"mod_wsgi: apache wsgi support"
		"python-openstackclient: OpenStack CLI Client"
		"${pkgbase}-doc: Documents for ${pkgdesc}"
	)
	backup=(
		etc/httpd/conf/extra/wsgi-horizon.conf
		etc/openstack-dashboard/local_settings
	)
	cd $_pyname-$pkgver
	export PYTHONPATH=${PWD}
	_DATADIR="$pkgdir/usr/share"
	DATADIR="$_DATADIR/$pkgname"
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir"/usr/lib/tmpfiles.d/$_pyname.conf
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir"/usr/lib/sysusers.d/$_pyname.conf
	install -Dm644 "$srcdir/wsgi-horizon.conf" -t "$pkgdir/etc/httpd/conf/extra"
	install -Dm644 "$srcdir/wsgi-horizon.conf" -t "$DATADIR"
	install -Dm644 openstack_dashboard/local/local_settings.py.example "$pkgdir/etc/openstack-dashboard/local_settings"
	install -Dm755 manage.py -t "${DATADIR}"
	mv ${pkgdir}/usr/lib/python3.*/site-packages/openstack_dashboard "${DATADIR}/"
	ln -s /etc/openstack-dashboard/local_settings "${DATADIR}/openstack_dashboard/local/local_settings.py"
}

_package_doc(){
	pkgdesc="${pkgdesc} Documents"
	depends=()
	cd $_pyname-$pkgver
	DOCDIR=$pkgdir/usr/share/doc
	mkdir -p "$DOCDIR"
	cp -r doc/build/html "$DOCDIR/$pkgbase"
	rm -r "$DOCDIR/$pkgbase/.doctrees"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"
