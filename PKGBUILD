# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=weechat-matrix
pkgver=0.2.0
_tag=16d8e979166aec92cb55cd7e946e84606fffa8f4 # git rev-parse "$pkgver"
pkgrel=4
pkgdesc='WeeChat Matrix protocol script written in Python'
arch=('any')
url='https://github.com/poljar/weechat-matrix'
license=('ISC')
depends=('python' 'python-atomicwrites' 'python-attrs' 'python-future' 'python-logbook'
         'python-matrix-nio' 'python-pygments' 'python-pyopenssl' 'python-webcolors' 'weechat')
makedepends=('git' 'python-dephell' 'python-setuptools')
checkdepends=('python-hypothesis' 'python-pytest')
optdepends=('python-aiohttp: matrix_sso_helper support'
            'python-magic: matrix_upload support'
            'python-requests: matrix_decrypt and matrix_upload support'
            'ranger: default plumber for matrix_decrypt')
install='weechat-matrix.install'
source=("git+$url.git?signed#tag=$_tag")
sha512sums=('SKIP')
validpgpkeys=('689A3B5BC6560AB4C99A2A0581314DA807EF4E22') # Damir Jelić (poljar) <poljar@termina.org.uk>

pkgver() {
	cd "$pkgname"
	git describe | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	sed -ri 's|#!/usr/bin/env( -S)? python3|#!/usr/bin/python3|' contrib/*.py

	# Fix condition to not force the user through the SSO process
	# (https://github.com/poljar/weechat-matrix/issues/260)
	git cherry-pick --no-commit ef09292005d67708511a44c8285df1342ab66bd1

	dephell deps convert --from pyproject.toml --to setup.py
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
