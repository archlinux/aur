# Maintainer: David Garfias <jose.garfias@ingenieria.unam.edu> 
# Contributor: ffcc <ffercc at gmail dot com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Marcel Hasler <mahasler at gmail dot com>

pkgname=scilab-bin
_pkgname=${pkgname%-bin}
pkgver=6.1.1
pkgrel=1
pkgdesc="A software package for numerical computation, providing a powerful computing environment for engineering and scientific applications."
arch=("x86_64")
license=("BSD" "custom:CeCILL")
url="https://www.scilab.org"
# Standalone package
depends=('ncurses5-compat-libs' 'jre8-openjdk')
conflicts=('scilab')
options=(!strip)
source=("http://www.scilab.org/download/${pkgver}/scilab-${pkgver}.bin.linux-x86_64.tar.gz")
sha256sums=("3ee1a7cf661d021ae26afc27b9fe50cb2d1c9c27911e5582e9d4337ebedb2c79")

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}/share/applications"
  sed -i "s|Exec=scilab-adv-cli|Exec=/opt/scilab/bin/scilab-adv-cli|" scilab-adv-cli.desktop
  sed -i "s|Exec=scilab-cli|Exec=/opt/scilab/bin/scilab-cli|" scilab-cli.desktop
  sed -i "s|Exec=scilab -f|Exec=/opt/scilab/bin/scilab -f %f|" scilab.desktop
  sed -i "s|Exec=scinotes|Exec=/opt/scilab/bin/scinotes|" scinotes.desktop
  sed -i "s|Exec=xcos|Exec=/opt/scilab/bin/xcos|" xcos.desktop
  cd "${srcdir}/${_pkgname}-${pkgver}"
  rm -R thirdparty/java
}

package() {
  install -d "${pkgdir}/opt"
  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${_pkgname}"
  ln -s "/usr/lib/jvm/java-8-openjdk/jre" "${pkgdir}/opt/${_pkgname}/thirdparty/java"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -d "${pkgdir}/usr/share/applications"
  install -Dm 644 share/applications/*.desktop "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"
  cp -a share/icons/hicolor "${pkgdir}/usr/share/icons"
}
