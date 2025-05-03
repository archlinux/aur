# Maintainer: linuxer <linuxer@artixlinux.org>
# Maintainer: Josef Miegl <josef@miegl.cz>
# Maintainer: David Cooper (dtcooper) <david@dtcooper.com>
# Contributor: goll <adrian.goll+aur[at]gmail>
# Contributor: Kosava <kosava@gmail.com>

pkgname=butt
pkgver=1.45.0
pkgrel=1
pkgdesc="Easy to use, multi OS streaming tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL2')
url="https://danielnoethen.de/butt/"
depends=('fltk' 'dbus' 'portaudio' 'portmidi' 'libfdk-aac' 'libvorbis' 'libogg' 'lame' 'flac' 'opus' 'libsamplerate' 'libdatachannel')
source=("${pkgname}-${pkgver}.tar.gz::https://danielnoethen.de/${pkgname}/release/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'add-required-time-header.patch')
sha256sums=('88498510946c4ef1de28662f9e1cd85d20bfab40d2c3467f6202b86ee0ed8364'
            'a4d8f0fbde457366467b5ae0d2b31ad0f733cb1154a18e84a36a106c7301b5d8')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../add-required-time-header.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  # Replacing _FORTIFY_SOURCE here fixes build warnings
  ./configure --with-client --enable-webrtc --prefix=/usr \
    CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}" \
    CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

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
  ln -s "/usr/share/doc/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Pixmaps
  for file in usr/share/pixmaps/"${pkgname}"*; do
    filename="$(basename "${file}")"
    install -Dm644 "${file}" "${pkgdir}/usr/share/pixmaps/${filename}"
  done
}
