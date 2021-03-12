# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=after-school
pkgver=1
pkgrel=2
pkgdesc="After School is a short videogame entirely handpainted on paper, using pencils and watercolors."
arch=(i686 x86_64)
url="https://ateliersento.itch.io/after-school"
license=('custom')
depends=(lib32-libgl lib32-gdk-pixbuf2 lib32-libxcursor lib32-libxrandr)
makedepends=(unzip)
source=(after-school.desktop
        after-school.png)
md5sums=('27d65a6caf3d071c04ff0fe4753d327d'
         '6b30fc39b12b080053f8063d51b76e70')
package() {
  cd "${srcdir}"
  # Hacky way to get the actual download URL
  game_url=$(curl -s -XPOST "https://ateliersento.itch.io/after-school/file/125815?after_download_lightbox=true" | grep -Po '"url":.*?[^\\]",' | cut -c8- | rev |cut -c3- | rev | sed 's/\\\//\//g')
  curl -o after_school.zip ${game_url}
  unzip -o after_school.zip
  
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/${pkgname}
  mkdir -p "${pkgdir}"/usr/share/{applications,icons}

  cp "${srcdir}"/AfterSchool* "${pkgdir}"/usr/share/${pkgname} -R

  install -m755 "${srcdir}"/AfterSchool.x86 "${pkgdir}"/usr/share/${pkgname}/AfterSchool
  
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;

  install -m644 "${srcdir}"/${pkgname}.png "${pkgdir}"/usr/share/icons
  install -m644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications

  chmod +x "${pkgdir}"/usr/share/${pkgname}/AfterSchool

  ln -s /usr/share/${pkgname}/AfterSchool "${pkgdir}"/usr/bin/${pkgname}
}
