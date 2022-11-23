_pkgbase=rasa
pkgname=rasa
pkgver=3.3.1
pkgrel=2
pkgdesc="Open source machine learning framework to automate text- and voice-based conversations: NLU, dialogue management, connect to Slack, Facebook, and more - Create chatbots and voice assistants"
arch=('x86_64')
license=('Apache License 2.0')
url="https://github.com/RasaHQ/rasa"
depends=('python39')
makedepends=('git' 'python39' 'python-build' 'python-installer' 'python-wheel' 'python-virtualenv')
provides=($_pkgbase rasa-sdk python39-$_pkgbase python39-rasa-sdk)
source=("${pkgname}-${pkgver}::git+https://github.com/RasaHQ/rasa.git")
md5sums=('SKIP')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}

    git checkout  tags/${pkgver}
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    virtualenv ${pkgdir}/opt/${pkgname} -p python3.9
    source ${pkgdir}/opt/${pkgname}/bin/activate
    python -m pip install -U pip
    python -m pip install -U setuptools wheel build installer poetry
    python -m pip install .
    rm -rf ${pkgdir}/opt/${pkgname}/bin/__pycache__
    sed -i "s|${pkgdir}/opt/$pkgname|/opt/${pkgname}|g" ${pkgdir}/opt/${pkgname}/bin/*
    
    install -d ${pkgdir}/usr/bin/
    ln -s /opt/${pkgname}/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
