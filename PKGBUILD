# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Codist <countstarlight@gmail.com>

pkgname=deepin-wine-tim
pkgver=3.4.5.22071
_debpkgver=9.3.2deepin20
_debpkgname="com.qq.im.deepin"
_timpkgname="com.qq.office.deepin"
pkgrel=2
pkgdesc="Tencent TIM on Deepin Wine5(${_timpkgname}) For Archlinux"
arch=("x86_64")
url="https://tim.qq.com/"
license=('custom')
depends=('p7zip' 'deepin-wine5' 'deepin-wine-helper>=5.1.30_1-1' 'xorg-xwininfo' 'wqy-microhei' 'lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-libpulse' 'lib32-openal' 'lib32-mpg123' 'lib32-gnutls')
conflicts=('wine-tim' 'deepin.com.qq.office' 'deepin-tim-for-arch')
install="deepin-wine-tim.install"
_mirror="https://com-store-packages.uniontech.com"
source=("$_mirror/appstore/pool/appstore/c/${_debpkgname}/${_debpkgname}_${_debpkgver}_i386.deb"
  "https://dldir1.qq.com/qqfile/qq/TIM3.4.5/TIM${pkgver}.exe"
  "run.sh"
  "share.7z")
md5sums=('5fdc20e614d945bd2ba5251420872479'
         '91ad8ac2055e10385e8016058dfc2e7b'
         '3ffc2a7c521bb6d7c929c6fd6864ac2c'
         '479ae2a04a9c5dcc08c67c7b1395a944')

build() {
  printf "Extracting DPKG package ...\n"
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  #sed "s/\(Categories.*$\)/\1Network;/" -i "${srcdir}/dpkgdir/usr/share/applications/deepin.com.qq.office.desktop"
  #sed "13s/TIM.exe/tim.exe/" -i "${srcdir}/dpkgdir/usr/share/applications/deepin.com.qq.office.desktop"
  printf "Extracting Deepin Wine QQ archive ...\n"
  # https://sourceforge.net/p/sevenzip/bugs/2356/
  7z x -aoa -snl "${srcdir}/dpkgdir/opt/apps/${_debpkgname}/files/files.7z" -o"${srcdir}/deepintimdir"
  printf "Cleaning up the original package directory ...\n"
  rm -r "${srcdir}/deepintimdir/drive_c/Program Files/Tencent/QQ"
  #printf "Patching reg files ..."
  #patch -p1 -d "${srcdir}/deepintimdir/" < "${srcdir}/reg.patch"
  printf "Creating font file link ...\n"
  ln -sf "/usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc" "${srcdir}/deepintimdir/drive_c/windows/Fonts/wqy-microhei.ttc"
  printf "Copying latest TIM installer to ${srcdir}/deepintimdir/drive_c/Program Files/Tencent/ ...\n"
  install -m644 "${srcdir}/TIM${pkgver}.exe" "${srcdir}/deepintimdir/drive_c/Program Files/Tencent/"
  printf "Repackaging app archive ...\n"
  7z a -t7z -r "${srcdir}/files.7z" "${srcdir}/deepintimdir/*"
}

package() {
  printf "Preparing icons ...\n"
  install -d "${pkgdir}/usr/share"
  7z x -aoa "${srcdir}/share.7z" -o"${srcdir}/"
  cp -a ${srcdir}/share/* "${pkgdir}/usr/share/"
  printf "Copying deepin files ...\n"
  install -Dm644 "files.7z" -t "${pkgdir}/opt/apps/${_timpkgname}/files/"
  # cp ${srcdir}/dpkgdir/opt/apps/${_debpkgname}/files/helper_archive* "${pkgdir}/opt/apps/${_timpkgname}/files/"
  #install -m755 "${srcdir}/dpkgdir/opt/apps/${_debpkgname}/files/gtkGetFileNameDlg" "${pkgdir}/opt/apps/${_timpkgname}/files/"
  md5sum "${srcdir}/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${_timpkgname}/files/files.md5sum"
  install -Dm755 "run.sh" -t "${pkgdir}/opt/apps/${_timpkgname}/files/"
}
