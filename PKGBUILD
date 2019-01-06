# Maintainer: CountStarlight <countstarlight@gmail.com>

pkgname=deepin-wine-thunderspeed
pkgver=7.10.35.366deepin18
pkgrel=1
pkgdesc="Thunderspeed(Xun Lei) on Deepin Wine For Archlinux"
arch=("x86_64")
url="http://dl.xunlei.com/"
license=('custom')
depends=('p7zip' 'wine' 'wine-mono' 'wine_gecko' 'xorg-xwininfo' 'wqy-microhei' 'adobe-source-han-sans-cn-fonts')
conflicts=('deepin.com.thunderspeed')
install="deepin-wine-thunderspeed.install"
_mirror="https://mirrors.ustc.edu.cn/deepin"
source=("$_mirror/pool/non-free/d/deepin.com.thunderspeed/deepin.com.thunderspeed_${pkgver}_i386.deb"
  "run.sh")
md5sums=('8b6894e19d625844da4a6a85ab1c40ff'
  'ef1dfefa4264ebd574142c97ac39d16c')

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  sed "s/\(Categories.*$\)/\1Network;/" -i "${srcdir}/dpkgdir/usr/share/applications/deepin.com.thunderspeed.desktop"
  msg "Extracting Deepin Wine Thunderspeed archive ..."
  7z x -aoa "${srcdir}/dpkgdir/opt/deepinwine/apps/Deepin-ThunderSpeed/files.7z" -o"${srcdir}/deepinqqdir"
  ln -sf "/usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc" "${srcdir}/deepinqqdir/drive_c/windows/Fonts/wqy-microhei.ttc"
  ln -sf "/usr/share/fonts/adobe-source-han-sans/SourceHanSansCN-Medium.otf" "${srcdir}/deepinqqdir/drive_c/windows/Fonts/SourceHanSansCN-Medium.otf"
  msg "Repackaging app archive ..."
  7z a -t7z -r "${srcdir}/files.7z" "${srcdir}/deepinqqdir/*"
}

package() {
  msg "Preparing icons ..."
  install -d "${pkgdir}/usr/share"
  cp -a ${srcdir}/dpkgdir/usr/share/* "${pkgdir}/usr/share/"
  msg "Copying ThunderSpeed to /opt/deepinwine/apps/Deepin-ThunderSpeed ..."
  install -d "${pkgdir}/opt/deepinwine/apps/Deepin-ThunderSpeed"
  install -m644 "${srcdir}/files.7z" "${pkgdir}/opt/deepinwine/apps/Deepin-ThunderSpeed/"
  install -m755 "${srcdir}/run.sh" "${pkgdir}/opt/deepinwine/apps/Deepin-ThunderSpeed/"
}
