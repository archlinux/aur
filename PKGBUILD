# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="harlequin"
pkgver=2.7.0
pkgrel=1
pkgdesc="The SQL IDE for Your Terminal"
url="https://harlequin.sh/"
license=("MIT")
arch=("any")
depends=('python'
         'python-textual'
         'python-textual-fastdatatable'
         'python-textual-textarea'
         'python-click'
         'python-rich-click'
         'python-boto3'
         'python-duckdb'
         'python-shandy-sqlfmt'
         'python-platformdirs'
         'python-pyperclip'
         'python-importlib-metadata'
         'python-tree-sitter-sql'
         'python-tomli'
         'python-tomlkit'
         'python-questionary'
         'python-black'
         'python-ruff'
         'mypy')
optdepends=('harlequin-mysql: MySQL support'
            'harlequin-postgres: Postgres support'
            'harlequin-odbc: ODBC support')

options=("!strip")

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "fix-warnings.patch")
b2sums=('2b5949373f9563859854a50eddfd9c96a23c25d16494fb5cfd4dccb19ea849aae87e3c597bf001b2257cc706a02e301fdc99830181bd772e3c28ae20331ae1b7'
        '74ca51c3958da81afc68ca1cdec196337d14886d87bfdc4ad74f0b9f321f73325c009d1a2ae22383e851c09707b3d3ebf3c58fb10185c1623881118410ee5a0a')

build() {
    cd "${pkgname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${pkgdir}"

    patch -p1 < ../../fix-warnings.patch

    sed -e 's/VALID_THEMES\.pop("[^"]*")/# &/ ' -i "./usr/lib/python3.14/site-packages/harlequin/colors.py"
}
