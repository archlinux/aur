_maj_pyver=3
_min_pyver=10
_pyver=${_maj_pyver}.${_min_pyver}
_python=python${_pyver}
_python_pkg=python${_maj_pyver}${_min_pyver}
_pkgbase=rasa
pkgname=rasa
pkgver=3.6.0
pkgrel=1
pkgdesc="Open source machine learning framework to automate text- and voice-based conversations: NLU, dialogue management, connect to Slack, Facebook, and more - Create chatbots and voice assistants"
arch=('x86_64')
license=('Apache License 2.0')
url="https://github.com/RasaHQ/rasa"
depends=($_python_pkg)
makedepends=('git' $_python_pkg 'python-build' 'python-installer' 'python-wheel' 'python-virtualenv')
provides=($_pkgbase rasa-sdk $_python_pkg-$_pkgbase $_python_pkg-rasa-sdk)
source=("${pkgname}-${pkgver}::git+https://github.com/RasaHQ/rasa.git")
md5sums=('SKIP')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}

    git checkout  tags/${pkgver}
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    virtualenv ${pkgdir}/opt/${pkgname} -p $_python
    source ${pkgdir}/opt/${pkgname}/bin/activate
    python -m pip install -U pip
    python -m pip install -U setuptools wheel build installer poetry
    python -m pip install .
    rm -rf ${pkgdir}/opt/${pkgname}/bin/__pycache__
    sed -i "s|${pkgdir}/opt/$pkgname|/opt/${pkgname}|g" ${pkgdir}/opt/${pkgname}/bin/*
    
    install -d ${pkgdir}/usr/bin/
    ln -s /opt/${pkgname}/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
