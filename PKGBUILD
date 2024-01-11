# Maintainer: Markus Koch <markus@notsyncing.net>
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=nvc-git
pkgver=r1.11.0.r36.gc1abb4b
pkgrel=1
pkgdesc="VHDL compiler and simulator"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/nickg/nvc"
license=('GPL3')
provides=('nvc')
conflicts=('nvc')
depends=(libelf llvm-libs ncurses zstd)
makedepends=(pkgconfig make flex check llvm tcl automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
noextract=()
md5sums=('SKIP')
_gitname=nvc
_gitver=master
source=("git+https://github.com/nickg/${_gitname}.git")

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_gitname}"
}

build() {
	cd "${srcdir}/${_gitname}"

	rm -rf _build
	mkdir _build
	cd _build

	../autogen.sh
	LDFLAGS="${LDFLAGS} -pthread" \
	CFLAGS="${CFLAGS} -pthread" \
	CXXFLAGS="${CXXFLAGS} -pthread" \
	../configure \
		--prefix=/usr \
		--disable-dependency-tracking \
		--enable-verilog \
		--enable-vital \
		--enable-lto \
		--with-llvm=/usr/bin/llvm-config \
		--with-bash-completion=/usr/share/bash-completion \
		--with-ncurses
	make && make bootstrap
}

check() {
	cd "${srcdir}/${_gitname}/_build"
	make check
}

package() {
	cd "${srcdir}/${_gitname}"
	make -C_build DESTDIR="${pkgdir}" install

	install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}

# EOF
