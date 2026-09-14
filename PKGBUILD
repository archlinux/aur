# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="harlequin"
pkgver=2.14.0
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
         'python-rich'
         'python-rich-click'
         'python-wcwidth'
         'python-boto3'
         'python-duckdb'
         'python-shandy-sqlfmt'
         'python-platformdirs'
         'python-pyperclip'
         'python-importlib-metadata'
         'python-typing_extensions'
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
b2sums=('f5d631947f76cc149783bb8a4352ac1c449a095ad9253a6d8a596d5929d89a2cdb31e2940d90e34aa39aac63b2f6b3f19b5fd02ed0b8933af5a18915c92b69f5'
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
