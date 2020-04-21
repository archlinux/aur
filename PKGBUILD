# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Troy Engel <troyengel+arch@gmail.com>

pkgbase=bcc
pkgname=('bcc' 'bcc-tools' 'python-bcc')
pkgver=0.13.0
pkgrel=2
pkgdesc='BPF Compiler Collection'
arch=('x86_64')
url='https://github.com/iovisor/bcc'
license=('Apache')
makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison' 'python')
checkdepends=('netperf' 'iperf')
source=("${pkgbase}-${pkgver}.tar.gz"::"https://github.com/iovisor/${pkgbase}/releases/download/v${pkgver}/${pkgbase}-src-with-submodule.tar.gz"
		"cmake_clang10_patch.patch"::"https://github.com/iovisor/bcc/commit/1599c2ef8206988d5d.patch")
sha512sums=('9f95f70bbebb3b5e175b2c513a51c024fdbe67283c02b81b56cdef74b1720b82df40a4555c1e1fdcfa56c64cd418abfa11b371e4111ffb3997c848f014690471'
            'eb6bf782385f5381b07235922d0ffdfa8d76c29f28aa2d43ee87097abfcdfaea6beb56939ab4e1070c1c51311d292996e72d865ccc3a5eddfd79dc145b246fa6')

prepare() {
	cd "${srcdir}/${pkgbase}"

	patch -Np1 -i ../cmake_clang10_patch.patch
}

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
