# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=htmlmin2
pkgbase=python-htmlmin2
pkgname=('htmlmin2' 'python-htmlmin2')
pkgver=0.1.13
_gitcommit=3cb03fb5562c0c7152f1aacc4d615c5ea828a47a
pkgrel=1
pkgdesc='Configurable HTML Minifier with safety features'
url='https://htmlmin.readthedocs.io'
arch=('any')
license=('BSD')
makedepends=('python-sphinx' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/wilhelmer/htmlmin/archive/${_gitcommit}.tar.gz"
        'fix-readme-filename.patch')
sha256sums=('dd67db4eaeb43c7733d08896001771343a5c23a9ef4508ebb58dd7315497dcdb'
            '38b473b3a34376b5e641ac7050756a5fe8f3eed6a6f059aaf6a7a32248e79851')
sha512sums=('f5b790ce4c1c33ed571c43e54c4e602ed5fdaf0cebf71eb52980d8d8373613cdca76d0bf7de992844437479b616296cfd2b078287d4b481c76bf76c65b3bf862'
            'ead38fa02b157702122fcb3ab8d03d20840141294118f360e6edb2d986169efae3704f959053336c81863751bbca8d94fac79e60a7e8cb7db625bc5079894f3d')

prepare() {
    cd ${_pkgname/2/}-${_gitcommit}

    patch -Np1 -i "${srcdir}/fix-readme-filename.patch"
}

build() {
    echo "Building python..."
    cd ${_pkgname/2/}-${_gitcommit}
    python setup.py build
    sphinx-build -b text docs docs/_build/text
    sphinx-build -b man docs docs/_build/man
}

check() {
    echo "Checking python..."
    cd ${_pkgname/2/}-${_gitcommit}
    python setup.py test
}

package_htmlmin2() {
    depends=('python' 'python-setuptools' 'python-htmlmin2')
    conflicts=("htmlmin")
    pkgdesc+=' (CLI)'
    cd ${_pkgname/2/}-${_gitcommit}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -d "${pkgdir}/usr/share/"{licenses,doc,man/man1}
    ln -s /usr/share/licenses/python-htmlmin2 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/python-htmlmin2 "${pkgdir}/usr/share/doc/${pkgname}"
    ln -s /usr/share/man/man1/python-htmlmin2.1.gz "${pkgdir}/usr/share/man/man1/htmlmin2.1.gz"

    rm -r "${pkgdir}"/usr/lib
}

package_python-htmlmin2() {
depends=('python')
    conflicts=("python-htmlmin")
    cd ${_pkgname/2/}-${_gitcommit}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm 644 README.md CHANGELOG -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 docs/_build/man/htmlmin.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    rm -r "${pkgdir}"/usr/lib/python*/site-packages/htmlmin*/tests \
        "${pkgdir}/usr/bin"
}
