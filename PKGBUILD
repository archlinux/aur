# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=weechat-matrix
pkgver=0.3.0
_tag=ebf792a233a50d639b13e5f7c9a1c1fe988e7476 # git rev-parse "$pkgver"
pkgrel=5
pkgdesc='WeeChat Matrix protocol script written in Python'
arch=('any')
url='https://github.com/poljar/weechat-matrix'
license=('ISC')
depends=('python' 'python-atomicwrites' 'python-attrs' 'python-logbook' 'python-matrix-nio'
         'python-pygments' 'python-pyopenssl' 'python-webcolors' 'weechat')
makedepends=('git' 'python-dephell' 'python-setuptools')
checkdepends=('python-hypothesis' 'python-pytest')
optdepends=('python-aiohttp: matrix_sso_helper support'
            'python-magic: matrix_upload support'
            'python-requests: matrix_decrypt and matrix_upload support'
            'xdg-utils: default plumber for matrix_decrypt')
install='weechat-matrix.install'
source=("git+$url.git?signed#tag=$_tag"
        'weechat-matrix_py3.10-remove-set_npn_protocols.patch')
sha512sums=('SKIP'
            '5dd6cee976de77a6747e238b3600bb0e83322482daedc7943d712ecc8e903cb452f46133a4fbb4f43e562dc7c2acffc5e8eece7e87ae21ca4affc5089444cc95')
validpgpkeys=('689A3B5BC6560AB4C99A2A0581314DA807EF4E22') # Damir Jelić (poljar) <poljar@termina.org.uk>

pkgver() {
	cd "$pkgname"
	git describe | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	sed -ri 's|#!/usr/bin/env( -S)? python3|#!/usr/bin/python3|' contrib/*.py
	dephell deps convert --from pyproject.toml --to setup.py

	# Remove deprecated function which is broken in Python 3.10
	patch --forward --strip=1 --input="$srcdir/weechat-matrix_py3.10-remove-set_npn_protocols.patch"
}

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
	python -m pytest
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm755 main.py "$pkgdir/usr/share/weechat/python/weechat-matrix.py"
	for _script in matrix_decrypt matrix_sso_helper matrix_upload
	do
		install -Dm755 "contrib/$_script.py" "$pkgdir/usr/bin/$_script"
	done
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
