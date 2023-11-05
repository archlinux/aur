# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kstogram
pkgver=4.6.3.4500
pkgrel=1
pkgdesc="Download and backup Instagram photos shared by any user"
arch=('x86_64')
url="https://www.4kdownload.com/products/product-stogram"
license=('custom:eula')
depends=('openssl' 'glib2')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.svg"
        "fix_symlink_path.patch")
sha256sums=('ed558380c3a3ba1b6e0a3233698ae6348ff606ce353120db0b47a316028ecd9f'
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
