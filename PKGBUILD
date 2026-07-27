# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Noah Sherwin <noahrsherwin@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

_name=click-extra
pkgname=python-${_name}
pkgver=8.6.2
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'

url="https://github.com/kdeldycke/${_name}"
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('uv' 'python-pip')
checkdepends=('uv' 'python-pytest')
depends=('python' 'python-click>=8.3.1' 'python-boltons' 'python-pygments' 'python-json5' 'python-hjson' 'python-tomli' 'python-tomlkit' 'python-yaml' 'python-cloup' 'python-deepmerge' 'python-extra-platforms' 'python-requests' 'python-tabulate' 'python-xmltodict' 'python-wcmatch' 'python-wcwidth' 'python-docutils' 'python-sphinx' 'python-myst-parser' 'python-pymdown-extensions' 'mkdocs')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('841c9b1c4a74c9e486916bae162b4836f5790f09a5111ad4eaf6b283fcab0b50e07a23a3fa4e18e558a0d1f8e8384bce6df0d394c031883fa37a30469387303d')

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
    uv run -- ${_name} --version

    # Unittests
    uv --no-progress run --frozen -- pytest -m once --cov --cov-report=term

    # Check if it runs outside of UV environment
    python -m click_extra --version
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    uv pip install --system --link-mode=copy --no-deps --prefix="${pkgdir}/usr" dist/*.whl

    rm "$pkgdir/usr/.lock"

    install -Dm0644 readme.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm0644 license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
