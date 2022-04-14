# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=notable-insiders-electron
pkgdesc='Insider build of the Notable note-taking app'
_electron=electron17
packager="nemo"
_pkgver="1.9.0-beta.9"
pkgver=${_pkgver/-/.}
pkgrel=2
arch=('any')
url='https://github.com/notable/notable-insiders'
license=('UNLICENSED')
makedepends=('asar')
depends=($_electron sh)
source=("$url/releases/download/v$_pkgver/Notable-$_pkgver.AppImage"
        "notable.desktop")
sha512sums=('f260695af381d3d5c8598c38f726b5f60b4c2469a9b1ed9e293286ed337c500657316528aee1373a2f414d271a6c38817c846e64e11b5de4a63bcafa9329b209'
            '3f95463979fb112d08077ecda88663a1bf978b6367b035037a6615039bafd7f3d248eaf1cce0182844f2b7d727ba8430cf2d954fe776314a1da966c5cbf99270')
provides=('notable')
conflicts=('notable-insiders-bin')

build() {
  local _source0=${source[0]##*/}
  chmod +x $_source0
  ./$_source0 --appimage-extract
  asar extract squashfs-root/resources/app.asar ${pkgname}

  cat > notable.sh <<EOF
#!/bin/sh
exec $_electron /usr/lib/${pkgname} "\$@"x
EOF
  chmod +x notable.sh
}

package() {
  install -dm 755 "${pkgdir}"/usr/lib/${pkgname}
  cp --archive --no-preserve=ownership\
     ${pkgname} "${pkgdir}"/usr/lib

  install -dm755 "${pkgdir}"/usr/share/icons/hicolor
  install -Dm755 notable.sh "${pkgdir}"/usr/bin/notable
  cp --archive \
     --no-preserve=ownership \
     squashfs-root/usr/share/icons/hicolor/* "${pkgdir}"/usr/share/icons/hicolor
  find "${pkgdir}"/usr/share/icons/hicolor -type d -exec chmod 755 {} \;

  install -Dm644 ${srcdir}/notable.desktop "${pkgdir}"/usr/share/applications/notable.desktop
}
