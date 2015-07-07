# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=matrix-synapse
_pkgver=0.9.2-r2
pkgver="${_pkgver//-/.}"
pkgrel=4
pkgdesc="Matrix reference homeserver"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/synapse"
depends=('python2-syutil' 'python2-twisted=15.2.1' 'python2-service-identity'
         'python2-pyopenssl' 'python2-yaml' 'python2-pyasn1' 'python2-pynacl'
         'python2-daemonize' 'python2-py-bcrypt' 'python2-frozendict'
		 'python2-pillow' 'python2-pydenticon' 'python2-ujson'
		 'python2-matrix-angular-sdk')
makedepends=('python2-twisted' 'python2-mock' 'python2-setuptools_trial')
source=("git://github.com/matrix-org/synapse#tag=v$_pkgver"
        "twisted-15.2.1-compat.patch"
		'sysusers-synapse.conf')
md5sums=('SKIP'
         '32b1c21157531ff514a4a67b98ee80cc'
         'dfbffdd307c5559357a2ff51a1906700')
backup=('etc/synapse/log_config.yaml')
install='synapse.install'

prepare() {
	cd "synapse"

	# be compatible with python2-twisted 15.2.1 in arch repos
	git pull --no-edit origin pull/173/head
	git apply "$srcdir/twisted-15.2.1-compat.patch"
}

build() {
	cd "synapse"
	python2 setup.py build 
}

package() {
	cd "synapse"
	python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build

	for file in "$pkgdir/usr/lib/python2.7/site-packages/synapse"/{app,push}/*.py; do
		sed -re 's|env python$|&2.7|' -i "$file"
	done

	install -Dm644 "contrib/systemd/log_config.yaml" \
		"$pkgdir/etc/synapse/log_config.yaml"

	install -Dm644 "contrib/systemd/synapse.service" \
		"$pkgdir/usr/lib/systemd/system/synapse.service"

	install -Dm644 "$srcdir/sysusers-synapse.conf" \
		"$pkgdir/usr/lib/sysusers.d/synapse.conf"
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
