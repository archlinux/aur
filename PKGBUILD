# Maintainer: linuxer <linuxer@artixlinux.org>
# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: goll <adrian.goll+aur[at]gmail>
# Contributor: Kosava <kosava@gmail.com>

pkgname=butt
pkgver=0.1.37
pkgrel=1
pkgdesc="Easy to use, multi OS streaming tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL2')
url="http://butt.sourceforge.net/"
depends=('fltk' 'dbus' 'portaudio' 'libfdk-aac' 'libvorbis' 'libogg' 'lame' 'flac' 'opus' 'libsamplerate')
source=(${pkgname}-${pkgver}.tar.gz::"http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('1166c54672217e24ef604247d2dd56a68a2f36f6f59e94149b70d55b0c576f17b6c9ad11e829a0244096efde759bc459e0c6ae5e737b1f98067689d25669da57')

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
  for doc in AUTHORS ChangeLog KNOWN_BUGS NEWS README THANKS; do
    install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${doc}"
  done

  # Pixmaps
  for file in usr/share/pixmaps/"${pkgname}"*; do
    filename=`basename "${file}"`
    install -Dm644 "${file}" "${pkgdir}/usr/share/pixmaps/${filename}"
  done
}

# vim:set ts=2 sw=2 et:
