# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pkgname=('bitwuzla')
pkgname=("${_pkgname}-git")
pkgver=0.8.0.r7.g1cc3415
pkgrel=1
pkgdesc='SMT solver for the theories of fixed-size bit-vectors, floating-point arithmetic, arrays and uninterpreted functions and their combinations'
arch=('x86_64')
url='https://bitwuzla.github.io'
license=('MIT')
source=("git+https://github.com/bitwuzla/bitwuzla.git")
depends=(
    'cryptominisat'
    'gcc-libs'
    'glibc'
    'gmp>=6.1'
)
makedepends=(
    'cmake'
    'cython'
    'doxygen'
    'git'
    'meson>=0.64'
    'ninja'
    'python-breathe'
    'python-sphinx'
    'python-sphinx-tabs'
    'python-sphinx_rtd_theme'
    'python-sphinxcontrib-bibtex'
    'python>=3.7'
    'python-sphinx'
)
checkdepends=(
    'gtest'
    'python-pytest'
)
optdepends=(
    'aiger: Utilities for And-Inverter Graphs (AIGs)'
    'python>=3.7: Python bindings'
)
provides=(
    "${_pkgname}"
    "${_pkgname}-docs"
    'libbitwuzlabv.so'
    'libbitwuzlabb.so'
    'libbitwuzlals.so'
    'libbitwuzla.so'
)
conflicts=("${_pkgname}" "${_pkgname}-docs")
b2sums=('SKIP')
options=('!lto')

build() {
    cd "${srcdir}/${_pkgname}"

    ./configure.py \
	--prefix /usr \
	--shared \
	--python \
	--testing \
	--docs \
	--kissat \
	--cryptominisat \
	--fpexp \
    	--aiger \
	release

    cd build
    meson compile
}

check() {
    cd "${srcdir}/${_pkgname}"
    meson test -C build
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

    install -Dm644 CONTRIBUTING.md "${pkgdir/}usr/share/doc/${_pkgname}/CONTRIBUTING.md"
    install -Dm644 NEWS.md "${pkgdir}/usr/share/doc/${_pkgname}/NEWS.md"

    cd build

    DESTDIR="${pkgdir}" ninja install

    cd docs

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
	 -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${_pkgname}/html/{}" \;

    install -Dm644 cli_usage.txt "${pkgdir}/usr/share/doc/${_pkgname}/cli_usage.txt"
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
