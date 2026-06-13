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
pkgver=0.9.1.1
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
depends=('python' 'python-textual-autocomplete' 'python-pygments' 'python-rich' 'python-ujson' 'python-tomli' 'python-pillow' 'python-textual' 'python-uvloop' 'python-jsonschema' 'python-fastjsonschema' 'python-rich-click' 'python-send2trash' 'python-platformdirs' 'python-puremagic' 'python-psutil' 'python-rarfile' 'python-pdf2image' 'python-natsort' 'python-humanize' 'python-textual-image' 'python-pathvalidate' 'python-resvg_py' 'python-multiarchive')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('a2bd4f1d298e7b57523caf1626f1baf393d2c83af342b1e725453dff422247d2')

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
