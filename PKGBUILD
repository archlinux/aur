# Maintainer: Adler Neves <adlerosn@gmail.com>

provides=('pathio')
conflicts=('pathio')
_channel=beta
pkgver=0.6.2_1
pkgname=pathio-beta-bin
pkgrel=0
_upstream_version=0.6.2
_upstream_channel=beta
pkgdesc="A modern slicer for extrusion 3D printing provided by E3D Skunkworks (binary AppImage)."
arch=('x86_64')
makedepends=('elinks')
url="https://pathio.xyz/"
options=('!strip')
license=('custom:Pathio Software License Agreement')
_filename="pathio-$_channel-v$_upstream_version-$_upstream_channel$pkgrel.AppImage"
source=("$_filename::https://api.pathio.xyz/api/asset/download/98"
        license.html::https://docs.pathio.xyz/pathio/latest/legal/termsAndConditions.html
        pathio.sh)
sha512sums=('393bd56d51217ca3c95e40fc3b62450beaf349937dd99f2d0bc4e33e489392aaded8c922d1f925f6cf6a870dfab34c2728b4c1e246a6c38d2256b39910e84538'
            '874c78ef8c5f558637f32196bab0fab1abe2f407e154d34b147cf6bad94a7b5f9804c70e4793f625348d05dbdbdb0ea922ca9740a45f7ee4d7eb5b6b31dbfa1b'
            '7cee7ed780dbe2f0a7e7221836bc40da0d5e295a40e2689ffc6f9da0fc11a9edfba12dd3d8214cd5f1bed30fe9755cb4742f7c36d12573e6a9f97b39c0b69981')

bluearrow() {
  echo -n -e "  \e[1m\e[34m->\e[39m\e[0m "
  echo $@
}

prepare() {
  cd "${srcdir}"

  bluearrow Converting license to plain text
  cat license.html | xargs echo | sed -re "s/^.*(<article.*?<\/article>).*$/\1/mg" | elinks -dump -dump-width 80 -no-references -no-numbering -force-html > LICENSE
  
  bluearrow Extracting AppImage
  chmod +x ${_filename}
  ./${_filename} --appimage-extract &>/dev/null

  bluearrow Creating CLI launcher
  sed -i "s/\${_filename}/${_filename}/" "${srcdir}/pathio.sh"

  bluearrow Setting desktop entry to use CLI launcher
  sed -i "s/^Exec=.*$/Exec=\/usr\/bin\/pathio %U/" "${srcdir}/squashfs-root/pathio.desktop"
}

package() {
  bluearrow License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bluearrow AppImage
  install -D -m 755  "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"

  bluearrow CLI launcher
  install -D -m 755  "${srcdir}/pathio.sh" "${pkgdir}/usr/bin/pathio"

  bluearrow Application icon
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  install -D -m 644  "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/pathio.png" "${pkgdir}/usr/share/pixmaps/"

  bluearrow Desktop entry
  install -Dm644 "${srcdir}/squashfs-root/pathio.desktop" "${pkgdir}/usr/share/applications/pathio.desktop"
}
