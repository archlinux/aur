# Contributor: Zhang Li <richselian at gmail.com>
# Maintainer : aksr <aksr at t-com dot me>
_pkgname=lcc
_pkgver=4_2
pkgname=${_pkgname}-compiler
pkgver=4.2
pkgrel=2
pkgdesc='A small and fast C compiler.'
arch=('i686' 'x86_64')
url='https://github.com/drh/lcc'
url='https://drh.github.io/lcc/'
license=('custom')
makedepends=('gcc')
source=("https://github.com/drh/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
install="${pkgname}".install
md5sums=('1ad390b4c2224cb65eb3a5e34da241f4')
sha1sums=('3fd2bc75c0aafc8f89da3e99786eb403e8a0fd0b')
sha256sums=('3941d7abbf767881c80efa34ce4b676066468f5f9bbb8d7fcae290a875b7160a')

build() {
	cd $srcdir/${_pkgname}-$_pkgver
	mkdir -p ${_pkgname}
	BUILDDIR=lcc make -j2 CFLAGS="-O2 -DLCCDIR='\"/usr/lib/lcc/\"'" HOSTFILE=./etc/linux.c lcc
	BUILDDIR=lcc make -j2 CFLAGS="-O2 -DLCCDIR='\"/usr/lib/lcc/\"'" all
}

package() {
	cd $srcdir/${_pkgname}-$_pkgver/${_pkgname}
	mkdir -p $pkgdir/usr/{bin,lib/${_pkgname}/include,man/man1}
	install -Dm755 bprint $pkgdir/usr/bin/bprint
	install -Dm755 lburg $pkgdir/usr/bin/lburg
	install -Dm755 lcc $pkgdir/usr/bin/lcc

	## rcc renamed to lcc-rcc to avoid a conflict with qtchooser
	install -Dm755 rcc $pkgdir/usr/bin/${_pkgname}-rcc

	install -Dm755 cpp $pkgdir/usr/lib/${_pkgname}/gcc/cpp
	mv liblcc.a librcc.a $pkgdir/usr/lib/${_pkgname}/
	install -Dm644 ../CPYRIGHT $pkgdir/usr/share/licenses/${_pkgname}/COPYRIGHT
	ln -s /usr/lib/gcc/*-linux-gnu/*/include/* $pkgdir/usr/lib/${_pkgname}/include/
	ln -s /usr/lib/gcc/*-linux-gnu/*/crt* $pkgdir/usr/lib/${_pkgname}/
	cp -f ../include/x86/linux/* $pkgdir/usr/lib/${_pkgname}/include/
	install -Dm644 ../doc/bprint.1 $pkgdir/usr/share/man/man1/bprint.1
	install -Dm644 ../doc/lcc.1 $pkgdir/usr/share/man/man1/lcc.1
}
