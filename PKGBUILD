# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>

pkgname="ivpn-ui"
pkgver=3.8.7
pkgrel=1
pkgdesc="IVPN Graphical User Interface"
arch=('x86_64')
url="https://ivpn.net"
license=('GPL3')
depends=('ivpn')
makedepends=('npm' 'nvm')
install="ivpn-ui.install"

source=("ivpn-ui-src-v${pkgver}.tar.gz::https://github.com/ivpn/desktop-app/archive/v${pkgver}.tar.gz")
sha256sums=('79891cfdd5e6b6e8e6c47db277251debb16ee094e402a4ac188883c5334bb7a7')

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

  # some linux versions have problems running Electron without this
  sudo chmod 4755 /opt/ivpn/ui/bin/chrome-sandbox || echo "[!] Failed to 'chmod' for '/opt/ivpn/ui/bin/chrome-sandbox'"
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
