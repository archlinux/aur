# Maintainer: linuxer <linuxer@artixlinux.org>
# Maintainer: Josef Miegl <josef@miegl.cz>
# Maintainer: David Cooper (dtcooper) <david@dtcooper.com>
# Contributor: goll <adrian.goll+aur[at]gmail>
# Contributor: Kosava <kosava@gmail.com>

pkgname=butt
pkgver=0.1.40
pkgrel=1
pkgdesc="Easy to use, multi OS streaming tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL2')
url="https://danielnoethen.de/butt/"
depends=('fltk' 'dbus' 'portaudio' 'libfdk-aac' 'libvorbis' 'libogg' 'lame' 'flac' 'opus' 'libsamplerate')
source=("${pkgname}-${pkgver}.tar.gz::https://danielnoethen.de/${pkgname}/release/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('920680b90dc4a0936e2fac4cb155ed11f041b440bff3e6ca696b4bf633395550c7bbcf1fceb8f4aeedd0edf7e0d3be009874a7b141961b1bc34f867e16c4381a')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr LDFLAGS="-L$(dirname $(fltk-config --libs))"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Desktop file
  install -Dm644 "usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Icons
  for size in 16 22 24 32 48 64 96 128 256 512; do
    format="${size}x${size}"
    install -Dm644 "icons/icon_${format}.png" "${pkgdir}/usr/share/icons/hicolor/${format}/apps/${pkgname}.png"
  done

  install -Dm644 "icons/icon_scalable.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  # Documentation
  for doc in AUTHORS ChangeLog COPYING KNOWN_BUGS NEWS README THANKS; do
    install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${doc}"
  done
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Pixmaps
  for file in usr/share/pixmaps/"${pkgname}"*; do
    filename="$(basename "${file}")"
    install -Dm644 "${file}" "${pkgdir}/usr/share/pixmaps/${filename}"
  done
}

# vim:set ts=2 sw=2 et:
