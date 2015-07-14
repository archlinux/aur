#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-git
_pkgname=letsencrypt
pkgver=2463.01481aa
pkgrel=2
pkgdesc="A utility that works alongside Apache and nginx to automatically obtain a certificate and convert a website to HTTPS"
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('python2' 'augeas' 'ca-certificates' 'dialog' 'openssl' 'gcc' 'libffi' 'git')
makedepends=('python-virtualenv')
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
