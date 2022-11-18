# Maintainer: Jesper Jensen <jesper at jnsn dot dev> 

_pkgname=local-lua-debugger-vscode
pkgname=${_pkgname}-git
pkgver=260
pkgrel=1
pkgdesc='A simple Lua debugger which requires no additional dependencies.'
arch=('any')
url="https://github.com/tomblind/${_pkgname}"
license=('MIT')
depends=( )
makedepends=('npm')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/tomblind/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git rev-list --count HEAD
}

prepare() {
	cd "$srcdir/$_pkgname"
	npm install --pure-lockfile --non-interactive
}

build() {
	cd "$srcdir/$_pkgname"
	npm run build
}

package() {
	cd "$srcdir/$_pkgname"
	install -d "${pkgdir}/usr/"{"bin","lib/node_modules/$_pkgname"}
	install -Dm644 -t "${pkgdir}/usr/lib/node_modules/$_pkgname/debugger/" ./debugger/*.lua
	install -Dm644 -t "${pkgdir}/usr/lib/node_modules/$_pkgname/extension/" ./extension/*.js
	cp -r node_modules "${pkgdir}/usr/lib/node_modules/$_pkgname/node_modules"

	printf '%s\n' '#!/usr/bin/env node' "require('/usr/lib/node_modules/$_pkgname/extension/debugAdapter');" >"${pkgdir}/usr/bin/local-lua-dbg"
	chmod 755 "${pkgdir}/usr/bin/local-lua-dbg"
}
