# Maintainer: Jove Yu <yushijun110 at 126 dot com>

pkgbase=fm-scripts
pkgname=('fm-scripts' 'fm-scripts-dolphin')
pkgver=30.13
pkgrel=1
pkgdesc='A set of actions for extending the functionality of the GNOME Files (Nautilus), Nemo, Caja, Dolphin, Thunar and PCManFM-Qt file managers. '
url=https://github.com/cfgnunes/fm-scripts
arch=('x86_64')
license=('MIT')
depends=(
  'bash'
)
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz"
)
md5sums=('f2d4eafb396ea3ba98779f4a6e8ea035')

package_fm-scripts() {
  install="${pkgname}.install"
  optdepends=('fm-scripts-dolphin: dolphin servicemenus')

  install -d ${pkgdir}/opt/
  cp -r fm-scripts-${pkgver} ${pkgdir}/opt/${pkgname}
}

package_fm-scripts-dolphin() {
  rm -rf fm-scripts
  mv fm-scripts-${pkgver} fm-scripts
  cd fm-scripts

  cp install.sh package.sh
  sed -i "s|\$INSTALL_HOME/.local/share/kio/servicemenus|${pkgdir}/usr/share/kio/servicemenus|g" package.sh
  sed -i "\$cFILE_MANAGER=dolphin\nINSTALL_DIR=${srcdir}/fm-scripts/\n_install_actions" package.sh
  bash package.sh
  rm package.sh

  find ${pkgdir}/usr/share/kio/servicemenus/ -type f -exec sed -i "s|${srcdir}|/opt|g" {} +
}
