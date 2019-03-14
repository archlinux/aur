# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Troy Engel <troyengel+arch@gmail.com>

pkgbase=bcc
pkgname=('bcc' 'bcc-tools' 'python-bcc' 'python2-bcc')
pkgver=0.9.0
_libbpf_commit='5beb8a2ebffd1045e3edb9b522d6ff5bb477c541'
pkgrel=1
pkgdesc='BPF Compiler Collection'
arch=('x86_64')
url='https://github.com/iovisor/bcc'
license=('Apache')
makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison' 'python' 'python2')
checkdepends=('netperf' 'iperf')
source=("https://github.com/iovisor/${pkgname}/archive/v${pkgver}.tar.gz"
	"libbpf-${_libbpf_commit}.tar.gz"::"https://github.com/libbpf/libbpf/archive/${_libbpf_commit}.tar.gz")
sha512sums=('373080181380ec3bcb13469e29ff1f792e924a2df00a614da4647ed54060ad216525dd0f49c5d0afba7946a6d2f4e3475af97250a33db825945af3d165294091'
            '42e62d92785164d8ee6b0aecc2446c982ef56d4413b089367ab1fcb5895c5b8211ad060217c4e11cbea9b6d1dd98092076068a3cbc6beeed3e1a758226138809')

prepare() {
	# Move git-submodule into right place without invoking git
	mv "${srcdir}/libbpf-${_libbpf_commit}/"* "${srcdir}/${pkgbase}-${pkgver}/src/cc/libbpf"
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
	depends=('linux-headers' 'libelf')
	optdepends=('bcc-tools: Python utilites using the BCC library'
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
	optdepends=('python-netaddr2: Network address representation and manipulation'
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
	optdepends=('python2-netaddr2: Network address representation and manipulation'
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
