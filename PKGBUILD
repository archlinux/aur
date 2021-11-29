# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kvideotomp3
pkgver=3.0.1.936
pkgrel=1
pkgdesc="Extract audio in high-quality MP3 from any video"
arch=('x86_64')
url="https://www.4kdownload.com/products/product-videotomp3"
license=('custom:eula')
depends=('openssl')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.svg"
        "fix_symlink_path.patch")
sha256sums=('5a43e5c7aac09ecfbdedbf04799ebe0a3284c9be7814eb32a3a0b8935d6a2b06'
            '790d1bce55bb1d2b4b0a76dab8cee6d467a90ef5b316b7f1936bac6f589ad995'
            '91d37103fb5bfb264c2842cbc546ebb59010ebd495a85c691e88096752173b3a'
            'f7892f717298a4cb00d2069fc928141f16b7bb0348db9f3d004c828ff20e9db8')

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
  chown root.root "${pkgdir}/usr/lib/${pkgname}"
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/doc/eula"
}
