# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=thunder-mini
pkgver=1.5.3.288
pkgrel=1
pkgdesc="Xunlei officially released a compact download tool with dedicated download function."
arch=("i686" "x86_64")
url="https://dl.xunlei.com/"
license=('custom')
makedepends=('icoutils')
depends=('wine')
source=(
  "http://down.sandai.net/mini/ThunderMini_dl1.5.3.288.exe"
  "license.html::https://www.xunlei.com/xieyi/xl9.html"
  "file://run"
  "file://${pkgname}.desktop"
)

prepare() {
  cd "${srcdir}"
  7z x -y ThunderMini_dl1.5.3.288.exe
  rm ./Bin/UnInstallClean.exe
}

build() {
  mkdir -p "${srcdir}/ico"
  wrestool -x -o "${srcdir}/ico" -t14 "${srcdir}/Bin/ThunderMini.exe"
  icotool -x -o "${srcdir}/ico" "${srcdir}/ico/ThunderMini.exe_14_116_2052.ico"
}

package() {

  # Copy files
  install -d "${pkgdir}/usr/share/$pkgname"
  cp -r "$srcdir/"{Bin,bho,Skin} "${pkgdir}/usr/share/$pkgname/"
  cp "$srcdir/\$WINDIR/system32/"* "${pkgdir}/usr/share/$pkgname/Bin/"
  find "${pkgdir}/usr/share/$pkgname/" -type d -exec chmod 755 {} \;
  
  # Install Run script
  install -Dm755 run "${pkgdir}/usr/share/$pkgname/run"
  install -d "${pkgdir}/usr/bin/"
  ln -sf "/usr/share/$pkgname/run" "${pkgdir}/usr/bin/$pkgname"
  
  # Install licenses
  install -Dm644 "license.html" "${pkgdir}/usr/share/licenses/$pkgname/license.html"
  
  # Install icons
  for size in 16x16 32x32 48x48; do
    install -Dm644 "${srcdir}/ico/ThunderMini.exe_14_116_2052_"?"_${size}x32.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
  done
  
  # Install desktop file
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
md5sums=('95118524fa7d7e457c7bed4abcb5bbfc'
         '381254665d06cdd2c9493a8892e32bc5'
         '3c57bb9d9375bf00c11230caaf12ed5f'
         '227afd0034719425b6d69379efd6558a')

