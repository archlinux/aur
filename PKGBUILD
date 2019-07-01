# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>
# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>

_pkgname=autofdo
pkgname=$_pkgname-git
pkgver=v0.1.r88.492384d
pkgrel=1
pkgdesc="a tool to convert perf.data profile to AutoFDO profile that can be used by GCC and LLVM"
arch=('x86_64')
url="https://github.com/google/autofdo"
license=('Apache')
depends=()
makedepends=('git' 'automake' 'libtool' 'llvm')
optdepends=('llvm: for LLVM support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_pkgname::git+$url"
        "git://github.com/google/perf_data_converter"
        "git://github.com/google/protobuf")
md5sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
	cd "$srcdir/${_pkgname}"
	git submodule init
	git config submodule.third_party/perf_data_converter.url $srcdir/perf_data_converter
	git config submodule.third_party/protobuf.url $srcdir/protobuf

	# Upstream kept empty directory when they they switched to submodules
	rm -rf third_party/perf_data_converter/*
	git submodule update --progress
}

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"

	aclocal -I .
	autoheader
	autoconf
	automake --add-missing -c

	./configure \
		--prefix=/usr \
		--with-llvm=/usr/lib
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}

