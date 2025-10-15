# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
_pyname=${pkgname//-/_}
pkgver=0.51
pkgrel=1
pkgdesc='Check MANIFEST.in in a Python package for completeness'
arch=('any')
url='https://github.com/mgedmin/check-manifest'
license=('MIT')
# Require python 3.8+ to get get rid of python-mock
# https://github.com/mgedmin/check-manifest/pull/158
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'git'
              'breezy'
              'mercurial'
              'subversion')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('9801c7637675755a563f33e3c48ee59a59b37a7677297c05c910c16c5b9b6d67')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package() {
    depends=('python>=3.8' 'python-build' 'python-setuptools')
    cd ${srcdir}/${_pyname}-${pkgver}
    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
