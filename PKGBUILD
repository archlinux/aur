# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=tagspaces
pkgver=3.3.2
pkgrel=1
pkgdesc="open source personal data manager. It helps you organize files with tags on every platform."
arch=("i686" "x86_64")
url="http://tagspaces.org"
license=("AGPL")
depends=("electron")
makedepends=("bower" "gendesk")
sha256sums=('c8de3f9e53e548c23623414fd0aee79f93c118f330800ec876bb2308515c4975')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")

prepare() {
  # create desktop file and run script
  gendesk -f -n --pkgname ${pkgname} --pkgdesc "${pkgdesc}" --exec="${pkgname}"
  cat << EOF > "${pkgname}"
#!/bin/bash

cd /opt/${pkgname}/data/
electron .
EOF

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
  sed -i "s/@@VERSION.@@BUILD.@@BID/${pkgver}-${pkgrel}/g" ${pkgdir}/opt/${pkgname}/data/about.html
  sed -i "s/@@VERSION.@@BUILD/${pkgver}/g" ${pkgdir}/opt/${pkgname}/data/about.html

  # install desktop file, icon, and run script
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/data/assets/icon.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
}
