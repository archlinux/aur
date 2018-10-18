# Maintainer: Ding Xiao <tinocodfcdsa10@mails.tsinghua.edu.cn>
# Maintainer: Jingbei Li <i@jingbei.li>
# Maintainer: Alia Skywol <skywol@qq.com>

pkgname=deepin-wechat
pkgver=2.6.4.38
pkgrel=4
pkgdesc="Tencent WeChat Client on Deepin Wine Updated"
arch=("x86_64")
url="http://www.deepin.com/"
license=('custom')
depends=('wine' 'lib32-libldap' 'p7zip' 'xdotool' 'xorg-xwininfo' 'deepin-wine')
makedepends=('unzip' 'tar')
optdepends=('noto-fonts-cjk: Chinese fonts that wine recognizes (you can use other fonts, but you will have to configure manually on winecfg)'
	    'gnome-shell-extension-topicons-plus-huttli-git: Show tray icon on topbar on gnome instead of wine floating window')

_mirror="https://mirrors.tuna.tsinghua.edu.cn/deepin"
source=("$_mirror/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.2.31deepin0_i386.deb" "http://dldir1.qq.com/weixin/Windows/WeChat_2.6.4_update38.zip?a=1&toclientver=1644561446&uin=40264189&clientver=1644561446&url=Windows+7&from=getupdateinfo")
sha1sums=('8e427de964b83c642ff51f180ad161c3d754ca36' '3df040485533ba2cc298c06377e68d3919fe0f00')

package() {
  cd ${srcdir}
  #1) Install deepin-wine wechat!
  tar -xvf data.tar.xz -C ${pkgdir}

  #2) Install update version with latest wechat (it'd be awesome if I could figure out how to get this in a more human readable format for next update:) )
  unzip 'WeChat_2.6.4_update38.zip?a=1&toclientver=1644561446&uin=40264189&clientver=1644561446&url=Windows+7&from=getupdateinfo' -d update
  cp ${pkgdir}/opt/deepinwine/apps/Deepin-WeChat/files.7z ./
  7za x files.7z -ofiles
  cp update/* 'files/drive_c/Program Files/Tencent/WeChat/'
  cd files
  7za a files.7z
  cd ..
  cp files/files.7z "${pkgdir}"/opt/deepinwine/apps/Deepin-WeChat/files.7z

  #3) Fix deepin-wine language to correctly print CJK characters
  cd ${pkgdir}
  chmod -x usr/share/applications/deepin.com.wechat.desktop
  sed '30a\sed -i "s/deepin-wine/LANG=zh_CN.UTF-8 wine/" $1/drive_c/deepin/EnvInit.sh' -i opt/deepinwine/apps/Deepin-WeChat/run.sh
  
}
