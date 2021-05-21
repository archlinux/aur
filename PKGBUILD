# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=com.qq.tim.spark
pkgver=3.3.5.22018spark0
pkgrel=1
epoch=
pkgdesc="Tencent TIM Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="http://tim.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine5' 'p7zip' 'xdg-utils' 'hicolor-icon-theme' 'noto-fonts-cjk' 'deepin-wine-helper')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('com.qq.tim.dcs')
replaces=()
backup=()
options=()
install=tim.install
changelog=
source=("https://store.deepinos.org.cn/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb"
    "reg.patch")
sha512sums=('2ebcebdfea35ff6468f5a8acb4ca8dbbd8c4b3cb0e15d57318d97bb9a98753ec9a6595037f142e9866643c6e9ef927abf3124c6ae6381539d880e516d29a5ee8'
    '5730066dc9bf3689e3db1c08ba83b516efc0bcc7fe6ff47198b43dd352718a6942d01190da87fe010816bf1e9e0e453a09fd15314e4004c309e7f52725b32528')
validpgpkeys=()

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  msg "Extracting Deepin Wine TIM archive ..."
  7z x -aoa "${srcdir}/dpkgdir/opt/apps/com.qq.tim.spark/files/files.7z" -o"${srcdir}/deepintimdir"
  msg "Patching reg files ..."
  patch -p1 -d "${srcdir}/deepintimdir/" < "${srcdir}/reg.patch"
  msg "Repackaging app archive ..."
  7z a -t7z -r "${srcdir}/files.7z" "${srcdir}/deepintimdir/*"
}


package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
    install -m644 "${srcdir}/files.7z" "${pkgdir}/opt/apps/com.qq.tim.spark/files"
    msg "Preparing icons ..."
    sed -i 's/TIM.exe/tim.exe/' opt/apps/${pkgname}/entries/applications/com.qq.tim.spark.desktop
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
}
