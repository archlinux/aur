# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

format_version() {
    local input="$1"

    # Counts how many dots are in the string
    local dot_count="${input//[^.]/}"

    # If there are 3 dots (a.b.c.d), apply the post transformation
    if [ "${#dot_count}" -ge 3 ]; then
        local prefix="${input%.*}"
        local suffix="${input##*.}"
        echo "${prefix}.post${suffix}"
    else
        # Otherwise (like a.b.c), return the input unchanged
        echo "${input}"
    fi
}

_appauthor="NSPC911"
_appname="multiarchive"

pkgname="python-${_appname}"
pkgver=0.1.4.1
pkgrel=1
pkgdesc="A high level archive handler for Python"

_pypi_package=${pkgname##python-}
_pypi_version=$(format_version "${pkgver}")

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-rarfile')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz" "LICENSE")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz" "LICENSE")
sha256sums=('3c4315b7257fedba624e7ed993e934bfd294fefa86e7243e2878322c4179b32a'
            '4f0239fdf0572b5752c8efacf1ce6b1060181479b504b3a5e22e0aa7af6176f1')

prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    sed -e 's|\(requires = \["uv_build\)[^"]*\("\]\)|\1\2|g' -i "./pyproject.toml"
}

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
