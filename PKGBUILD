# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Maximilien Noal <noal dot maximilien at gmail dot com> [AUR: xcomcmdr]
# Contributor: Kirill "reflexing" Churin <reflexing@reflexing.ru>
# Contributor: Wido <widowild [at] myopera [dot] com>

# Comments from jyantis:
# Because of a bug with the way it continously updates and creates a million lib
# Directories. And since it is GPL3
# I am going to host an easy to install version for now for x_86_64.
# I am assuming this is due to a programming bug and not the original PKGBUILD
# /opt/desura/lib/lib/lib/lib/lib/lib/lib/lib/lib/lib/lib/desura
# for the i686 user you will need to hit cancel after its second round of downloading

# This needs these older libs to work properly (which I have included)
# libcurl.so.3 # Using package libcurl-compat since it doesn't overwrite the newer version
# libboost_filesystem.so.1.54.0 # Downloading these as binaries since it would overwrite
# libboost_system.so.1.54.0 # Downloading these as binaries since it would overwrite

pkgname=desura
pkgver=120.25
pkgrel=7
pkgdesc="A gaming client application that allows users single-click access to download and install games from http://www.${pkgname}.com/"
arch=("i686" "x86_64")
url="http://${pkgname}.com/"
license=("GPL3")
depends=("alsa-lib"
         "gtk2"
         "libcurl-compat"
         "libjpeg6-turbo"
         "libnotify"
         "libpng12"
         "libxpm"
         "libxslt"
         "nss"
         "orbit2"
         "xdg-utils")
depends_i686=("glibc")
depends_x86_64=("lib32-glibc")
optdepends=("adobe-air: for Adobe Air-based games"
            "glew1.5: if you have install M.A.R.S - a ridiculous shooter"
            "java-runtime: adds java support"
            "mono: Free implementation of the .NET platform")
optdepends_i686=("catalyst-utils: If you have ATI graphics"
                 "curl: if you have install TRAUMA"
                 "nvidia-utils: If you have nvidia graphics")
optdepends_x86_64=("lib32-catalyst-utils: If you have ATI graphics"
                   "lib32-curl: if you have install TRAUMA"
                   "lib32-nvidia-utils: If you have nvidia graphics")
#Use this source instead if it becomes available again: "http://www.${pkgname}.com/${pkgname}-${arch[0].tar.gz"
source_i686=("${pkgname}-${pkgver}.tar.gz::http://yantis-scripts.s3.amazonaws.com/${pkgname}_${pkgver/./_}.tar.gz"
             "http://yantis-scripts.s3.amazonaws.com/libboost_filesystem.so.1.54.0-${arch[0]}"
             "http://yantis-scripts.s3.amazonaws.com/libboost_system.so.1.54.0-${arch[0]}")
#Use this source instead if it becomes available again: "http://www.${pkgname}.com/${pkgname}-${arch[1].tar.gz"
source_x86_64=("${pkgname}-${pkgver}.tar.gz::http://yantis-scripts.s3.amazonaws.com/${pkgname}_${pkgver/./_}.tar.gz"
               "http://yantis-scripts.s3.amazonaws.com/libboost_filesystem.so.1.54.0-${arch[1]}"
               "http://yantis-scripts.s3.amazonaws.com/libboost_system.so.1.54.0-${arch[1]}")
source=("${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums_i686=("f195aa8c9c833460d925085da3b16f3929c85983433a3c0b84de34b6338adecb"
                 "63d39e037e2ab7c6c91aecbcf14b33b28832a6ceb5e07168191588e4beae4d5c"
                 "e2da74c6862cec82acd700ce02014ab80558ee136c3cf62afe66bc2da5e8554f")
sha256sums_x86_64=("f195aa8c9c833460d925085da3b16f3929c85983433a3c0b84de34b6338adecb"
                   "038ae4c5206c5c5ea44e17df3f427c2a8d268beac67708494dccfa9296f71ded"
                   "992ac1efecb84150431d81f12cb41cf67a1995e3f79731f8bfc585c94c394aac")
sha256sums=("17afbe089046570ef99f99dd8fe23e463486c7c0d389de3e8efcfeb53c3d5765"
            "074bf91129a7f038309f0504b980ecfefc84de27ca866b5658ace6731650abab"
            "9b125fe981342e3e16a5c9d1c1fa921da0b77f4ea9d0b79a52bebb780c60f851")

package() {
  msg2 "Changing permissions to /opt/${pkgname}"
  install -d -m755 -g users "${pkgdir}/opt/${pkgname}"

  msg2 "Installing application into /opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${pkgname}/"
  
  msg2 "Installing launcher into /usr/bin"
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  msg2 "Installing older boost libraries without overwriting newer ones"
  install -D -m644 "${srcdir}/libboost_filesystem.so.1.54.0-${CARCH}" "${pkgdir}/usr/lib/libboost_filesystem.so.1.54.0"
  install -D -m644 "${srcdir}/libboost_system.so.1.54.0-${CARCH}" "${pkgdir}/usr/lib/libboost_system.so.1.54.0"

  msg2 "Installing bootstrapper icon into /usr/share/icons/hicolor/256x256/apps"
  install -m 644 -D "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  msg2 "Installing bootstrapper desktop file into /usr/share/applications"
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${pkgname}.desktop"
}
