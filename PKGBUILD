# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4ktokkit
pkgver=1.3.1.0340
pkgrel=1
pkgdesc="One easy way to download everything off TikTok"
arch=('x86_64')
url="https://www.4kdownload.com/products/tokkit"
license=('custom:eula')
depends=('openssl' 'glib2' 'expat')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.svg"
        "fix_symlink_path.patch")
sha256sums=('b10758d932b554a5924f64b19c91d5e46a8478e135dad313d968231d1d96318d'
            '90e05b74832db592397583f7f3ec8a22493884a870de1e113e7b136b2ce3b142'
            '2e043e2eeb29fb58ab9b7ccf6aa049256046354abead9019c592b2f409ed24f8'
            'd6ce743a9c564094a2a3c98272b530e461b286de6ca6f20bf09a12cfdbd69672')

prepare() {
  cd "${pkgname}"
  # Remove insecure RPATH
  chrpath --delete "${pkgname}-bin"
  # Fix symlink path
  patch -p1 -i "${srcdir}/fix_symlink_path.patch"
}

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  # Install icon file
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.svg"
  # Install files
  install -m 755 -d "${pkgdir}/usr/lib"
  cp -r "${pkgname}" "${pkgdir}/usr/lib"
  chown root:root "${pkgdir}/usr/lib/${pkgname}"
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/doc/eula"
}
