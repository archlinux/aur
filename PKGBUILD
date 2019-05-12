# Maintainer: Adler Neves <contato@adlerneves.eti.br>

provides=('pathio')
conflicts=('pathio')
_channel=beta
pkgver=0.5.3
pkgname=pathio-$_channel-bin
pkgrel=1
pkgdesc="A modern slicer for extrusion 3D printing provided by E3D Skunkworks (binary AppImage)."
arch=('x86_64')
url="https://pathio.xyz/"
options=('!strip')
license=('custom')
_filename="pathio-$pkgver-$_channel.AppImage"
source=("$_filename::https://api.pathio.xyz/api/asset/download/$_channel/linux/"
	pathio.sh
        license)
sha512sums=('999baf9dc8812db69fc7baf7d39be4f46b8ebd48fb542437bae8677fdb99716ba1c8a26740e123f76f34be0816da8a3b39381691e7b6f6af13d7ef74e770f4cc'
            '7cee7ed780dbe2f0a7e7221836bc40da0d5e295a40e2689ffc6f9da0fc11a9edfba12dd3d8214cd5f1bed30fe9755cb4742f7c36d12573e6a9f97b39c0b69981'
            '5a1f7082e2d3cbe62878d7e00848969beb2bcb62e6c18549f2f73d1eb455810fa0cf198fa1e6d739bacade20d7dfbfc620a7d998024caf03e7347f8061ab9b08')

bluearrow() {
  echo -n -e "  \e[1m\e[34m->\e[39m\e[0m "
  echo $@
}

prepare() {
  cd "${srcdir}"
  
  bluearrow Extracting AppImage
  chmod +x ${_filename}
  ./${_filename} --appimage-extract &>/dev/null

  bluearrow Creating CLI launcher
  sed -i "s/\${_filename}/${_filename}/" "${srcdir}/pathio.sh"

  bluearrow Setting desktop entry to use CLI launcher
  sed -i "s/^Exec=.*$/Exec=\/usr\/bin\/pathio %U/" "${srcdir}/squashfs-root/pathio.desktop"
}

package() {
  bluearrow AppImage and its license
  install -D -m 644  "${srcdir}/license" "${pkgdir}/opt/appimages/${_filename}.license"
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

