# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pure-protobuf
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=3.1.5
pkgrel=1
pkgdesc='Python implementation of Protocol Buffers data types with dataclasses support.'
arch=('any')
url="https://eigenein.github.io/protobuf"
license=('MIT')
makedepends=('python-poetry-dynamic-versioning'
             'python-build'
             'python-installer')
#            'mkdocstrings'
#            'mkdocs-material'
#            'mkdocs-git-revision-date-localized-plugin'
#            'python-pillow'
#            'python-cairosvg'
#            'mkdocs-autorefs'
#            'python-pymdown-extensions')
checkdepends=('python-pytest-benchmark'
#             'python-pytest-xdist'
              'python-pydantic')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/eigenein/protobuf/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('348ff638daacc38e942f996168f29b30c4c389027f35c663f50e87525f7aac2e4ba1c1707b22e8082e54ee26987ff621fc96af66a5ad5cf3d4291fe857f44549')

prepare() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/protobuf-${pkgver}

    sed -i -e "s/0.0.0/${pkgver}/" -e "/enable/s/true/false/" -e '/--cov/d' pyproject.toml
##   sed -i -e '/-\ git-rev/a \      fallback_to_build_date: true' \
##      -e '/-\ git-rev/s/$/:/' -e '$a use_directory_urls: false' mkdocs.yml
#    sed -i -e '/-\ git-rev/a \      fallback_to_build_date: true' mkdocs.yml
}

build() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/protobuf-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdocs build
}

check() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/protobuf-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-pure-protobuf() {
    depends=('python>=3.9.0' 'python-typing_extensions>=4.4.0')
#   optdepends=('python-pure-protobuf-doc: Documentation for pure-protobuf')
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/protobuf-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-pure-protobuf-doc() {
#    pkgdesc="Documentation for Python pure-protobuf"
##   cd ${srcdir}/${_pyname}-${pkgver}
#    cd ${srcdir}/protobuf-${pkgver}
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
