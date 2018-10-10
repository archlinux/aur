# Contributor: Vladimir Navrat <vn158 at seznam dot cz>

pkgname=suave
pkgver=2.0
pkgrel=1
pkgdesc="Sport Utility Assault Vehicle Extreme. Drive very small, but very brave tank."
arch=('i686' 'x86_64')
license=('custom:freeware')
url="https://archive.org/details/Sport-Utility_Assault_Vehicle_Extreme"
depends=(wine lib32-libpulse)
makedepends=(innoextract p7zip imagemagick)
source=("https://archive.org/download/Sport-Utility_Assault_Vehicle_Extreme/Suave_Installer_20.exe" suave suave.desktop)
noextract=("Suave_Installer_20.exe")

md5sums=('4274086d09d0d2fdfc457eec177ab986'
         '36c8c49d95b8b40bb1a468807dfbe32d'
         '329abcc1e285ccd9c560781d495a1788')
sha256sums=('1fac1941630f63f9721883cc3b7650ab93666785a2d05e6ad0d5c6396fe29f39'
            'c1ef0d28257c3cac0f0c83be6bf0e1becbfcccb3c8b074c551b8b1a986e0ad8b'
            '1fbd25762e6e8cfb400204439c96461dd3daf4f5601994f096999665bfb2ce96')

prepare() {
  cd ${startdir}/src
  innoextract Suave_Installer_20.exe
  cd app
  7z e SUAVE.exe 50.ico -r -y
  convert 50.ico ../suave.png
}

package() {
  cd ${startdir}/src/app
  find . -type f -name "*" | while read file; do
    echo $file
    install -m 644 -D "${file}" "$pkgdir/usr/share/$pkgname/${file#source/}"
  done

  # Install startup script
  cd ${startdir}/src
  install -m 755 -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # Install desktop file
  install -m644 -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Install desktop icon
  install -m644 -D ${pkgname}.png "${pkgdir}/usr/share/${pkgname}"
}
