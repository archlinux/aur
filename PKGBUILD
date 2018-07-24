# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Troy Engel <troyengel+arch@gmail.com>

pkgbase=bcc
pkgname=('bcc' 'bcc-tools' 'python-bcc' 'python2-bcc')
pkgver=0.6.1
pkgrel=1
pkgdesc='BPF Compiler Collection'
arch=('x86_64')
url='https://github.com/iovisor/bcc'
license=('Apache')
makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison' 'python' 'python2')
checkdepends=('netperf' 'iperf')
source=("https://github.com/iovisor/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('096fa1f8f612fdaa1fbe7b30e2d710b6e9b4dae5fe4a327baccce66589492007d81aa208d885efbfd77ffd97677e0af317f4088f955ffabceb41c8e93f44fa01')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	rm -rf build
	mkdir build
	cd build

	# The python version is irrelevant at this stage
	cmake -DREVISION="${pkgver}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib ..

	make
}

package_bcc() {
	pkgdesc='BPF Compiler Collection - C library and examples'
	depends=('linux-headers' 'libelf')
	optdepends=('bcc-tools: Python utilites using the BCC library'
		'python-bcc: Python 3 bindings for BCC'
		'python2-bcc: Python 2 bindings for BCC')
	makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison')
	provides=('bcc' 'libbcc')

	cd "${srcdir}/${pkgbase}-${pkgver}/build"

	# Install the kitchen sink
	make DESTDIR="${pkgdir}" install

	# These go in a split package python*-bcc
	rm -rf "${pkgdir}"/usr/lib/python*

	# These go in a split package bcc-tools
	rm -rf "${pkgdir}"/usr/share/bcc/{tools,man}
}

package_bcc-tools() {
	pkgdesc='BPF Compiler Collection - Tools'
	arch=('any')
	depends=('bcc' 'libedit' 'ethtool')
	optdepends=('python-bcc: Python 3 bindings for BCC'
		'python2-bcc: Python 2 bindings for BCC'
		'luajit: Lua bindings for BCC')

	cd "${srcdir}/${pkgbase}-${pkgver}/build/tools"
	make DESTDIR="${pkgdir}" install

	cd "${srcdir}/${pkgbase}-${pkgver}/build/man"
	make DESTDIR="${pkgdir}" install
}

package_python-bcc() {
	pkgdesc='BPF Compiler Collection - Python 3 bindings'
	arch=('any')
	depends=('bcc' 'python')
	optdepends=('python-netaddr2: Network address representation and manipulation'
		'python-pyroute2: Netlink and Linux network configuration')
	makedepends=('cmake')

	cd "${srcdir}/${pkgbase}-${pkgver}/build"

	# Force a quick python3 binding build (C library is already buidl)
	cmake -DREVISION="${pkgver}" \
		-DPYTHON_CMD="python" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib ..

	make

	# Install just those bindings
	make -C "${srcdir}/${pkgbase}-${pkgver}/build/src/python" DESTDIR="${pkgdir}" install
}

package_python2-bcc() {
	pkgdesc='BPF Compiler Collection - Python 2 bindings'
	arch=('any')
	depends=('bcc' 'python2')
	optdepends=('python2-netaddr2: Network address representation and manipulation'
		'python2-pyroute2: Netlink and Linux network configuration')
	makedepends=('cmake')

	cd "${srcdir}/${pkgbase}-${pkgver}/build"

	# Force a quick python2 binding build (C library is already buidl)
	cmake -DREVISION="${pkgver}" \
		-DPYTHON_CMD="python2" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib ..

	make

	# Install just those bindings
	make -C "${srcdir}/${pkgbase}-${pkgver}/build/src/python" DESTDIR="${pkgdir}" install
}
