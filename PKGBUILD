# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-mike
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.1.3
pkgrel=1
pkgdesc="Manage multiple versions of your MkDocs-powered documentation"
arch=('any')
url="https://github.com/jimporter/mike"
license=('BSD-3-Clause')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer'
checkdepends=('python-pytest'
              'python-importlib_resources'
#             'python-pytest-xdist'
              'python-pyparsing'
              'python-shtab'
              'python-verspec'
              'mkdocs'
              'git')  # jinja, importlib-metadata <- mkdocs
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/jimporter/mike/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('6e9796ab0bd5a3bca6c4ac1ef7a59ce6')

get_pyinfo() {
     [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
             python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    sed -i '/importlib_/s/_/\./' mike/commands.py
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py install --root=tmp_install --prefix=/usr --optimize=1
    PATH="${PWD}/tmp_install/usr/bin:${PATH}" PYTHONPATH="${PWD}/tmp_install/$(get_pyinfo site)" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4
}

package_python-mike() {
    depends=('python>=3.8'
             'python-importlib-metadata'
             'python-importlib_resources'
             'python-jinja>=2.7'
             'python-pyparsing>=3.0'
             'python-yaml>=5.1'
             'python-pyyaml-env-tag'
             'python-verspec'
             'mkdocs>=1.0')
    optdepends=('python-shtab: set up shell-completion')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
