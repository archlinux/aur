# Maintainer: Florian Loitsch <florian@toit.io>
pkgname=toit
_tag="v2.0.0-alpha.121"
_repo="https://github.com/toitlang/toit.git"
_commit=8b8e4959a555cdc605545ef35ac56029b3bf5b2b
_tag_no_dash="${_tag//-/}"
pkgver="${_tag_no_dash#v}"
pkgrel=1
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
depends=('gcc-libs' 'esptool')
makedepends=(
	'git'
	'cmake'
	'ninja'
	'go'
	# For xxd.
	'vim'
)
source=("git+$_repo#commit=$_commit")
noextract=()
md5sums=('SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Initial the top-level modules but not nested ones.
	git submodule update --init .

	cd third_party/esp-idf
	# We only need mbedtls of the esp-idf submodule to build the host tools.
	# Don't bother initializing all the other components.
	git submodule update --init components/mbedtls
}

build() {
	cd "$srcdir/${pkgname%-git}"
	TOIT_GIT_VERSION=$_tag make -j1 sdk
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toit.run" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toit.compile" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toit.pkg" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toit.lsp" "$pkgdir/usr/bin"
}
