# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgbase=bitwuzla
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.8.2
pkgrel=2
pkgdesc='SMT solver for the theories of fixed-size bit-vectors, floating-point arithmetic, arrays and uninterpreted functions and their combinations'
arch=('x86_64')
url='https://bitwuzla.github.io'
license=('MIT')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/bitwuzla/bitwuzla/archive/refs/tags/${pkgver}.tar.gz"
    "0000-aiger-dynamic-build.patch::https://github.com/bitwuzla/bitwuzla/commit/929af621f6fe65c78236df70b8eb9343a5914d9f.patch"
    "0001-Use-installed-libraries.patch"
    "0002-Skip-Test-based-on-timeout.patch"
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
b2sums=('5bc5177930e073ae3d9dcbf5504f25f4af07f67fc03292a85ecc6e709f8e035086307f1aa54be4d2fd17e030049165a4b787e9b2f4270d06c27c27dfe34c1609'
        'c9e43030ddb20ba1dce8491644c4589091a231f4f36c3c2ee17b5eaa1f9cbbabb06af9668bc726e6c9f1b799fbc89e76b332204badd75410ec777a9fd500df91'
        '09f384aaa2ebbec1e70a5122bae2f2019b71a41f691312048dc59dd7c253c2eb07e669ab71decc492fdf58b933b55b0036da7bb54eb1afe0774ee28aca63f199'
        'af3f5fd996fd2d478c99f4e9fdd9ff72a3e00351e168b09d0611429d0267b55f5dfa46b98e414039edbab35461c3dc377a3f590b4b90db16ebcf0872a4ee8bda')
options=('!lto')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch --forward --strip=1 --input=../0000-aiger-dynamic-build.patch
    patch --forward --strip=1 --input=../0001-Use-installed-libraries.patch
    patch --forward --strip=1 --input=../0002-Skip-Test-based-on-timeout.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # aiger does not provide a library to link against. bitwuzla uses only .c/.h
    # files during compilation. aiger is kept as meson subproject. Thus, there
    # are no aiger run-time dependencies.


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
