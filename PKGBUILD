# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=magic-wormhole-git
pkgver=0.12.0.r21.e522a39
pkgrel=1
pkgdesc='Securely transfer data between computers (development version)'
arch=('any')
url='https://github.com/magic-wormhole/magic-wormhole'
license=('MIT')
depends=('python-click' 'python-cffi' 'python-autobahn' 'python-tqdm'
         'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize'
         'python-idna' 'python-service-identity' 'python-txtorcon'
         'python-pyopenssl' 'python-setuptools')
makedepends=('git')
checkdepends=('python-mock' 'python-magic-wormhole-transit-relay'
              'python-magic-wormhole-mailbox-server')
provides=('magic-wormhole' 'wormhole' 'wormhole-server' 'python-wormhole')
conflicts=('magic-wormhole' 'wormhole' 'wormhole-server' 'python-wormhole')
replaces=('wormhole' 'wormhole-server' 'python-wormhole')
source=(${pkgname%-git}::'git+https://github.com/magic-wormhole/magic-wormhole.git')
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${pkgname%-git}"
	python setup.py build
}

check() {
	cd "${pkgname%-git}"
	python setup.py test
}

package() {
	cd "${pkgname%-git}"
	export PYTHONHASHSEED=0
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -vDm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -vDm 644 docs/*.md -t "${pkgdir}/usr/share/docs/${pkgname}"
	install -vDm 644 docs/wormhole.1 -t "${pkgdir}/usr/share/man/man1"
}
