# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
heidisqlrelease=7000
shortpkgver=12.10
pkgname=heidisql-wine
pkgver=${shortpkgver}.0.${heidisqlrelease}
pkgrel=3
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases. This package uses the latest nightly build (64bit) on top of the portable version, and uses Wine."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(bash wine)
makedepends=(unzip)
source=("http://www.heidisql.com/downloads/releases/HeidiSQL_${shortpkgver}_64_Portable.zip"
        "http://www.heidisql.com/builds/heidisql64.r${heidisqlrelease}.exe"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('a7b0e40acc85900ff5ca63769e702acaa06e81ae658b7958e1bc794ae635fd7a'
            'c17982e753d24fb9f90212e2d11e01e08cca0641372e146b1e32d087fb9a9659'
            'd0f6c19b7aa4b7a6daa00b658a852f97d35dd98d2c31a2f4ea267527bf5cda15'
            '22dc0cac9a9662210e63235ad8622d3b33e4155e76aeb1d3d6ce6841557f7d2a'
            'b139c6f0cfc7d8aeacc2c7dd04df833fbb8c77d288e6fa53bf6845aa1e892c54')
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
