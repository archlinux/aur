#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-git
_pkgname=letsencrypt
pkgver=3638.4998f32
pkgrel=1
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('python2' 'augeas' 'ca-certificates' 'dialog' 'openssl' 'gcc' 'libffi' 'git' 'python-virtualenv' 'pkg-config')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+https://github.com/letsencrypt/letsencrypt")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${srcdir}/${_pkgname}"

    virtualenv -p python2 venv
    ./venv/bin/pip install -r requirements.txt acme/ . letsencrypt-apache/ letsencrypt-nginx/
    virtualenv -p python2 --relocatable venv
}

package() {
    cd "${srcdir}/${_pkgname}"

    # Moving the complete virtual environment and source to /opt
    mkdir -p "${pkgdir}"/opt/letsencrypt
    cp -dpr --no-preserve=ownership ./* "${pkgdir}"/opt/letsencrypt

    # Link to the executables
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/letsencrypt/venv/bin/letsencrypt "${pkgdir}"/usr/bin/letsencrypt
    ln -s /opt/letsencrypt/venv/bin/letsencrypt-renewer "${pkgdir}"/usr/bin/letsencrypt-renewer
}
