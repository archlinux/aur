# Maintainer: David Stark <david@starkers.org>

pkgver=0.76
pkgrel=16
pkgname=telepresence
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster - http://www.telepresence.io"
arch=('any')
license=('Apache')
url="https://github.com/datawire/telepresence"
makedepends=()
backup=()
depends=(
    'curl'
    'conntrack-tools'
    'git'
    'python'
    'python-virtualenv'
    'sshuttle'
    'socat'
    'sshfs'
    'torsocks'
    )

source=("https://github.com/datawire/telepresence/archive/${pkgver}.tar.gz")
md5sums=('SKIP')

build(){
  curl -Ls "https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64" -o dumb-init
  chmod +x dumb-init
  cd "${srcdir}/${pkgname}-${pkgver}"
  virtualenv --python=python3 telepresence-venv
  telepresence-venv/bin/pip install -r dev-requirements.txt
  telepresence-venv/bin/pip install .

}

package(){

  sed -i "s+${srcdir}/${pkgname}-${pkgver}+/opt/telepresence+g" "${srcdir}/${pkgname}-${pkgver}/telepresence-venv/bin/"*
  mkdir -p "${pkgdir}/opt/telepresence/"
  cp -R "${srcdir}/${pkgname}-${pkgver}/telepresence-venv/" "${pkgdir}/opt/telepresence/"

  install -Dm 755 "dumb-init"                        "${pkgdir}/opt/telepresence/dumb-init"
  install -Dm 755 "../wrapper-telepresence.sh"       "${pkgdir}/usr/bin/telepresence"
  install -Dm 755 "../wrapper-stamp-telepresence.sh" "${pkgdir}/usr/bin/stamp-telepresence"

}

# vim:set ts=2 sw=2 et:
