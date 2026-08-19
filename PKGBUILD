# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=magic-wormhole-git
pkgver=0.24.0.r35.62468a4d
pkgrel=1
pkgdesc='Securely transfer data between computers (development version)'
arch=('any')
url='https://github.com/magic-wormhole/magic-wormhole'
license=('MIT')
depends=('python-click' 'python-cffi' 'python-autobahn' 'python-tqdm'
         'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize'
         'python-idna' 'python-service-identity' 'python-txtorcon'
         'python-zipstream-ng' 'python-iterable-io' 'python-pyopenssl' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-twisted' 'python-hypothesis'
              'python-mock' 'python-magic-wormhole-transit-relay'
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
	PYTHONPATH=. python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
	cd "${pkgname%-git}"
	local testEnv="build/test-env"
	python -m venv --clear --system-site-packages "$testEnv"
	"$testEnv/bin/python" -m installer dist/*.whl
	"$testEnv/bin/python" -m pytest
}

package() {
	cd "${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -vDm 644 README.md NEWS.md docs/*.rst -t "${pkgdir}/usr/share/docs/${pkgname}"
	install -vDm 644 docs/wormhole.1 -t "${pkgdir}/usr/share/man/man1"
}
