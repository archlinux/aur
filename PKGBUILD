# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kslideshowmaker
pkgver=2.0.1.1055
pkgrel=1
pkgdesc="A straightforward and easy-to-use app to create slideshows from music and photos, with Instagram support"
arch=('x86_64')
url="https://www.4kdownload.com/products/product-slideshowmaker"
license=('custom:eula')
depends=('openssl')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.svg"
        "fix_symlink_path.patch")
sha256sums=('7c76ee4ad7f63ed110aa828861fda4d27b07a371e6e50dce9112a68aecdba20c'
            'e77851c895f713a7f615010c0b62d0749254dac5178f9853ae45a915ac1f84f0'
            'b09e126dd039485424b235a39d0bd4e288d648955e45a927664adc33e6c12d63'
            '296e875b47b6a5e69688d12f145ada3bf4683a05f3a0153adee1577e6dbb179c')

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
