# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-webdav4
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.10.0
pkgrel=1
pkgdesc='WebDAV client library with a fsspec-based filesystem and a CLI.'
arch=('any')
url="https://skshetry.github.io/webdav4"
license=('MIT')
makedepends=('python-hatchling'
             'python-hatch-vcs'
             'python-build'
             'python-installer'
             'python-sphinx-copybutton'
             'python-sphinx-furo'
             'python-myst-parser'
             'python-dateutil'
             'python-httpx'
             'python-fsspec')
checkdepends=('python-pytest-xdist'
              'python-cheroot'
              'python-colorama'
              'python-wsgidav')   # dateutil httpx fsspec already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Makefile')
sha256sums=('387da6f0ee384e77149dddd9bcfd434afa155882f6c440a529a7cb458624407f'
            'b416e28c94fa9e9353a9db80afc7ab0daf4aab6ee107755dd64af77765e65a07')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -s ${srcdir}/Makefile docs
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="../dist/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-webdav4() {
    depends=('python>=3.8' 'python-httpx<1' 'python-dateutil>=2.8.1')
    optdepends=('python-fsspec>=2021.7: provide a consistent APIs to different storage backends'
                'python-h2: HTTP/2 support'
                'python-webdav4-doc: Documentation for webdav4')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-webdav4-doc() {
    pkgdesc="Documentation for Python webdav4"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
