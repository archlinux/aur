# Maintainer: Christoph Korn <christoph.korn at posteo dot de>
pkgname=chatty
pkgver=0.8.2
pkgrel=1
pkgdesc="Twitch Chat Client for Desktop"
arch=('any')
url="http://chatty.github.io/" 
license=('MIT')
depends=('java-environment' 'sh')
optdepends=('livestreamer: for watching streams in a custom video player.')
makedepends=('apache-ant' 'jre7-openjdk')

source=("https://github.com/chatty/chatty/archive/v${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}_script"
        "config_dir.patch"
        "manifest.patch"
        "disable_version_check.patch"
        "build.patch")
md5sums=('1172b5f7d788a7258fbbec07f6ca7dcc'
         '2bdf69cd81d941dba97d55694f9da26d'
         '9d8950b786e1af5614bc705ad478b019'
         '8f74b121a39705a33687ddf26dfdd2ac'
         'b94cff3408dc359815283663610ab866'
         '4de1c8a5b0fb16932b6106d8bdd193f7'
         '4e3d8490acd2f8ba700d03809a8ca8cf'
         '096e2ad8590ff0b8e6a57869c8e79c3c')

prepare() {
  cd chatty-${pkgver}
  patch -p1 -i $srcdir/build.patch
  patch -p1 -i $srcdir/config_dir.patch
  patch -p1 -i $srcdir/disable_version_check.patch
  patch -p1 -i $srcdir/manifest.patch
}

build() {
  cd chatty-${pkgver}
  ant
}

package(){
  install -Dm644 "${srcdir}/chatty-${pkgver}/dist/${pkgname}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -a "${srcdir}/chatty-${pkgver}/assets" "${pkgdir}/usr/share/${pkgname}/"

  install -Dm755 "${srcdir}/${pkgname}_script" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${srcdir}/chatty-${pkgver}/APACHE_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/APACHE_LICENSE"
  install -Dm644 "${srcdir}/chatty-${pkgver}/LGPL" "${pkgdir}/usr/share/licenses/${pkgname}/LGPL"
  install -Dm644 "${srcdir}/chatty-${pkgver}/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}

