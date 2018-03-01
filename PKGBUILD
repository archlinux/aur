# Maintainer: Prasad Kumar
pkgname=stremio-beta
pkgver=4.0.4
pkgrel=2
pkgdesc="Watch videos, movies, TV series and TV channels instantly. (Beta Version)"
arch=('x86_64')
url="https://stremio.com"
license=('custom')
provides=('stremio-beta')
makedepends=('sed')
options=('!strip')
source=("${pkgname}.appimage::https://dl.strem.io/linux/v${pkgver}/Stremio+${pkgver}.appimage")
sha512sums=('9c5a6fa70b4a6dbdaab8119085c936bd46a8a63eda397d25126e2e48b798870eef9b8cb432137911092721d7aea06b82ff02d69b41f106dcf54d4d3b3f70268f')

prepare() {
  chmod +x ${pkgname}.appimage
  ./${pkgname}.appimage --appimage-extract
  find ${srcdir}/squashfs-root/ -type d -exec chmod 755 {} \;
}

package() {
  cd "${srcdir}/squashfs-root/"
  install -d $pkgdir/{opt/$pkgname,usr/bin}

  cp -r "lib" "${pkgdir}/opt/${pkgname}/"
  cp -r "libexec" "${pkgdir}/opt/${pkgname}/"
  cp -r "plugins" "${pkgdir}/opt/${pkgname}/"
  cp -r "qml" "${pkgdir}/opt/${pkgname}/"
  cp -r "resources" "${pkgdir}/opt/${pkgname}/"
  cp -r "translations" "${pkgdir}/opt/${pkgname}/"
  install -Dm755 node "${pkgdir}/opt/${pkgname}/"
  install -Dm644 qt.conf "${pkgdir}/opt/${pkgname}/"
  install -Dm644 server.js "${pkgdir}/opt/${pkgname}/"
  install -Dm644 start-linux.sh "${pkgdir}/opt/${pkgname}/"
  install -Dm755 stremio "${pkgdir}/opt/${pkgname}/"
  install -Dm755 stremio.asar "${pkgdir}/opt/${pkgname}/"
  install -Dm755 'stremio web.sh' "${pkgdir}/opt/${pkgname}/"

  ln -s /opt/${pkgname}/stremio "${pkgdir}"/usr/bin/stremio-beta
  install -Dm644 stremio.desktop "$pkgdir/usr/share/applications/stremio-beta.desktop"
  sed -i 's/Name=Stremio/Name=Stremio\ Beta/g; s/Exec=.\/stremio/Exec=stremio-beta/g; s/Icon=stremio/Icon=stremio-beta/g' $pkgdir/usr/share/applications/stremio-beta.desktop
  install -Dm644 "stremio.png" "$pkgdir/usr/share/icons/stremio-beta.png"
}
