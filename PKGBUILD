# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=tagspaces
pkgver=2.2.1
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("i686" "x86_64")
url="http://tagspaces.org"
license=("AGPL")
depends=("electron")
makedepends=("bower" "gendesk")
sha256sums=('3997522914c6809503147abd200213811eba559cd346a35fc4b3b61b5c02987c')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")

prepare() {
  # create desktop file and run script
  gendesk -f -n --pkgname ${pkgname} --pkgdesc "${pkgdesc}" --exec="cd /opt/${pkgname}/data/ && electron ."
  echo "cd /opt/${pkgname}/data/ && electron ." > ${pkgname}
}

build() {
  (
  cd ${srcdir}/${pkgname}-${pkgver}/data
  bower install
  )
}

package() {
  # copy files
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}

  # modify version info for this package
  sed -i "s/@@VERSION.@@BUILD.@@BID/${pkgver}-${pkgrel}/g" ${pkgdir}/opt/tagspaces/data/about.html
  sed -i "s/@@VERSION.@@BUILD/${pkgver}/g" ${pkgdir}/opt/tagspaces/data/about.html

  # install desktop file, icon, and run script
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/data/assets/icon.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
}
