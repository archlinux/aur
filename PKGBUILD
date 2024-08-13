# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=psc-package-git
pkgver=0.6.2.r1.2817cfd
pkgrel=1
epoch=
pkgdesc="A package manager for PureScript based on package sets"
arch=('x86_64')
url="https://github.com/purescript/psc-package"
license=('BSD3')
groups=()
depends=()
makedepends=('ghc' 'stack' 'git' 'awk' 'zsh')
checkdepends=()
optdepends=()
provides=('psc-package')
conflicts=('psc-package' 'psc-package-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/purescript/psc-package.git#branch=master")
noextract=()
sha1sums=('SKIP')
validpgpkeys=()

pkgver() {
	# git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | head -n 1 | tr -d '\n'
	git -C "$srcdir/${pkgname%-git}" describe --long --tags \
		| awk -F '-' '{ sub(/^v/, ""); v = $1 ".r" $2 "." substr($3, 2); printf "%s", v; }'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	stack build
}

check() {
	cd "$srcdir/${pkgname%-git}"
	stack build --test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" zsh -c \
		'install -D -m 0755 -t "${DESTDIR}/usr/bin" ./.stack-work/**/psc-package(.xY1)'
	# find .stack-work -type f -name 'psc-package' -executable \
	# 	| grep -v 'install' \
	# 	| xargs install -D -m 0755 -t "$pkgdir/usr/bin"
	[ ! -e LICENSE ] \
		|| install -D -m 0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
