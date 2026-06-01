# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgbase=bitwuzla
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.9.1
pkgrel=1
pkgdesc='SMT solver for the theories of fixed-size bit-vectors, floating-point arithmetic, arrays and uninterpreted functions and their combinations'
arch=('x86_64')
url='https://bitwuzla.github.io'
license=('MIT')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/bitwuzla/bitwuzla/archive/refs/tags/${pkgver}.tar.gz"
    "0000-Use-installed-libraries.patch"
)
depends=(
    'cryptominisat'
    'glibc'
    'gmp>=6.1'
    'kissat'
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
    'cadical: CaDiCaL support'
    'python>=3.7: Python bindings'
)
provides=(
    'libbitwuzlabv.so'
    'libbitwuzlabb.so'
    'libbitwuzlals.so'
    'libbitwuzla.so'
)
b2sums=('b694149cd724ae569345d9f3386c0bcd8ae9f13259d7c10aa8f45d4d273b145c33a81aac30ab61aa70d2d31a0dc0d1847c300307f8ed4b888fa81387117f5086'
        '96897dada985c929820c7285a4e968977786e58e18b632dff06414ed71572a9139c0dad7a20705c03ff462cc954e5ffccb331d1ead100cd085686a5fc1d79fa3')
options=('!lto')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch --forward --strip=1 --input=../0000-Use-installed-libraries.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # aiger does not provide a library to link against. bitwuzla uses only .c/.h
    # files during compilation. aiger is kept as meson subproject. Thus, there
    # are no aiger run-time dependencies.

    # cadical only provides a static library and requires header files from the
    # source. Thus we use cadical as a subproject

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
