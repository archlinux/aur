# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>

pkgname="ivpn-ui"
pkgver=3.9.8
pkgrel=1
pkgdesc="IVPN - Secure VPN for Privacy"
arch=('x86_64')
url="https://www.ivpn.net"
license=('GPL3')
depends=('ivpn>=3.9.8')
makedepends=('npm' 'nvm')
install="ivpn-ui.install"

source=("ivpn-ui-src-v${pkgver}.tar.gz::https://github.com/ivpn/desktop-app/archive/v${pkgver}.tar.gz")
sha256sums=('03b6a488bf460b72d3f85e4b5c027876ca2b32ba71f0aab0710c99c34ef8ce78')

_ensure_local_nvm() {
    # https://wiki.archlinux.org/title/Node.js_package_guidelines

    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  # There are an errors when using latest version of node. Using v15
  # https://wiki.archlinux.org/title/Node.js_package_guidelines
  _ensure_local_nvm
  nvm install 15.14.0
}

build() {
  cd "$srcdir/desktop-app-${pkgver}/ui"

  # https://wiki.archlinux.org/title/Node.js_package_guidelines
  _ensure_local_nvm

  npm install

  ./References/Linux/compile-ui.sh
}

package() {
  cd "$srcdir/desktop-app-${pkgver}/ui"

  mkdir -p "$pkgdir/opt/ivpn/ui/bin"
  cp -fr dist_electron/linux-unpacked/* "$pkgdir/opt/ivpn/ui/bin"

  install -D "References/Linux/ui/IVPN.desktop" "$pkgdir/usr/share/applications/IVPN.desktop"

  install -D  "References/Linux/ui/IVPN.desktop" "$pkgdir/opt/ivpn/ui/IVPN.desktop"
  install -D  "References/Linux/ui/ivpnicon.svg" "$pkgdir/opt/ivpn/ui/ivpnicon.svg"
}
