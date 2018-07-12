# Maintainer: CountStarlight <countstarlight@gmail.com>
# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
# Maintainer: ssfdust <ssfdust@gmail.com>

pkgname=wine-qq-music
pkgver=15.9.5
pkgrel=0
pkgdesc="Tencent QQ music on wine For Archlinux"
arch=("x86_64")
url="http://y.qq.com/"
license=('custom')
depends=('p7zip' 'wine' 'wine-mono' 'wine_gecko' 'xorg-xwininfo' 'xdotool' 'wqy-microhei' 'adobe-source-han-sans-cn-fonts' 'lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-libpulse' 'lib32-openal')
install="wine-qq-music.install"
source=("https://dldir1.qq.com/music/clntupate/QQMusicSetup.exe"
  "https://github.com/countstarlight/wine-qq-music-arch/raw/master/data.7z"
  "run.sh"
  "reg_files.tar.bz2"
  "update.policy")
md5sums=('d43ebec09d182c9e561c596fe8b47452'
  'b4c3f538c12a39c660ef345b9aeff6ad'
  '9cf044bc9bf692a04ba34ee2c869c36c'
  'ebde755e3bd213550f5ccc69d3192060'
  'a66646b473a3fbad243ac1afd64da07a')

build() {
  msg "Extracting QQ Music archive ..."
  7z x -aoa "data.7z" -o"${srcdir}/"
  msg "Adding config files and fonts"
  tar -jxvf reg_files.tar.bz2 -C "${srcdir}/"
  cp userdef.reg "${srcdir}/qqmusicdir/userdef.reg"
  cp system.reg "${srcdir}/qqmusicdir/system.reg"
  cp update.policy "${srcdir}/qqmusicdir/update.policy"
  cp user.reg "${srcdir}/qqmusicdir/user.reg"
  ln -sf "/usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc" "${srcdir}/qqmusicdir/drive_c/windows/Fonts/wqy-microhei.ttc"
  ln -sf "/usr/share/fonts/adobe-source-han-sans/SourceHanSansCN-Medium.otf" "${srcdir}/qqmusicdir/drive_c/windows/Fonts/SourceHanSansCN-Medium.otf"
  msg "Repackaging app archive ..."
  7z a -t7z -r "${srcdir}/files.7z" "${srcdir}/qqmusicdir/*"
}

package() {
  msg "Preparing icons ..."
  install -d "${pkgdir}/usr/share"
  cp -a ${srcdir}/dpkgdir/usr/share/* "${pkgdir}/usr/share/"
  msg "Copying QQ Music to /opt/customwine/apps/QQ-Music ..."
  install -d "${pkgdir}/opt/customwine/apps/QQ-Music"
  install -m644 "${srcdir}/files.7z" "${pkgdir}/opt/customwine/apps/QQ-Music/"
  install -m755 "${srcdir}/run.sh" "${pkgdir}/opt/customwine/apps/QQ-Music/"
  install -m644 "${srcdir}/QQMusicSetup.exe" "${pkgdir}/opt/customwine/apps/QQ-Music/"
}
