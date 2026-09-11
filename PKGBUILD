# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ewah-bool-utils
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.3.2
pkgrel=1
pkgdesc="EWAH Bool Array utils for yt"
arch=('i686' 'x86_64')
url="https://ewah-bool-utils.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('meson-python>=0.18.0'
             'cython>=3.1.1'
             'python-build'
             'python-installer'
             'python-numpy>=2.0.0'
             'python-sphinx')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-title-underline.patch')
md5sums=('3f1c58ba3f2cefe837c0932ac8f2b6b6'
         '7c4351256659c6fe4d7d369e3ff57398')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/language\ = /s/None/'en'/" docs/conf.py
    patch -Np1 -i "${srcdir}/fix-title-underline.patch"
    mkdir -p docs/_static
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

    msg "Building Docs"
#   mv {,_}${_pyname}
#   PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-cp$(get_pyver)-cp$(get_pyver)-linux_${CARCH}.whl -C dist/lib
    PYTHONPATH="../dist/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
#   mv {_,}${_pyname}
}

package_python-ewah-bool-utils() {
    depends=('python-numpy>=2.0.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-ewah-bool-utils-doc() {
    pkgdesc="Documentation for EWAH Bool Utils"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
