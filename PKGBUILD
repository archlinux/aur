#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-git
_pkgname=letsencrypt
pkgver=2463.01481aa
pkgrel=1
pkgdesc="A utility that works alongside Apache and nginx to automatically obtain a certificate and convert a website to HTTPS"
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('python2' 'augeas' 'ca-certificates' 'dialog' 'openssl' 'gcc' 'libffi' 'git')
makedepends=('python-virtualenv')
install=letsencrypt.install
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

    mkdir -p "${pkgdir}"/opt/letsencrypt "${pkgdir}"/etc/profile.d
    cp -dpr --no-preserve=ownership ./* "${pkgdir}"/opt/letsencrypt
    echo "export PATH=$PATH:/opt/letsencrypt/venv/bin" > "${pkgdir}"/etc/profile.d/letsencrypt.sh
    echo "setenv PATH ${PATH}:/opt/letsencrypt/venv/bin" > "${pkgdir}"/etc/profile.d/letsencrypt.csh
    chmod 755 "${pkgdir}"/etc/profile.d/letsencrypt.sh "${pkgdir}"/etc/profile.d/letsencrypt.csh
}
