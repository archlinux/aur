# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=weechat-matrix
pkgver=0.3.0
_tag=ebf792a233a50d639b13e5f7c9a1c1fe988e7476 # git rev-parse "$pkgver"
pkgrel=10
pkgdesc='WeeChat Matrix protocol script written in Python'
arch=('any')
url='https://github.com/poljar/weechat-matrix'
license=('ISC')
depends=('python' 'python-atomicwrites' 'python-attrs' 'python-cachetools' 'python-logbook' 'python-matrix-nio'
         'python-olm' 'python-peewee' 'python-pygments' 'python-pyopenssl' 'python-webcolors' 'weechat')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-hypothesis' 'python-pytest')
optdepends=('python-aiohttp: matrix_sso_helper support'
            'python-magic: matrix_upload support'
            'python-requests: matrix_decrypt and matrix_upload support'
            'xdg-utils: default plumber for matrix_decrypt')
install='weechat-matrix.install'
source=(
  "git+$url.git?signed#tag=$_tag"
  0001-Switch-to-correct-build-system-definition.patch
)
sha512sums=('SKIP'
            '65be133214b4497fead85e718d3dc57502063f4411c759d878e7132b2cb49befe5515714edda188169710c246537d893611aa8ef6faeaeab23762302e6e783b6')
validpgpkeys=('689A3B5BC6560AB4C99A2A0581314DA807EF4E22') # Damir Jelić (poljar) <poljar@termina.org.uk>

pkgver() {
	cd "$pkgname"
	git describe | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	# fix PEP517 build-system definition: https://github.com/poljar/weechat-matrix/pull/340/files
	patch -Np1 -d $pkgname -i ../0001-Switch-to-correct-build-system-definition.patch

	cd "$pkgname"
	sed -ri 's|#!/usr/bin/env( -S)? python3|#!/usr/bin/python3|' contrib/*.py

	# Remove unnecessary dependency version pinning
	sed -i 's/= "^[0-9.]*"/= "*"/' pyproject.toml

	# SSLContext.set_npn_protocols broken in Python 3.10
	# (https://github.com/poljar/weechat-matrix/issues/308)
	git cherry-pick --no-commit 4e585d5f4628e6fbeba9ec4560b440d731e076f5
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
	cd "$pkgname"
	python -m pytest
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm755 main.py "$pkgdir/usr/share/weechat/python/weechat-matrix.py"
	for _script in matrix_decrypt matrix_sso_helper matrix_upload
	do
		install -Dm755 "contrib/$_script.py" "$pkgdir/usr/bin/$_script"
	done
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
