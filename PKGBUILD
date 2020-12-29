# Maintainer: Yjun <jerrysteve@gmail.com>

pkgname=moonfm-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.12
pkgrel=1
pkgdesc="An easy to use podcast player for podcast lovers, discover the best of over 600,000+ podcasts."
arch=('x86_64')
url='https://moon.fm/'
license=('unknown')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('electron')
makedepends=('asar')
source=("https://moon.fm/dist/MoonFM-${pkgver}-${arch}.AppImage"
        "${_pkgname}.sh")
sha256sums=('e12eff74825ca031dcaeeb0e1734aeb6bab0ccbc60fcac502a588dbd04534257'
            'b1cab348b5f39d870b9325dfe3363c43e272e92c3c7192758a6092ba97b92229')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
_filename=./MoonFM-${pkgver}-${arch}.AppImage

prepare() {
  cd "${srcdir}"

  chmod +x ${_filename}
  ${_filename} --appimage-extract
  sed -i "s,Exec=AppRun,Exec=/usr/bin/${_pkgname} %U,g" "squashfs-root/${_pkgname}.desktop"
}

package() {
  # wrapper
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # asar extract
  asar extract "${srcdir}/squashfs-root/resources/app.asar" ${pkgdir}/usr/lib/${_pkgname}

  # icons
  cd ${srcdir}/squashfs-root/
  find usr/share/icons -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  # hicolor-icon-theme doesn't have 1024x1024 directory:
  # pacman -Fl hicolor-icon-theme | grep 1024
  rm -rf ${pkgdir}/usr/share/icons/hicolor/1024x1024/

  # desktop entry
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
