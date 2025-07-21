# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>

pkgname="ivpn-ui"
pkgver=3.14.34
pkgrel=1
pkgdesc="IVPN - Secure VPN for Privacy"
arch=('x86_64')
url="https://www.ivpn.net"
license=('GPL3')
depends=('ivpn>=3.14.2')
makedepends=('npm' 'nvm')
install="ivpn-ui.install"

# INSTALLATION SOURCES

# Default installation sources
source=("ivpn-ui-src-v${pkgver}.tar.gz::https://github.com/ivpn/desktop-app/archive/v${pkgver}.tar.gz")
sha256sums=('fb1a93e775dc3bf30fb9f1be3fe6b466140c2e8464c8eff727062baab7388c44')
src_prj_dir_name=desktop-app-${pkgver}

# Use bellow two lines to install package from beta branch
#source=("git+https://github.com/ivpn/desktop-app.git#branch=beta")
#md5sums=('SKIP')
#src_prj_dir_name=desktop-app

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
  # https://wiki.archlinux.org/title/Node.js_package_guidelines
  _ensure_local_nvm
  nvm install 18.19.0
}

build() {
  cd "$srcdir/$src_prj_dir_name/ui"

  # https://wiki.archlinux.org/title/Node.js_package_guidelines
  _ensure_local_nvm

  npm install

  ./References/Linux/compile-ui.sh
}

package() {
  cd "$srcdir/$src_prj_dir_name/ui"

  mkdir -p "$pkgdir/opt/ivpn/ui/bin"
  cp -fr dist/linux-unpacked/* "$pkgdir/opt/ivpn/ui/bin"

  install -D "References/Linux/ui/IVPN.desktop" "$pkgdir/usr/share/applications/IVPN.desktop"

  install -D  "References/Linux/ui/IVPN.desktop" "$pkgdir/opt/ivpn/ui/IVPN.desktop"
  install -D  "References/Linux/ui/ivpnicon.svg" "$pkgdir/opt/ivpn/ui/ivpnicon.svg"
}
