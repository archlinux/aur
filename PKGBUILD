# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
heidisqlrelease=7320
shortpkgver=12.20
pkgname=heidisql-wine
pkgver=${shortpkgver}.0.${heidisqlrelease}
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases. This package uses the latest nightly build (64bit) on top of the portable version, and uses Wine."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(bash wine)
makedepends=(unzip)
source=("https://github.com/HeidiSQL/HeidiSQL/releases/download/v${shortpkgver}/HeidiSQL_${shortpkgver}_64_Portable.zip"
        "https://www.heidisql.com/builds/heidisql64.r${heidisqlrelease}.exe"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('d84742736e4508c206c28c58018bbd934319c941dc9d68ff4673737a3f4df731'
            'ba234f31bf076fef0ceffbae46b6f962e1cf4b0b7d32444d1222c5cdd723f695'
            'd0f6c19b7aa4b7a6daa00b658a852f97d35dd98d2c31a2f4ea267527bf5cda15'
            '07abdaeab2b5c30ed7b053cce5e42942cc32c56503439eff69fb21b57c522122'
            '840acb31ca1de8d029e725fded1ac09df0314dea41da53f15f4cd3848e34bb00')
noextract=("HeidiSQL_${shortpkgver}_64_Portable.zip")


package() {
  # Unzip files from the .zip file
  install -d -m755 ${pkgdir}/usr/share/$pkgname
  unzip "$srcdir/HeidiSQL_${shortpkgver}_64_Portable.zip" -d "$srcdir/unzipped"
  
  # Overwrite with nightly build file
  cp "$srcdir/heidisql64.r${heidisqlrelease}.exe" "$srcdir/unzipped/heidisql.exe"
  
  # Install files
  cp -ra "$srcdir/unzipped/"* "${pkgdir}/usr/share/${pkgname}"
  
  # Set proper permissions
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;

  # Install the startup script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install the icon
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the .desktop
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
