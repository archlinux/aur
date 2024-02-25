# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kvideodownloader
pkgver=4.29.0.5640
pkgrel=1
pkgdesc="Quickly download videos from YouTube in high-quality"
arch=('x86_64')
url="https://www.4kdownload.com/products/product-videodownloader"
license=('LicenseRef-eula')
depends=('openssl' 'glib2' 'expat')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.svg"
        "fix_symlink_path.patch")
sha256sums=('e38bba3d8a4172ce9f873d7534006336b665fdd6eb7a67b93be54104e80b8d8c'
            'b2e0ac155419e6c297813558cd0502b374683e7d95f2d7e9bcc9be0645ffaefa'
            '5c169ea486d1d9b50e0f510d6bc90901ff72162e3996b60f70ce574e58d173cb'
            '2b5a9c262ff7b832eafbfb0e027b676a8be44f9c527b99ac00bd8379fc709668')

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
