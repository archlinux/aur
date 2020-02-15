# Maintainer: St.kai <St.kai@live.com>

pkgname=deepin-wine-wxwork
pkgver=3.0.7.1708
wxwork_installer=WXWork
deepinwxworkver=2.8.10.2010deepin0
pkgrel=1
pkgdesc="Tencent WXWork (com.wxwork) on Deepin Wine For Archlinux"
arch=("x86_64")
url="https://weixin.qq.com/"
license=('custom')
depends=('p7zip' 'wine' 'wine-mono' 'wine_gecko' 'xorg-xwininfo' 'wqy-microhei' 'lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-libpulse' 'lib32-openal' 'lib32-mpg123' 'lib32-libldap')
conflicts=('deepin-wxwork')
install="deepin-wine-wxwork.install"
_mirror="https://mirrors.ustc.edu.cn/deepin"
source=("$_mirror/pool/non-free/d/deepin.com.weixin.work/deepin.com.weixin.work_${deepinwxworkver}_i386.deb"
  "${wxwork_installer}-${pkgver}.exe::https://dldir1.qq.com/wework/work_weixin/${wxwork_installer}_${pkgver}.exe"
  "run.sh")
md5sums=('a82495943fe4b748cf2b740704f1ec45'
  '4fe39dbaa7473ff281ec52090c8bbdbb'
  '262e9832f292f6d7641d6033d797d55d')

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  sed "s/\(Categories.*$\)/\1Network;/" -i "${srcdir}/dpkgdir/usr/share/applications/deepin.com.weixin.work.desktop"
  sed "13s/WXWork.exe/wxwork.exe/" -i "${srcdir}/dpkgdir/usr/share/applications/deepin.com.weixin.work.desktop"
  msg "Extracting Deepin Wine WXWork archive ..."
  7z x -aoa "${srcdir}/dpkgdir/opt/deepinwine/apps/Deepin-WXWork/files.7z" -o"${srcdir}/deepinwxworkdir"
  msg "Removing original outdated WXWork directory ..."
  rm -r "${srcdir}/deepinwxworkdir/drive_c/Program Files/WXWork"
  # msg "Patching reg files ..."
  # patch -p1 -d "${srcdir}/deepinwxworkdir/" < "${srcdir}/reg.patch"
  msg "Creating font file link ..."
  ln -sf "/usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc" "${srcdir}/deepinwxworkdir/drive_c/windows/Fonts/wqy-microhei.ttc"
  msg "Repackaging app archive ..."
  7z a -t7z -r "${srcdir}/files.7z" "${srcdir}/deepinwxworkdir/*"
}

package() {
  msg "Preparing icons ..."
  install -d "${pkgdir}/usr/share"
  cp -a ${srcdir}/dpkgdir/usr/share/* "${pkgdir}/usr/share/"
  msg "Copying WXWork to /opt/deepinwine/apps/Deepin-WXWork ..."
  install -d "${pkgdir}/opt/deepinwine/apps/Deepin-WXWork"
  install -m644 "${srcdir}/files.7z" "${pkgdir}/opt/deepinwine/apps/Deepin-WXWork/"
  install -m755 "${srcdir}/run.sh" "${pkgdir}/opt/deepinwine/apps/Deepin-WXWork/"
  install -m644 "${srcdir}/${wxwork_installer}-${pkgver}.exe" "${pkgdir}/opt/deepinwine/apps/Deepin-WXWork/"
  msg "Printing help info ..."
  echo -e "\033[0;34m============================提示/INFO==============================="
  echo -e "\033[0;34m* 报告问题(Report issue):"
  echo -e "\033[0;34m  https://github.com/St-kai/deepin-wine-wxwork-arch/issues"
  # echo -e "\033[0;34m* 切换到 'deepin-wine'(Switch to 'deepin-wine'):"
  # echo -e "\033[0;34m  "
  echo -e "\033[0;34m* 安装包下载(Installation package download):"
  echo -e "\033[0;34m  https://github.com/St-kai/deepin-wine-wxwork-arch/releases"
  echo -e "\033[0;34m===================================================================="
}
