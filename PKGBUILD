# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Noah Sherwin <noahrsherwin@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

_name=click-extra
pkgname=python-${_name}
pkgver=9.1.0
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'

url="https://github.com/kdeldycke/${_name}"
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('uv' 'python-pip')
checkdepends=('uv' 'python-pytest')
depends=('python' 'python-click>=8.4.1' 'python-boltons' 'python-pygments' 'python-json5' 'python-hjson' 'python-tomli' 'python-tomlkit' 'python-yaml' 'python-cloup' 'python-deepmerge' 'python-extra-platforms' 'python-requests' 'python-tabulate' 'python-xmltodict' 'python-wcmatch' 'python-wcwidth' 'python-docutils' 'python-sphinx' 'python-myst-parser' 'python-pymdown-extensions' 'mkdocs')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('01a383e383f0bef05fa8b772b60747314f3f849cfed0e6bd38b13b2a1627bb8e1b3e561c5c3c138ef154dce23000a58e613e3032696925e71298c32a06737f8c')


build() {
    cd "${srcdir}/${_name}-${pkgver}"

    uv build
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"

    # Install project
    # Install all extras, so we can check any incompatibility.
    uv --no-progress sync --frozen --all-extras --group test

    # Run local CLI
    uv run -- "${_name}" --version

    # Unittests
    uv --no-progress run --frozen -- pytest -m once --cov --cov-report=term --cov-fail-under=16

    # Check if it runs outside of UV environment
    python -m click_extra --version
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    uv pip install --system --link-mode=copy --no-deps --prefix="${pkgdir}/usr" dist/*.whl

    rm "$pkgdir/usr/.lock"

    install -Dm0644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm0644 "license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
