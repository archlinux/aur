# Maintainer: Florian Loitsch <florian@toit.io>
pkgname=toit
_tag="v2.0.0-alpha.75"
_repo="https://github.com/toitlang/toit.git"
_commit=9d7b24fbadac6d0af706d46c166400a9a5fd2170
_tag_no_dash="${_tag//-/}"
pkgver="${_tag_no_dash#v}"
pkgrel=1
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
depends=('gcc-libs')
makedepends=(
	'git'
	'cmake'
	'ninja'
	'go'
	# For xxd.
	'vim'
	# For the esp-tool.
	'python'
	'python-pip'
	'libusb'
)
source=("git+$_repo#commit=$_commit")
noextract=()
md5sums=('SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Initial the top-level modules but not nested ones.
	git submodule update --init .

	cd third_party/esp-idf
	# We only need mbedtls and esptool of the esp-idf submodule to build the host tools.
	# Don't bother initializing all the other components.
	git submodule update --init components/mbedtls
	git submodule update --init components/esptool_py
	# This is really dirty, but when building the esptool, we source
	# the esp-idf environment, which checks for the existence of the
	# esp-idf tools.
	./install.sh
}

build() {
	cd "$srcdir/${pkgname%-git}"
	TOIT_GIT_VERSION=v$pkgver make -j1 all
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
