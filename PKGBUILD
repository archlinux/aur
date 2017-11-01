# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: David Manouchehri

pkgname=html2pdf
pkgver=1.0
pkgrel=2
_filerel=1
pkgdesc="A GTK+ HTML to PDF converter"
arch=('any')
url="https://code.google.com/archive/p/foxoman/"
license=('GPL3')
depends=('wkhtmltopdf' 'python2-gobject' 'python2-notify')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/foxoman/${pkgname}_${pkgver}-${_filerel}_all.deb"
        "python2.patch"
        "missing-app-variable.patch"
        "missing-close-event.patch")
sha512sums=('e7b7903082058d7bc100b97071a51d10def4f4dd13b9d5410d1fbc73a75a91fe578e6be2fa104337f0625960162e5af7b2b030b0c0797c83e15e3965a23a4d03'
            '010146431152bed32596eb0b9ded0453d664338f869307f667fb0cf2fed05c8c80483017dc957a7b069c7d12a4c278582bc225531581e757bda8a0cb55ea18d6'
            '8b5ea7c2fb207771acb07f565b3037107d580a70759a983bcbca3d27b60795dbc5fa03c3817b61ba3e01bc44789f5df41b5ffe479cfb895a515249fa43ecb298'
            'afa20239a206ff4b1b41f4bba7a9ec3c54196342ad3c62a42d37fcd3ae9ad746165a8a08931bf4536d2e428b15384dda1dc03a12f285ad5016fa77d159c3f9f2')

prepare() {
  ar x "${pkgname}_${pkgver}-${_filerel}_all.deb"
  tar xvf "data.tar.gz"
  # Fix python 2.x
  patch -p0 -i "python2.patch"
  # Fix for missing APP variable
  patch -p0 -i "missing-app-variable.patch"
  # Fix for missing closing handler
  patch -p0 -i "missing-close-event.patch"
  # Fix inconsitent spaces and tabs
  sed -i 's@\t@    @' "usr/share/${pkgname}/${pkgname}.py"
}

package() {
  cd "usr"
  # Install executable files
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "bin/${pkgname}"
  # Install launcher file
  cd "share"
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "applications/${pkgname}.desktop"
  # Install shared files
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/share/${pkgname}" \
    "${pkgname}/about.glade" "${pkgname}/${pkgname}.png" \
    "${pkgname}/${pkgname}.py" "${pkgname}/ui.glade"
  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/icons"
  ln -s "../${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  ln -s "../${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
