# Maintainer: Jove Yu <yushijun110 at 126 dot com>

pkgbase=nautilus-scripts
pkgname=('nautilus-scripts' 'nautilus-scripts-dolphin')
pkgver=29.1.1
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
md5sums=('4435985e49b800c489f888f404c6c0e8')

package_nautilus-scripts() {
  install="${pkgname}.install"
  optdepends=('nautilus-scripts-dolphin: dolphin servicemenus')

  install -d ${pkgdir}/opt/
  cp -r nautilus-scripts-${pkgver} ${pkgdir}/opt/${pkgname}
}

package_nautilus-scripts-dolphin() {
  rm -rf nautilus-scripts
  mv nautilus-scripts-${pkgver} nautilus-scripts
  cd nautilus-scripts

  cp install.sh package.sh
  sed -i "s|\$INSTALL_HOME/.local/share/kio/servicemenus|${pkgdir}/usr/share/kio/servicemenus|g" package.sh
  sed -i "\$cFILE_MANAGER=dolphin\nINSTALL_DIR=${srcdir}/nautilus-scripts/\n_install_actions" package.sh
  bash package.sh
  rm package.sh

  find ${pkgdir}/usr/share/kio/servicemenus/ -type f -exec sed -i "s|${srcdir}|/opt|g" {} +
}
