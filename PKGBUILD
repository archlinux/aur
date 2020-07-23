
# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=stellar-core-git
pkgver=v13.2.0.67.g670982dc
pkgrel=1
pkgdesc="core daemon for full nodes in the Stellar payment network"
arch=(x86_64 i686)
url="https://www.stellar.org/"
license=('APACHE')
depends=(postgresql)
makedepends=('git' 'parallel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=('git+https://github.com/stellar/stellar-core.git'
	'libmedida::git+https://github.com/stellar/medida.git'
	'git+https://github.com/stellar/libsodium.git'
	'git+https://github.com/xdrpp/xdrpp.git'
	'git+https://github.com/USCiLab/cereal'
	'git+https://github.com/chriskohlhoff/asio.git'
	'git+https://github.com/fmtlib/fmt'
	'git+https://github.com/stellar/tracy'
	)
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
        git describe --always --dirty --tags | sed -e 's/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init

	for dir in $(git config -f .gitmodules --list \
			    | sed -ne 's/[^=]*\.path=//p'); do
	    echo git config "submodule.$dir.url" "$srcdir/$(basename $dir)"
	    git config "submodule.$dir.url" "$srcdir/$(basename $dir)"
	done

	./autogen.sh
	./configure --prefix=/usr
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
