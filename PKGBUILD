# Maintainer: John Gerritse (tyrannis dot hawk at gmail dot com)
pkgname=opensubtitles-uploader
pkgver=2.8.0
pkgrel=1
pkgdesc="Desktop app to upload subtitles to OpenSubtitles, using Node.JS and NWjs"
arch=('x86_64')
url="https://github.com/vankasteelj/opensubtitles-uploader"
license=('GPL3')
makedepends=('npm' 'git' 'gulp')
source=("${pkgname}::https://github.com/vankasteelj/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")
md5sums=('7297c94708a0361cbbb7dc73b0de9634'
         'f38a85d864e5aca6706a76adec1c5e86'
         'f8e90af7251e2c76a9d863e283aa3804')

build() {
  cd "$pkgname-$pkgver"
  npm install
  gulp build
}

package() {
  cd "$pkgname-$pkgver"
  
  # Create necessary directories
  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  
  # Install desktop file and icon
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  
  # Copy all files and directories, preserving structure
  cp -a build/${pkgname}/linux64/. "${pkgdir}/opt/${pkgname}/"
  
  # Set correct permissions
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} +
  
  # Make the main executable file executable
  chmod 755 "${pkgdir}/opt/${pkgname}/opensubtitles-uploader"
}

