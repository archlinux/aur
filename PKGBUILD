# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Kevin Deldycke <kevin at deldycke dot com>
# Maintainer: Noah Sherwin <noahrsherwin@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

_name=click-extra
pkgname=python-${_name}
pkgver=9.5.1
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'

url="https://github.com/kdeldycke/${_name}"
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('python-build' 'python-installer' 'python-uv-build')
checkdepends=('git' 'python-hjson' 'python-jsonschema' 'python-pygments' 'python-pytest' 'python-pytest-httpserver' 'python-requests' 'python-tomlkit' 'python-xmltodict' 'python-yaml')
depends=('python' 'python-boltons' 'python-click>=8.4.1' 'python-cloup' 'python-deepmerge' 'python-extra-platforms' 'python-tabulate' 'python-wcmatch' 'python-wcwidth')
optdepends=('python-hjson: HJSON configuration files and table format'
            'python-json5: JSON5 configuration files'
            'python-tomlkit: TOML table format'
            'python-xmltodict: XML configuration files and table format'
            'python-yaml: YAML configuration files and table format'
            'python-pygments: ANSI formatter, filter and lexers for Pygments'
            'python-sphinx: click:source and click:run directives for Sphinx'
            'mkdocs: ANSI color rendering in MkDocs code blocks'
            'python-pymdown-extensions: ANSI color rendering in MkDocs code blocks')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1cc2d6bae9a9a528be3c606b4083e99c7b46a5275797210e765c8835862d321218f35b697dc8c7cb6ccaa31f31e06a19cbca27dce6a1de5708d7371c37e273e7')


build() {
    cd "${srcdir}/${_name}-${pkgver}"

    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"

    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl

    test-env/bin/python -m pytest -m "not network"
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm0644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm0644 "license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
