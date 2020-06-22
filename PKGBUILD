# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Troy Engel <troyengel+arch@gmail.com>

pkgbase=bcc
pkgname=('bcc' 'bcc-tools' 'python-bcc')
pkgver=0.15.0
pkgrel=1
pkgdesc='BPF Compiler Collection'
arch=('x86_64')
url='https://github.com/iovisor/bcc'
license=('Apache')
makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison' 'python')
checkdepends=('netperf' 'iperf')
source=("${pkgbase}-${pkgver}.tar.gz"::"https://github.com/iovisor/${pkgbase}/releases/download/v${pkgver}/${pkgbase}-src-with-submodule.tar.gz")
sha512sums=('f2482553639d271091a000f244f9fb443c04035f95be74db0745a7df2ef1085f04b57747f6acbb8c062fa11b32fec5a811e957583b98786bd3b531a8bbe9f7e5')

build() {
	cd "${srcdir}/${pkgbase}"
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
	depends=('clang>=3.7.0' 'libelf')
	optdepends=('linux-headers: build modules against the Arch kernel'
		'linux-lts-headers: build modules against the LTS kernel'
		'linux-zen-headers: build modules against the ZEN kernel'
		'linux-hardened-headers: build modules against the HARDENED kernel'
		'bcc-tools: Python utilites using the BCC library'
		'python-bcc: Python 3 bindings for BCC')
	provides=('bcc' 'libbcc')

	cd "${srcdir}/${pkgbase}/build"

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
		'luajit: Lua bindings for BCC')

	make -C "${srcdir}/${pkgbase}/build/tools" DESTDIR="${pkgdir}" install
	make -C "${srcdir}/${pkgbase}/build/man" DESTDIR="${pkgdir}" install
}

package_python-bcc() {
	pkgdesc='BPF Compiler Collection - Python 3 bindings'
	arch=('any')
	depends=('bcc' 'python')
	optdepends=('python-netaddr: Network address representation and manipulation'
		'python-pyroute2: Netlink and Linux network configuration')

	cd "${srcdir}/${pkgbase}/build"

	# Force a quick python3 binding build (C library is already built)
	cmake -DREVISION="${pkgver}" \
		-DPYTHON_CMD="python" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib ..
	make -C "${srcdir}/${pkgbase}/build/src/python"

	# Install just those bindings
	make -C "${srcdir}/${pkgbase}/build/src/python" DESTDIR="${pkgdir}" install
}
