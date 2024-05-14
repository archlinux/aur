# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pkgname=('bitwuzla')
pkgname=("${_pkgname}-git")
pkgver=0.4.0.r51.g31330f2
pkgrel=1
pkgdesc='SMT solver for the theories of fixed-size bit-vectors, floating-point arithmetic, arrays and uninterpreted functions and their combinations'
arch=('x86_64')
url='https://bitwuzla.github.io'
license=('MIT')
source=("git+https://github.com/bitwuzla/bitwuzla.git"
       	"0001-Use-installed-libraries.patch"
	"0002-Skip-Test-based-on-timeout.patch"
       )
depends=('gcc-libs' 'glibc' 'gmp>=6.1' 'kissat')
makedepends=(
    'cadical>=1.5.0'
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
    'symfpu-cvc5'
)
checkdepends=('gtest' 'python-pytest')
optdepends=(
    'cryptominisat5: Support for the CryptoMiniSat SAT solver'
    'python>=3.7: Python bindings'
)
provides=(
    "${_pkgname}=$pkgver"
    'libbitwuzlabv.so'
    'libbitwuzlabb.so'
    'libbitwuzlals.so'
    'libbitwuzla.so')
conflicts=("${_pkgname}")
b2sums=('SKIP'
        '0ebea6754d4fc270c268d4088af9bcb93596fe5ec7b1065f83d39e5c56eef93d567592443ec0a460a34bf5829b5b54f2c9971644f6fbbebbf9c43a1b440ac54d'
        '7728ab77cb234b4427e7cf493817a24bf97440304efb4fc4300125ec470a0bf15430b4416d3c5fdea51dc91441640d05995ed4a08d4c628f97f4d4dc08538d7e')
options=('!lto')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch --forward --strip=1 --input=../0001-Use-installed-libraries.patch
    patch --forward --strip=1 --input=../0002-Skip-Test-based-on-timeout.patch
}

build() {
    cd "${srcdir}/${_pkgname}"

    ./configure.py --prefix /usr --shared --python --testing --docs --kissat

    cd build
    ninja
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
