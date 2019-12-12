# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Troy Engel <troyengel+arch@gmail.com>

pkgbase=bcc
pkgname=('bcc' 'bcc-tools' 'python-bcc' 'python2-bcc')
pkgver=0.12.0
_libbpf_commit='ab067ed'
pkgrel=1
pkgdesc='BPF Compiler Collection'
arch=('x86_64')
url='https://github.com/iovisor/bcc'
license=('Apache')
makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison' 'python' 'python2')
checkdepends=('netperf' 'iperf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/iovisor/${pkgname}/archive/v${pkgver}.tar.gz"
	"libbpf-${_libbpf_commit}.tar.gz"::"https://github.com/libbpf/libbpf/archive/${_libbpf_commit}.tar.gz")
sha512sums=('db3ea929b1296f4d9d82d2a11e89e11a1c31512d3f7f935475a7613e0128a5cf9441f3138969535ef41de0c0f677c7446f62f1c64575d41a9896e5339f3f112b'
            '6ea224609d8e11c3441c9ec4ffe71966650009453c9115206d12c2a6e1ebccffcbaee5d9a6ae34d44b6cd86afd1e8b32797310c0b97da42f85e049a5cae3e653')

prepare() {
	# Move git-submodule into right place without invoking git
	mv "${srcdir}/libbpf-${_libbpf_commit}"*/* "${srcdir}/${pkgbase}-${pkgver}/src/cc/libbpf"
}

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
	depends=('libelf')
	optdepends=('linux-headers: build against the Arch kernel'
		'bcc-tools: Python utilites using the BCC library'
		'python-bcc: Python 3 bindings for BCC'
		'python2-bcc: Python 2 bindings for BCC')
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
	optdepends=('python-netaddr: Network address representation and manipulation'
		'python-pyroute2: Netlink and Linux network configuration')

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
	optdepends=('python2-netaddr: Network address representation and manipulation'
		'python2-pyroute2: Netlink and Linux network configuration')

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
