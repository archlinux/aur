# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Omar Sandoval <osandov@osandov.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Manuel Mendez <mmendez534@gmail.com>

pkgbase=bcc-git
pkgname=('bcc-git' 'bcc-tools-git' 'python-bcc-git')
pkgver=0.11.0.r951.gc65446b7
pkgrel=1
pkgdesc='BPF Compiler Collection - latest git code'
arch=('x86_64')
url='https://github.com/iovisor/bcc'
license=('Apache')
makedepends=('cmake' 'clang' 'llvm' 'flex' 'bison' 'python' 'git')
checkdepends=('netperf' 'iperf')
source=('bcc-git::git+https://github.com/iovisor/bcc')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${pkgname}"

	rm -rf build/
	mkdir -p build/
	cd build/

	export CFLAGS+=" -ffat-lto-objects"
	export CXXFLAGS+=" -ffat-lto-objects"

	# The python version is irrelevant at this stage
	cmake -DREVISION=$pkgver \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_INSTALL_LIBDIR=/usr/lib .. \
	  -DENABLE_LLVM_SHARED=1   # FS#71163

	make
}

package_bcc-git() {
	pkgdesc='BPF Compiler Collection - C library and examples - latest git code'
	depends=('clang' 'libelf')
	optdepends=('linux-headers: build modules against the Arch kernel'
		'linux-lts-headers: build modules against the LTS kernel'
		'linux-zen-headers: build modules against the ZEN kernel'
		'linux-hardened-headers: build modules against the HARDENED kernel'
		'bcc-tools: Python utilites using the BCC library'
		'python-bcc: Python 3 bindings for BCC')
	provides=("bcc=${pkgver}" "libbcc=${pkgver}")
	conflicts=('bcc' 'libbcc')

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
	depends=('bcc-git' 'libedit' 'ethtool')
	optdepends=('python-bcc-git: Python bindings for BCC'
		'luajit: Lua bindings for BCC')
	provides=("bcc-tools=${pkgver}")
	conflicts=('bcc-tools')

	cd "${srcdir}/${pkgbase}/build"

	make -C tools/ DESTDIR="${pkgdir}" install
	make -C man/ DESTDIR="${pkgdir}" install
}

package_python-bcc-git() {
	pkgdesc='BPF Compiler Collection - Python 3 bindings - latest git code'
	arch=('any')
	depends=('bcc-git' 'python')
	optdepends=('python-netaddr: Network address representation and manipulation'
		'python-pyroute2: Netlink and Linux network configuration')
	provides=("python-bcc=${pkgver}")
	conflicts=('python-bcc')

	cd "${srcdir}/${pkgbase}/build"

	# Force a quick python3 binding build (C library is already built)
	cmake -DREVISION="${pkgver}" \
		-DPYTHON_CMD="python" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib ..
	make -C src/python

	# Install just those bindings
	make -C src/python DESTDIR="${pkgdir}" install
}
