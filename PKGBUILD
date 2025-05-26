# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgbase=bitwuzla
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.8.0
pkgrel=1
pkgdesc='SMT solver for the theories of fixed-size bit-vectors, floating-point arithmetic, arrays and uninterpreted functions and their combinations'
arch=('x86_64')
url='https://bitwuzla.github.io'
license=('MIT')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/bitwuzla/bitwuzla/archive/refs/tags/${pkgver}.tar.gz"
    "0001-Use-installed-libraries.patch"
    "0002-Skip-Test-based-on-timeout.patch"
    "0003-Refactor-FP_FP-unit-test-to-not-require-FPEXP.patch::https://github.com/bitwuzla/bitwuzla/commit/d090786042aaceef6d39cf55c22daf5fb74457f5.patch"
    "0004-Enable-unit-test-specific-code-for-urem-when-unit-testing.patch::https://github.com/bitwuzla/bitwuzla/commit/bdc83e1f06ce2851c86cce16a604c3c47b254d2d.patch"
    "0005-Refactor-N_TESTS-handling-in-test_bv-unit-test.patch::https://github.com/bitwuzla/bitwuzla/commit/a623930e3c12c3932301bd68c54590a15e6bfa69.patch"
)
depends=(
    'cryptominisat'
    'gcc-libs'
    'glibc'
    'gmp>=6.1'
    'kissat'
)
makedepends=(
    'cadical>=1.5.0'
    'cmake'
    'cython'
    'doxygen'
    'git' # Version string gets generated from git
    'gtest' # Needed even with --nocheck
    'meson>=0.64'
    'ninja'
    'python-breathe'
    'python-pytest' # Needed even with --nocheck
    'python-sphinx'
    'python-sphinx-tabs'
    'python-sphinx_rtd_theme'
    'python-sphinxcontrib-bibtex'
    'python>=3.7'
    'symfpu-cvc5'
)
optdepends=(
    'aiger: Utilities for And-Inverter Graphs (AIGs)'
    'python>=3.7: Python bindings'
)
provides=(
    'libbitwuzlabv.so'
    'libbitwuzlabb.so'
    'libbitwuzlals.so'
    'libbitwuzla.so'
)
b2sums=('924742ca0dbcc9c877599b9175c2e48612b88b116976fa1460ca848b598d3bf9f62245d1f9d4ac6b59fdcc80a91a6490ba5d5466e3523510f95a13dd4053a792'
        '09f384aaa2ebbec1e70a5122bae2f2019b71a41f691312048dc59dd7c253c2eb07e669ab71decc492fdf58b933b55b0036da7bb54eb1afe0774ee28aca63f199'
        'af3f5fd996fd2d478c99f4e9fdd9ff72a3e00351e168b09d0611429d0267b55f5dfa46b98e414039edbab35461c3dc377a3f590b4b90db16ebcf0872a4ee8bda'
        'd8fe8f9dba8648809131c30abf22e767d303804983947548e58c844f9273ee42c29f81cd106e1a1e5049edd724131e1e7ddc95d69097a4c5176a73753430df83'
        'f688a6ec835396f80711f89ceb1045defcb5a3abd3b6174fb34087046c2d2e215d67f44c4784798f0e830e8a2c3ea6cee088f5b0b9f66c1ea18a61c3c2d77414'
        'a100b00f882816591c80ef2d497b5181bb4f128a297748ed913849d60988e61d2687fd2a9ce3aa2d0a979af2ca3435047cc8cdfa50978ce4112d85c4e5214578')
options=('!lto')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch --forward --strip=1 --input=../0001-Use-installed-libraries.patch
    patch --forward --strip=1 --input=../0002-Skip-Test-based-on-timeout.patch

    # Patch tests broken in 0.8.0
    patch --forward --strip=1 --input=../0003-Refactor-FP_FP-unit-test-to-not-require-FPEXP.patch
    patch --forward --strip=1 --input=../0004-Enable-unit-test-specific-code-for-urem-when-unit-testing.patch
    patch --forward --strip=1 --input=../0005-Refactor-N_TESTS-handling-in-test_bv-unit-test.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure.py \
	--prefix /usr \
	--shared \
	--python \
	--testing \
	--docs \
	--kissat \
	--cryptominisat \
	--aiger \
	release

    cd build
    meson compile
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson test -C build
}

package_bitwuzla() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 CONTRIBUTING.md "${pkgdir/}usr/share/doc/${pkgname}/CONTRIBUTING.md"

    install -Dm644 NEWS.md "${pkgdir}/usr/share/doc/${pkgname}/NEWS.md"

    cd build

    DESTDIR="${pkgdir}" ninja install
}

package_bitwuzla-docs() {
    pkgdesc="Documentation for the Bitwuzla SMT solver"
    arch=('any')
    depends=()
    provides=()

    cd "${srcdir}/${pkgbase}-${pkgver}"

    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"

    cd build/docs

    # Do not copy documentation source files
    find . \
	 -not -path "./.*" \
	 -not -path "./_sources*" \
	 -not -path "./conf.py" \
	 -not -path "./cli_usage.txt" \
	 -not -path "./c/xml*" \
	 -not -path "./c/Doxyfile" \
	 -not -path "./cpp/xml*" \
	 -not -path "./cpp/Doxyfile" \
	 -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgbase}/html/{}" \;

    install -Dm644 cli_usage.txt "${pkgdir}/usr/share/doc/${pkgbase}/cli_usage.txt"
}
