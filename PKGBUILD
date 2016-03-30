# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: rtfreedman  <rob dot til dot freedman at gmail dot com>
# Contributor: Limao Luo <luolimao+AUR at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=rtaudio
pkgver=4.1.2
pkgrel=1
pkgdesc="A set of C++ classes that provide a common API for realtime audio input/output."
arch=('i686' 'x86_64')
url="http://www.music.mcgill.ca/~gary/rtaudio/"
license=('MIT')
depends=('jack' 'rtmidi')
source=("${url}release/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1e7f7f0f4dc451d023a7c8ab287fe63034cf6b4e18fe138bab253c307d6dd0cddb669b031f6c21325aaac0ce53002acd2a17dd1e47bd8ac2cb14e058cfce1a21')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-alsa --with-jack
  sed -i 's/Requires: /Requires: jack /' rtaudio.pc
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  # Install library files.
#  install -Dm755 librtaudio.so.${pkgver} "${pkgdir}/usr/lib/librtaudio.so.${pkgver}"
#  ln -sf librtaudio.so.${pkgver} "${pkgdir}/usr/lib/librtaudio.so.4"
#  ln -sf librtaudio.so.${pkgver} "${pkgdir}/usr/lib/librtaudio.so"

  # Install header file.
#  install -Dm644 RtAudio.h "${pkgdir}/usr/include/RtAudio.h"

  # Install RtAudio configuration tool.
#  install -Dm644 librtaudio.pc "${pkgdir}/usr/lib/pkgconfig/librtaudio.pc"
  install -Dm755 rtaudio-config "${pkgdir}/usr/bin/rtaudio-config"

  # Install test utilities with prefix 'rtaudio-'
  for _bin in `find tests/.libs -maxdepth 1 -type f -perm 755 ! -name "*.*"`; do
    install -Dm755 $_bin "${pkgdir}/usr/bin/${pkgname}-"`basename $_bin`
  done

  # Text documentation.
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 readme doc/release.txt "${pkgdir}/usr/share/doc/${pkgname}"

  # HTML documentation.
  install -d "${pkgdir}/usr/share/doc/${pkgname}/"{html,images}
  install -Dm644 doc/html/*  "${pkgdir}/usr/share/doc/${pkgname}/html"
  install -Dm644 doc/images/*  "${pkgdir}/usr/share/doc/${pkgname}/images"

  # License.
  csplit -s readme "%LEGAL AND%"
  install -Dm644 xx00 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install python2 bindings - Currently fails to build.
  #cd contrib/python/pyrtaudio
  #python2 setup.py install --root="${pkgdir}/"
  #install -Dm644 PyRtAudioTest.py "${pkgdir}/usr/share/doc/${pkgname}/"
}
