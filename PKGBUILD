# Maintainer: Dasith Gunawardhana <dasith.gunawardhana@gmail.com>

_pkgname=auther
pkgname=${_pkgname}-git
pkgver=r46.9e20e96
pkgrel=1
pkgdesc="A cross-platform OTP token manager"
arch=('x86_64')
url="https://gitlab.com/dg10a/auther.git"
license=('GPL3')
depends=('qt5-base' 'qt5-quickcontrols2')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://gitlab.com/dg10a/auther.git'
	'git+https://github.com/keepassxreboot/keepassxc.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	git submodule init
	git config submodule.deps/keepassxc.url "$srcdir/keepassxc"
	git submodule update
}

build() {
	cd "$srcdir/${_pkgname}"
	qmake-qt5
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
