# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="harlequin"
pkgver=2.6.0
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
b2sums=('8d0fb603519acc2f9a19096a19865ad44e60b2b7bb1aea890db9d61a04d379feb73f1251b259ac4190a3f8c3cf43fe52c73f0ff100a592f54f654c7e8ab6f397'
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
