# Maintainer: Omar Sandoval <osandov@osandov.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Manuel Mendez <mmendez534@gmail.com>

pkgbase=bcc-git
pkgname=('bcc-git' 'bcc-tools-git' 'python-bcc-git' 'python2-bcc-git')
pkgver=v0.5.0.r305.7c27c271
pkgrel=1
pkgdesc='BPF Compiler Collection - latest git code'
arch=('x86_64')
url='https://github.com/iovisor/bcc'
license=('Apache')
conflicts=('bcc')
makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison' 'python' 'python2')
checkdepends=('netperf' 'iperf')
source=('bcc-git::git+https://github.com/iovisor/bcc')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${pkgbase}"
	rm -rf build
	mkdir build
	cd build

	# The python version is irrelevant at this stage
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib ..

	make
}

package_bcc-git() {
	pkgdesc='BPF Compiler Collection - C library and examples - latest git code'
	depends=('linux-headers')
	optdepends=('bcc-tools-git: Python utilites using the BCC library'
		'python-bcc-git: Python 3 bindings for BCC'
		'python2-bcc-git: Python 2 bindings for BCC')
	makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison')
	provides=('bcc-git' 'libbcc-git')

	cd "${srcdir}/${pkgbase}/build"

	# Install the kitchen sink
	make DESTDIR="${pkgdir}" install

	# These go in a split package python*-bcc-git
	rm -rf "${pkgdir}"/usr/lib/python*

	# These go in a split package bcc-tools-git
	rm -rf "${pkgdir}"/usr/share/bcc/{tools,man}
}

package_bcc-tools-git() {
	pkgdesc='BPF Compiler Collection - Tools - latest git code'
	arch=('any')
	depends=('bcc-git')
	conflicts=('bcc-tools')
	optdepends=('python-bcc-git: Python 3 bindings for BCC'
		'python2-bcc-git: Python 2 bindings for BCC')

	cd "${srcdir}/${pkgbase}/build/tools"
	make DESTDIR="${pkgdir}" install

	cd "${srcdir}/${pkgbase}/build/man"
	make DESTDIR="${pkgdir}" install
}

package_python-bcc-git() {
	pkgdesc='BPF Compiler Collection - Python 3 bindings - latest git code'
	arch=('any')
	depends=('bcc-git' 'python')
	makedepends=('cmake')

	cd "${srcdir}/${pkgbase}/build"

	# Force a quick python3 binding build (C library is already buidl)
	cmake -DREVISION="${pkgver}" \
		-DPYTHON_CMD="python" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib ..

	make

	# Install just those bindings
	make -C "${srcdir}/${pkgbase}/build/src/python" DESTDIR="${pkgdir}" install
}

package_python2-bcc-git() {
	pkgdesc='BPF Compiler Collection - Python 2 bindings - latest git code'
	arch=('any')
	depends=('bcc-git' 'python2')
	makedepends=('cmake')

	cd "${srcdir}/${pkgbase}/build"

	# Force a quick python2 binding build (C library is already buidl)
	cmake -DPYTHON_CMD="python2" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib ..

	make

	# Install just those bindings
	make -C "${srcdir}/${pkgbase}/build/src/python" DESTDIR="${pkgdir}" install
}
