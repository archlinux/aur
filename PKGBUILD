# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=voice2json-git
pkgrel=1
pkgver=2.1.r12.g03996c9
pkgdesc="Command-line tools for speech and intent recognition on Linux"
arch=('x86_64')
url="https://github.com/synesthesiam/voice2json"
license=('MIT')
depends=('python>=3.7' 'python-setuptools' 'python-wheel' 'python-pip' 'python-aiohttp' 'python-yaml' 'python-tqdm' 'python-pydash' 'python-networkx' 'python-aiofiles' 'python-jsonlines')
makedepends=('git' 'python-build' 'python-installer')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('voice2json::git+https://github.com/synesthesiam/voice2json.git'
         'fix-requirements.patch'
         'add-setup-py.patch')
md5sums=('SKIP'
         '7890a0912c84ccc1959395d87d9cce81'
         '9a031ae4e98b0414fc4ff914e36e0aaa')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
	# Apply patches
	patch -d "$srcdir/${pkgname%-git}" -Np1 -i "$srcdir/fix-requirements.patch"
	patch -d "$srcdir/${pkgname%-git}" -Np1 -i "$srcdir/add-setup-py.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup_minimal.py bdist_wheel
}

check() {
	cd "$srcdir/${pkgname%-git}"
	# Tests require specific models and configurations
	# Skip tests for now
	true
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	
	# Install license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	# Install shell wrapper script if it exists
	if [ -f voice2json.sh ]; then
		install -Dm755 voice2json.sh "$pkgdir/usr/bin/voice2json-wrapper"
	fi
}
