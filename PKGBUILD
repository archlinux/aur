# Maintainer: Parker Johansen <johansen.parker@gmail.com>
_pkgname=rancher-desktop
pkgname=${_pkgname}-git
pkgver=0.6.0.r255.g43ba875
pkgrel=1
pkgdesc="Kubernetes and container management on the desktop"
arch=('x86_64')
url="https://rancherdesktop.io/"
license=('Apache')
depends=('qemu')
provides=('rancher-desktop' 'docker' 'helm' 'kim' 'kubectl' 'nerdctl')
makedepends=('git' 'npm' 'nvm' 'unzip')
conflicts=('rancher-desktop')

source=("${pkgname}::git+https://github.com/rancher-sandbox/rancher-desktop.git#branch=main")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm
    nvm install 14.17
}

build() {
    _ensure_local_nvm
    cd ${pkgname}
    nvm use 14.17
    npm install
    npm run build -- --linux --publish=never
}

package() {
    cd ${pkgname}

    install -d ${pkgdir}/opt/${_pkgname}
    cp -dr dist/linux-unpacked/* ${pkgdir}/opt/${_pkgname}/

    install -Dm644 dist/linux-unpacked/resources/resources/linux/${_pkgname}.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    install -d ${pkgdir}/usr/bin
    ln -sf  /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
