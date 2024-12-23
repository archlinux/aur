# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torf-cli
pkgver=5.2.1
pkgrel=1
pkgdesc='A tool for creating, reading and editing torrent files'
arch=('any')
url='https://github.com/rndusr/torf-cli/'
license=('GPL-3.0-or-later')
depends=('python' 'python-torf' 'python-pyxdg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/rndusr/torf-cli/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-torf-cli-fix-timezone-issue-in-tests.patch'::'https://github.com/rndusr/torf-cli/commit/a14440155add93c0fe5f5366d5d1af6195db4d96.patch')
sha256sums=('7fa885a18a3e9fd586c038c8d4a648fac20932f90cd5be1971a24ac84c0f6037'
            '6bc653baeab37ee831051901cf70916fe422a6ebcb87d0f9e572dfd3c8b95718')

prepare() {
    # https://github.com/rndusr/torf-cli/issues/39
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-torf-cli-fix-timezone-issue-in-tests.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}"
    PYTHONPATH="$(pwd)/build/lib" pytest
}

package() {
    python -m installer --destdir="$pkgdir" "${pkgname}-${pkgver}/dist"/*.whl
    install -D -m644 "${pkgname}-${pkgver}/docs/torf.1" -t "${pkgdir}/usr/share/man/man1"
}
