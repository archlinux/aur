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

pkgauthor="NSPC911"
pkgname="rovr"
pkgver=0.10.1.1
pkgrel=1
pkgdesc="A post-modern terminal file explorer"

_pypi_package=${pkgname}
_pypi_version=$(format_version "${pkgver}")

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/NSPC911/${_pypi_package}"
url="${_url_github}"

provides=("${_pypi_package}")
conflicts=("${pkgname}"{-bin,-git})

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-textual' 'python-textual-autocomplete' 'python-textual-image' 'python-textual-drivers' 'python-pygments' 'python-rich' 'python-ujson' 'python-tomli' 'python-pillow' 'python-uvloop' 'python-jsonschema' 'python-fastjsonschema' 'python-rich-click' 'python-send2trash' 'python-platformdirs' 'python-puremagic' 'python-psutil' 'python-rarfile' 'python-pdf2image' 'python-natsort' 'python-humanize' 'python-pathvalidate' 'python-resvg_py' 'python-multiarchive' 'python-pytrash')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('8f114a20b0979fabb24a800cee8f21b62c99e6d07f55b6b10347f5607e8b66cf')

prepare() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    sed -e 's|\(requires = \["uv_build\)[^"]*\("\]\)|\1\2|g' -i "./pyproject.toml"
}

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
