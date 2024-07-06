# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kimagecompressor
pkgver=1.5.0.0280
pkgrel=1
pkgdesc="Reduce file size of JPEG, PNG, WEBP and more"
arch=('x86_64')
url="https://www.4kdownload.com/products/imagecompressor"
license=('LicenseRef-eula')
depends=('openssl' 'glib2' 'expat')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.svg"
        "fix_symlink_path.patch")
sha256sums=('0b7996791258c5ede7997b7a55fdd21aefdc5ce768ec695fb223cd04ddccf54d'
            '3a7c2c4285876122509f5ba844b457c1bb88173dfad18d9b91b17611bb24d649'
            '83ca565a079e20f0fd80ed65b3a67e472424f2ce04f7524de119c56942c11748'
            '73358b336cf67b4a4f073c8fdd9c183c7c06688a296ef7e84a7c9ad9ac1ed05d')

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
