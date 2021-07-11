# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kyoutubetomp3
pkgver=4.1.4.4350
pkgrel=1
pkgdesc="Extract audio from YouTube, Vimeo, Facebook and other online video hosting services."
arch=('x86_64')
url="http://www.4kdownload.com/products/product-youtubetomp3"
license=('custom:eula')
depends=('qt5-script' 'qt5-declarative' 'portaudio' 'ffmpeg' 'openssl-1.0')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "fix_symlink_path.patch")
sha256sums=('00ddce88e1117c9d1e33e02977b09b2b2fd0e15d938369638adb49ab2acc5fe7'
            '817d14b4948567bc2825725426345efd68d77f25572a64617ec08aabb2e6a5c9'
            'b25f830bb1fe559ea9f0b35cc9eb8ab75e2e40d09b8755f937451f5ddeeec2fd'
            '1bc2c992e21bae6c51f3176f4c3e04577b3297ea98ffc45fb56ce802423cf6cb')

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
  install -m 644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.png"
  # Install files
  cd "${pkgname}"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "${pkgname}-bin"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/audio"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/audio" audio/*
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/translation"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/translation" translation/*
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "${pkgname}.sh"
  # Temporarily ship bundled QT5 libraries as system libraries are unsupported
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "icudtl.dat"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" libQt5*
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "QtWebEngineProcess"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" qtwebengine_*.pak
  cp -r imageformats platforms platforminputcontexts platformthemes \
        Qt QtGraphicalEffects QtQml QtQuick QtQuick.2 QtWebEngine xcbglintegrations \
    "${pkgdir}/usr/lib/${pkgname}"
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "doc/eula"
}
