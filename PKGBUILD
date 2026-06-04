# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Noah Sherwin <noahrsherwin@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

_name=click-extra
pkgname=python-${_name}
pkgver=7.18.0
pkgrel=2
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'

url='https://github.com/kdeldycke/click-extra'
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('uv' 'python-pip')
depends=('python' 'python-boltons' 'python-pygments' 'python-click>=8.4.1' 'python-json5' 'python-hjson' 'python-tomli' 'python-tomlkit' 'python-yaml' 'python-cloup' 'python-deepmerge' 'python-extra-platforms' 'python-requests' 'python-tabulate' 'python-xmltodict' 'python-wcmatch' 'python-wcwidth' 'python-docutils' 'python-sphinx')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('73210f852306ccd2028e94bb0e5bb927b2ace9a8bcf7f59a0244d7bdd4e87af37b13684e7f2896adaed73e5bf4a3a837cd414805135242b1ec4787de3542bca0')

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    uv build
}

check() {
    cd "$srcdir/$_name-$pkgver"

    # Install project
    # Install all extras, so we can check any incompatibility.
    uv --no-progress sync --frozen --all-extras --group test

    # Run local CLI
    uv run -- click-extra --version

    # Unittests
    uv --no-progress run --frozen -- pytest -m once --cov --cov-report=term

    # Check if it runs outside of UV environment
    python -m click_extra --version
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    uv pip install --system --link-mode=copy --no-deps --prefix="${pkgdir}/usr" dist/*.whl

    rm "$pkgdir/usr/.lock"

    install -Dm0644 license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
