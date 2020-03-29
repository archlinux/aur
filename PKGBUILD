# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=weechat-matrix
pkgver=0.1.0
_tag=f0249bd923607220508386aefb2cb2507e11669e # git show-ref "$pkgver"
pkgrel=1
pkgdesc='Weechat Matrix protocol script written in Python'
arch=('any')
url='https://github.com/poljar/weechat-matrix'
license=('ISC')
depends=('python-atomicwrites' 'python-attrs' 'python-future' 'python-logbook' 'python-matrix-nio'
         'python-pygments' 'python-pyopenssl' 'python-webcolors')
makedepends=('git')
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
}

check() {
	cd "$pkgname"
	python -m pytest
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr/share/weechat install
	for _script in matrix_decrypt matrix_sso_helper matrix_upload
	do
		install -Dm755 "contrib/$_script.py" "$pkgdir/usr/bin/$_script"
	done
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
