# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgbase=bitwuzla
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.10.0
pkgrel=2
pkgdesc='SMT solver for the theories of fixed-size bit-vectors, floating-point arithmetic, arrays and uninterpreted functions and their combinations'
arch=('x86_64')
url='https://bitwuzla.github.io'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitwuzla/bitwuzla/archive/refs/tags/${pkgver}.tar.gz")
depends=(
    'cryptominisat'
    'glibc'
    'gmp>=6.1'
#    'kissat'
    'libgcc'
    'libstdc++'
    'mpfr'
)
makedepends=(
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
    'symfpu'
)
optdepends=(
    'aiger: Utilities for And-Inverter Graphs (AIGs)'
#    'cadical: CaDiCaL support'
    'python>=3.7: Python bindings'
)
provides=(
    'libbitwuzlabv.so'
    'libbitwuzlabb.so'
    'libbitwuzlals.so'
    'libbitwuzla.so'
)
b2sums=('065f768bdfa9299ef6f1bb6f8da2cc3d7b2b145583a9d656ad7dad91d5be48bfdc0bdb5caa83c2929dbff9508f86dfe038bd998896bf3bac8b69c5c952e99cdf')
options=('!lto')

prepare() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    # Force the bundled, patched CaDiCaL subproject
    sed -i "s/find_library('cadical',/find_library('cadical-bundled-only',/" src/meson.build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # aiger does not provide a library to link against. bitwuzla uses only .c/.h
    # files during compilation. aiger is kept as meson subproject. Thus, there
    # are no aiger run-time dependencies.

    # cadical only provides a static library and requires header files from the
    # source. Thus we use cadical as a subproject

    # TODO Kissat is an optional, alternative SAT solver Currently, does not
    # work with LTO, so we exclude it until upstream fixes it
    #
    # Bitwuzla requires a specific cryptominisat version, so use the meson
    # dependency rather than the Arch version
    ./configure.py \
	--prefix /usr \
	--shared \
	--python \
	--testing \
	--docs \
	--cryptominisat \
	--aiger \
	--no-lto \
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
    install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"

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
