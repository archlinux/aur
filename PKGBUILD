# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgbase=bitwuzla
pkgname=("${pkgbase}" "${pkgbase}-doc")
pkgver=0.4.0
pkgrel=1
pkgdesc='SMT solver for the theories of fixed-size bit-vectors, floating-point arithmetic, arrays and uninterpreted functions and their combinations'
arch=('x86_64')
url='https://bitwuzla.github.io'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitwuzla/bitwuzla/archive/refs/tags/${pkgver}.tar.gz"
	"0001-Use-installed-libraries.patch"
	"0002-Skip-Test-based-on-timeout.patch"
	"0003-Do-not-require-git.patch" # git is only used to pull not installed dependencies
       )
depends=('gcc-libs' 'glibc' 'gmp>=6.1' 'kissat')
makedepends=(
    'cadical>=1.5.0'
    'cmake'
    'cython'
    'doxygen'
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
    'bitwuzla.cpython-311-x86_64-linux-gnu.so'
    'libbitwuzlabv.so'
    'libbitwuzlabb.so'
    'libbitwuzlals.so'
    'libbitwuzla.so')
b2sums=('135ed8dbe8ada22ca36f872ccc062622bfdfa87592cfcad596f9c1c0c92c99a486a7ff52707fe7dba33531405cd6c84a20a3f546d3614585721f6b7468dc2894'
        '0ebea6754d4fc270c268d4088af9bcb93596fe5ec7b1065f83d39e5c56eef93d567592443ec0a460a34bf5829b5b54f2c9971644f6fbbebbf9c43a1b440ac54d'
        '7728ab77cb234b4427e7cf493817a24bf97440304efb4fc4300125ec470a0bf15430b4416d3c5fdea51dc91441640d05995ed4a08d4c628f97f4d4dc08538d7e'
        '7c80c06aec86c5c75a72786cfafa03d703950efa5639726abec5466b82928ae231eed75bff29d056d6e47bf2e4ab1ce4f9634fd96f9454d0b92d90c30fd26f37')
options=('!lto')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input=../0001-Use-installed-libraries.patch
    patch --forward --strip=1 --input=../0002-Skip-Test-based-on-timeout.patch
    patch --forward --strip=1 --input=../0003-Do-not-require-git.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure.py --prefix /usr --shared --python --testing --docs --kissat

    cd build
    ninja
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

package_bitwuzla-doc() {
    pkgdesc="Documentation for the Bitwuzla SMT solver"
    arch=('any')
    depends=()

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
