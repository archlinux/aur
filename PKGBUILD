# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=moonfm-bin
_pkgname=${pkgname%-bin}
pkgver=5.0.2
pkgrel=1
pkgdesc="An easy to use podcast player for podcast lovers, discover the best of over 600,000+ podcasts."
arch=('x86_64')
url='https://moon.fm/'
license=('unknown')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('electron25')
source=("https://moon.fm/dist/MoonFM-${pkgver}-${arch}.AppImage"
        "${_pkgname}.sh")
sha256sums=('f0b7a09ca2b2a8f2d64d703dc600e1af0c7cd47fcea101f0da41e44226fc78eb'
            '639c35b7f4e966485999e6af98bc94765e16a4196e1f582541330c640520faab')
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
