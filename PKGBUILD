# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
heidisqlrelease=7171
shortpkgver=12.15
pkgname=heidisql-wine
pkgver=${shortpkgver}.0.${heidisqlrelease}
# dev did a little oopsie and tagged with another release number this time
_heidisqlrelease_gh=${shortpkgver}.1.1
pkgrel=3
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases. This package uses the latest nightly build (64bit) on top of the portable version, and uses Wine."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(bash wine)
makedepends=(unzip)
source=("https://github.com/HeidiSQL/HeidiSQL/releases/download/v${_heidisqlrelease_gh}/HeidiSQL_${shortpkgver}_64_Portable.zip"
        "http://www.heidisql.com/builds/heidisql64.r${heidisqlrelease}.exe"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('c1105515b0a9a512718eaec4144f131e4295b4cd7d5bdb3ddeccc2845a12e7a7'
            'c6ce18284dd40e828a9f2484f2ca0a4467372cf1f5c3e87539b7a34873996098'
            'd0f6c19b7aa4b7a6daa00b658a852f97d35dd98d2c31a2f4ea267527bf5cda15'
            '07abdaeab2b5c30ed7b053cce5e42942cc32c56503439eff69fb21b57c522122'
            '840acb31ca1de8d029e725fded1ac09df0314dea41da53f15f4cd3848e34bb00')
noextract=("HeidiSQL_${shortpkgver}_Portable.zip")


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
