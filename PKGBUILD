# Maintainer: linuxer <linuxer@artixlinux.org>
# Maintainer: Josef Miegl <josef@miegl.cz>
# Maintainer: David Cooper (dtcooper) <david@dtcooper.com>
# Contributor: goll <adrian.goll+aur[at]gmail>
# Contributor: Kosava <kosava@gmail.com>

pkgname=butt
pkgver=1.46.0
pkgrel=1
pkgdesc="Easy to use, multi OS streaming tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL2')
url="https://danielnoethen.de/butt/"
depends=('fltk' 'dbus' 'portaudio' 'portmidi' 'libfdk-aac' 'libvorbis' 'libogg' 'lame' 'flac' 'opus' 'libsamplerate' 'libdatachannel')
source=("${pkgname}-${pkgver}.tar.gz::https://danielnoethen.de/${pkgname}/release/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'add-required-headers.patch')
sha256sums=('dd1202d87e47327fdee419785c23f1c69bfe1444fd46057b331b5c3aeb1c5f3b'
            'e6e5537a750794e43284254497887dd473956499124011d5a21bd6c5ad7fdcba')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../add-required-headers.patch
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
