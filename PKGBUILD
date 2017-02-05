# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgname='lld-svn'
pkgver=294126
pkgrel=1
pkgdesc='The LLVM Linker'
license=('custom:University of Illinois/NCSA')
arch=('x86_64')
url='http://lld.llvm.org'
depends=('zlib' 'ncurses')
makedepends=('svn' 'cmake' 'ninja' 'python2')
provides=('lld')
conflicts=('lld')
source=('llvm::svn+http://llvm.org/svn/llvm-project/llvm/trunk'
        'lld::svn+http://llvm.org/svn/llvm-project/lld/trunk')
sha512sums=('SKIP' 'SKIP')

pkgver () {
	cd lld
	svnversion
}

prepare () {
	msg2 'Exporting LLD in the LLVM tree'
	svn export --force lld llvm/tools/lld > /dev/null
}

build () {
	mkdir -p llvm/build
	cd llvm/build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DLLVM_ENABLE_ASSERTIONS=OFF \
		-DPYTHON_EXECUTABLE=/usr/bin/python2 \
		-G Ninja ..
	ninja lld
}

package () {
	install -Dm644 llvm/tools/lld/LICENSE.TXT \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	DESTDIR="${pkgdir}" ninja -C llvm/build install-lld
}
