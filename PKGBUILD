# Maintainer: fkxxyz <fkxxyz@163.com>

pkgname=fcitx-baidupinyin
pkgver=1.0.1.0
pkgrel=1
pkgdesc="A wrapper of Baidu Pinyin IM engine for Fcitx."
arch=("x86_64")
url="https://srfsh.baidu.com/site/guanwang_linux/index.html"
license=("custom")
depends=("fcitx" "qt5-quickcontrols")
#optdepends=("fcitx-qimpanel: Configure panel and skin.")

source=(
  "https://imeres.baidu.com/imeres/ime-res/guanwang/img/Ubuntu_Deepin-fcitx-baidupinyin-64.zip"
  "https://srf.baidu.com/site/linux/service/index.html")
sha256sums=("e053946b404b8a74900db5844e27dc5d5c122a442c8676aba54e3d3e3fa64e13"
			"SKIP")

prepare(){
  cd ${srcdir}
  bsdtar -xf fcitx-baidupinyin.deb
  bsdtar -xf data.tar.xz
}

package(){
  cd "${pkgdir}"
  
  # Copy all files.
  cp -r "${srcdir}/"{usr,opt} .
  
  # Fix the location of the library.
  mv "usr/lib/x86_64-linux-gnu/"* "usr/lib"
  rm -r "usr/lib/x86_64-linux-gnu"
  
  # Fix the location of entries.
  edir="opt/apps/com.baidu.fcitx-baidupinyin/entries"
  rm -r "${edir}/autostart"
  install -d "etc/xdg/autostart"
  ln -sf "/usr/share/applications/fcitx-ui-baidu-qimpanel.desktop" \
      "etc/xdg/autostart/fcitx-ui-baidu-qimpanel-ln.desktop"
  mv "${edir}/"* "usr/share"
  rm -r "${edir}"
  
  # Install license.
  install -Dm644 "${srcdir}/index.html" \
      "usr/share/licenses/fcitx-baidupinyin/license.html"
}

