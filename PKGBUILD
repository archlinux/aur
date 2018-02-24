# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Troy Engel <troyengel+arch@gmail.com>

pkgbase=bcc
pkgname=('bcc' 'bcc-tools' 'python-bcc' 'python2-bcc')
pkgver=0.5.0
pkgrel=2
pkgdesc='BPF Compiler Collection'
arch=('x86_64')
url='https://github.com/iovisor/bcc'
license=('Apache')
makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison' 'python' 'python2')
checkdepends=('netperf' 'iperf')
source=("https://github.com/iovisor/${pkgname}/archive/v${pkgver}.tar.gz"
	'cherry-fix_build_issue_for_llvm_5.0.1.patch::https://github.com/iovisor/bcc/commit/bd7fa55bb39b8978dafd0b299e35616061e0a368.patch')
sha512sums=('12de5ef04185dccd0847fc97ae855b386e0c81b545ae497af797667925ebedf97164c17fb99468abae3f87fb3ddfdba5200070f80b3bbcad63c2355497012f0e'
            'f518f32584b1f828af5df00972c33e6efc7f4327fd65505156e6dec96e4e2f6e7fafb50fb0855693d586223dce4f6cbf7db34ae252358636decc5dbe7f6121a7')

prepare() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	patch -Np1 -i "${srcdir}/cherry-fix_build_issue_for_llvm_5.0.1.patch"
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
	depends=('linux-headers')
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
	depends=('bcc')
	optdepends=('python-bcc: Python 3 bindings for BCC'
		'python2-bcc: Python 2 bindings for BCC')

	cd "${srcdir}/${pkgbase}-${pkgver}/build/tools"
	make DESTDIR="${pkgdir}" install

	cd "${srcdir}/${pkgbase}-${pkgver}/build/man"
	make DESTDIR="${pkgdir}" install
}

package_python-bcc() {
	pkgdesc='BPF Compiler Collection - Python 3 bindings'
	arch=('any')
	depends=('bcc' 'python')
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
