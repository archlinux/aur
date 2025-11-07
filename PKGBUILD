# Maintainer: Jove Yu <yushijun110 at 126 dot com>

pkgbase=nautilus-scripts
pkgname=('nautilus-scripts' 'nautilus-scripts-dolphin')
pkgver=26.1.1
pkgrel=1
pkgdesc='A set of actions for extending the functionality of the GNOME Files (Nautilus), Dolphin, Caja, Nemo, PCManFM-Qt and Thunar file managers.'
url=https://github.com/cfgnunes/nautilus-scripts
arch=('x86_64')
license=('MIT')
depends=(
  'bash'
)
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz"
)
md5sums=('cf97b3e88ffaa27d472d3b69fb4791e9')

package_nautilus-scripts() {
  install="${pkgname}.install"
  optdepends=('nautilus-scripts-dolphin: dolphin servicemenus')

  install -d ${pkgdir}/opt/
  cp -r nautilus-scripts-${pkgver} ${pkgdir}/opt/${pkgname}

  rm ${pkgdir}/opt/${pkgname}/install.sh
}

package_nautilus-scripts-dolphin() {
  ln -sf nautilus-scripts-${pkgver} nautilus-scripts
  cd nautilus-scripts

  sed -i "s|\$INSTALL_HOME/.local/share/kio/servicemenus|${pkgdir}/usr/share/kio/servicemenus|g" install.sh
  sed -i "\$cINSTALL_DIR=${srcdir}/nautilus-scripts/\n_step_install_menus_dolphin" install.sh
  bash install.sh

  find ${pkgdir}/usr/share/kio/servicemenus/ -type f -exec sed -i "s|${srcdir}|/opt|g" {} +
}
