# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kstogram
pkgver=4.3.2.4230
pkgrel=1
pkgdesc="Download and backup Instagram photos shared by any user"
arch=('x86_64')
url="http://www.4kdownload.com/products/product-stogram"
license=('custom:eula')
depends=('openssl' 'glib2')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.svg"
        "fix_symlink_path.patch")
sha256sums=('3a35c962c9c89bf34ccd9c653083b7b0ff19543b8635353bdc50251dbc633cda'
            '9a47c71327afa2059bad06e33b3a77b271e62c7653582342f41c588989026962'
            '37e014bc5e68148e7b1797135a567c86c1bdb3ae31e38dab1644a01638f29a99'
            '8745f84d3fac77023c1182177e80c8c91561c2d21c90f071de5d6f4773ad65c3')

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
