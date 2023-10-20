# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=moonfm-bin
_pkgname=${pkgname%-bin}
pkgver=5.0.3
pkgrel=1
pkgdesc="An easy to use podcast player for podcast lovers, discover the best of over 600,000+ podcasts."
arch=('x86_64')
url='https://moon.fm/'
license=('unknown')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('electron26')
source=("https://moon.fm/dist/MoonFM-${pkgver}-${arch}.AppImage"
        "${_pkgname}.sh")
sha256sums=('9ea1caf650fcca64513d271557a4348f5acf920acbde3a87a76e31f792e2528c'
            'ec29233861a7658037655b6fe454bb3f1022328426f745c053906016b47a368a')
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
  install -Dm755 "${srcdir}/${_pkgname}.sh" \
                 "${pkgdir}/usr/bin/${_pkgname}"

  # asar extract
  install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" \
          -t ${pkgdir}/usr/lib/${_pkgname}
  cd "${srcdir}/squashfs-root/resources/"
  find app.asar.unpacked -type f \
       -exec install -Dm644 {} ${pkgdir}/usr/lib/${_pkgname}/{} \;

  # icons
  cd ${srcdir}/squashfs-root/
  # hicolor-icon-theme doesn't have 1024x1024 directory:
  # pacman -Fl hicolor-icon-theme | grep 1024
  find usr/share/icons \
       -type f \
       \( ! -iwholename "*1024x1024*" \) \
       -exec install -Dm644 {} ${pkgdir}/{} \;

  # desktop entry
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
