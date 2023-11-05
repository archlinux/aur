# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kvideodownloaderplus
pkgver=1.3.0.0038
pkgrel=1
pkgdesc="Download videos from all popular websites including YouTube, Vimeo, TikTok, SoundCloud, Facebook, Twitch, Bilibili and more in high-quality"
arch=('x86_64')
url="https://www.4kdownload.com/products/videodownloader-41"
license=('custom:eula')
depends=('openssl' 'glib2' 'expat')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.svg"
        "fix_symlink_path.patch")
sha256sums=('7b0f4cf0924d7f9e2f1da4ad4fc96952b3ef76406af0b55179d108236e7c26df'
            'd2266611e5104a97e5a11d033823dfbbef5b059a629cae3537c7f60767aaffe2'
            '1c2451ccaef8f3fe1c090d3f0f8431342a0adb363fcc18d35c130ec0a85fade5'
            '82e2519a2fb3c079ce34589c7ad063221095c77d0f968b414c36044a37908f0a')

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
