# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Adrian Sinclair <adrian at adrusi dot com>

_pkgname=terra
pkgname=$_pkgname-git
pkgver=1.0.0beta2.r22.g55a73e0
pkgrel=2
pkgdesc="Low-level system programming language designed to interoperate seamlessly with Lua"
url="http://terralang.org/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('clang' 'git' 'llvm')
_ljc=9143e86498436892cb4316550be4d45b68a61224
source=("git://github.com/zdevito/terra.git"
		"LuaJIT-$_ljc.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/$_ljc.tar.gz")
sha256sums=('SKIP'
            'befe68612bcc9b812bafd1e596154214848941ed9193c65b5a844540a6af5a4d')

prepare() {
	cd "$_pkgname"
	cat <<- EOF > Makefile.inc
		LLVM_CONFIG := $(which llvm-config)
		CLANG := $(which clang)
	EOF
	cp ../LuaJIT-$_ljc.tar.gz build/
	sed -e '/curl/d;/wget/d' -i Makefile
}

pkgver() {
	cd "$_pkgname"
	git describe --tags --abbrev=7 --match="release-[0-9\.]*" HEAD |
		sed 's/release-//;s/-beta/beta/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	cp -r release "$pkgdir/usr"
}
