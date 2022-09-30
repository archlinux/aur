# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Étienne Deparis <etienne [at] depar.is>

pkgname=concierge
pkgver=0.2.3
_commit=40b0de3e68354cd06461763b228d8901bc4c2d12
pkgrel=1
pkgdesc='Maintainable SSH configs'
arch=('any')
license=('MIT')
url='https://github.com/9seconds/concierge'
depends=('python-inotify-simple' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('concierge-jinja: jinja2 support in your templates'
            'concierge-mako: mako support in your templates')
# checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/40b0de3.tar.gz"
        "$pkgname.service")
sha256sums=('4a31e2ca421286bf56c70343caae1e248cbf2b715fbe1d1d153bcf2e2bc868e6'
            '272b69e8a76943c1e6014374c87f64d659916e953cf93a62427cc408a09682fa')

prepare() {
	cd "$pkgname-$_commit"
	sed -i '12,15c\REQUIREMENTS = ["inotify_simple"]' setup.py
}

build() {
	cd "$pkgname-$_commit"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$pkgname-$_commit"
# 	PYTHONPATH="$PWD" pytest --disable-warnings
# }

package() {
	cd "$pkgname-$_commit"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"
}
