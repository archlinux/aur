# Maintainer: shashasha <y2mammwodye5whd2rywiej1u at systemli dot org>
# mostly copied from the balena-etcher-appimage PKGBUILD

pkgname=destiny-appimage
pkgver=1.0.3
pkgrel=1
pkgdesc="The latest stable AppImage of Destiny - a Cross-platform Magic Wormhole graphical client"
arch=('x86_64')
url="https://github.com/LeastAuthority/destiny"
license=('MIT')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  ${url}/releases/download/v${pkgver}/destiny_linux_amd64.AppImage
)
sha512sums=('7f3a197356f38e365fec1f473c06e4632de4e6c72fdd523d42c86d3d995af39931804d35c346121bb2bb72453fb97657fb7e065a18761172d48584065e03f5b8'
)
_image="$(basename "${source[0]}")"

prepare() {
  cd "${srcdir}"
  chmod +x "${_image}"
  ./"${_image}" --appimage-extract
  sed -i -e "s/AppRun/\/usr\/bin\/destiny/" "${srcdir}/squashfs-root/destiny.desktop"
  cat > destiny.sh <<EOF
#!/bin/sh
/opt/destiny/destiny_linux_amd64.AppImage "\$@"
EOF
}

package() {
  install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/destiny/${_image}"
  install -Dm755 "${srcdir}/destiny.sh" "${pkgdir}/usr/bin/destiny"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/squashfs-root/destiny.desktop" "${pkgdir}/usr/share/applications/destiny.desktop"
}


