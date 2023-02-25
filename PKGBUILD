# Maintainer: John Gerritse (tyrannis dot hawk at gmail dot com)
pkgname=opensubtitles-uploader
pkgver=2.7.0
pkgrel=1
pkgdesc="Desktop app to upload subtitles to OpenSubtitles, using Node.JS and NWjs"
arch=('x86_64')
url="https://github.com/vankasteelj/opensubtitles-uploader"
license=('GPL3')
makedepends=('npm' 'git' 'gulp')
source=("${pkgname}::https://github.com/vankasteelj/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.desktop"
        "${pkgname}.png")
md5sums=('d0931385c517b479d1cf9ae253ea2ef0'
         'd9420ef114a38a663a71aa74a5426bc5'
         'f38a85d864e5aca6706a76adec1c5e86'
         'f8e90af7251e2c76a9d863e283aa3804')

prepare() {
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/${pkgname}.patch"
}

build() {
  cd "$pkgname-$pkgver"
  npm install
  gulp build
}

package() {
  cd "$pkgname-$pkgver"
  install -m 0755 -d ${pkgdir}/opt/${pkgname}
  install -m 0755 -d ${pkgdir}/usr/share/applications
  install -m 0755 -d ${pkgdir}/usr/share/icons
  install -m 0644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
  install -m 0644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/icons
  cp -R build/${pkgname}/linux*/* ${pkgdir}/opt/${pkgname}
}
