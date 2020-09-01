# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=com.qq.tim.dcs
pkgver=3.1.0.21789
pkgrel=1
epoch=
pkgdesc="Tencent TIM Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="http://tim.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine5' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
#conflicts=('deepin-wine-tim')
replaces=()
backup=()
options=()
install=tim.install
changelog=
source=("http://dcstore.shenmo.tech/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb"
    "reg.patch")
sha512sums=('84de5249869940898324977c7312f1ad61567748fb4a6b5a513da64b1308fbad98bcb6af7a87a9c39a9284d97b96a9f3901abcb9d296b0ef778df051792ccdfe'
    '8d5f49ec2867e91fac30a2af417520a0d9502fa29195136b2fd03d734d23b1db33a704363be1311a7457ed2988f1389495016548d57cd4643a7abda582292032')
validpgpkeys=()

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  msg "Extracting Deepin Wine TIM archive ..."
  7z x -aoa "${srcdir}/dpkgdir/opt/apps/com.qq.tim.dcs/files/files.7z" -o"${srcdir}/deepintimdir"
  msg "Patching reg files ..."
  patch -p1 -d "${srcdir}/deepintimdir/" < "${srcdir}/reg.patch"
  msg "Repackaging app archive ..."
  7z a -t7z -r "${srcdir}/files.7z" "${srcdir}/deepintimdir/*"
}


package() {
  cd ${pkgdir}
  tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
  install -m644 "${srcdir}/files.7z" "${pkgdir}/opt/apps/com.qq.tim.dcs/files"
  msg "Preparing icons ..."
  install -d usr/share
  mv opt/apps/${pkgname}/entries/* usr/share
}
