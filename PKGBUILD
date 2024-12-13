# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgbase=bitwuzla
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.7.0
pkgrel=1
pkgdesc='SMT solver for the theories of fixed-size bit-vectors, floating-point arithmetic, arrays and uninterpreted functions and their combinations'
arch=('x86_64')
url='https://bitwuzla.github.io'
license=('MIT')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/bitwuzla/bitwuzla/archive/refs/tags/${pkgver}.tar.gz"
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
    'python>=3.7: Python bindings'
)
provides=(
    'libbitwuzlabv.so'
    'libbitwuzlabb.so'
    'libbitwuzlals.so'
    'libbitwuzla.so'
)
b2sums=('fea8fb59d0dc3e45705e3aef7aa1cac1ebf0c0558e0994ada2806ac9589b3460783ff7b85e0b922d150f594e3d26ebf6cd9858f9b9df24f3850b19908252c188'
        '09f384aaa2ebbec1e70a5122bae2f2019b71a41f691312048dc59dd7c253c2eb07e669ab71decc492fdf58b933b55b0036da7bb54eb1afe0774ee28aca63f199'
        '7728ab77cb234b4427e7cf493817a24bf97440304efb4fc4300125ec470a0bf15430b4416d3c5fdea51dc91441640d05995ed4a08d4c628f97f4d4dc08538d7e')
options=('!lto')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch --forward --strip=1 --input=../0001-Use-installed-libraries.patch
    patch --forward --strip=1 --input=../0002-Skip-Test-based-on-timeout.patch
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
	--cryptominisat

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
