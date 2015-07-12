# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: rtfreedman  (rob dot til dot freedman at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org> 
pkgname=rtmidi
pkgver=2.1.0
pkgrel=2
pkgdesc="A set of C++ classes that provides a common API for realtime MIDI input/output."
arch=('any')
url="http://www.music.mcgill.ca/~gary/rtmidi/"
license=('MIT')
depends=('alsa-lib' 'jack2-dbus')
source=("${url}release/${pkgname}-${pkgver}.tar.gz")
sha512sums=('3bb58a7bcdbd0a6c716060d57eb856f4557a460fd24a533e956ee93523aafe058a4b3cf3133fe1f21d517b1bc7519822f3466a88e3b2c3042a8b09d171143877')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-alsa --with-jack
  make
  cd tests && make
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install library files.
  install -Dm755 librtmidi.so.${pkgver} "${pkgdir}"/usr/lib/librtmidi.so.${pkgver}
  ln -s librtmidi.so.${pkgver} "${pkgdir}"/usr/lib/librtmidi.so.2
  ln -s librtmidi.so.${pkgver} "${pkgdir}"/usr/lib/librtmidi.so

  # Install header file.
  install -Dm644 RtMidi.h "${pkgdir}"/usr/include/RtMidi.h

  # Install RtMIDI configuration utility.
  install -Dm644 librtmidi.pc  "${pkgdir}"/usr/lib/pkgconfig/librtmidi.pc
  install -Dm755 rtmidi-config "${pkgdir}"/usr/bin/rtmidi-config

  # Install test utilities with prefix 'rtmidi-'
  for _bin in `find tests -type f -perm 755`; do
    install -Dm755 $_bin "${pkgdir}/usr/bin/rtmidi-"`basename $_bin`
  done

  # Text documentation.
  install -d "${pkgdir}"/usr/share/doc/rtmidi
  install -Dm644 readme doc/release.txt  "${pkgdir}"/usr/share/doc/rtmidi

  # HTML documentation.
  install -d "${pkgdir}"/usr/share/doc/rtmidi/{html,images}
  install -Dm644 doc/html/*  "${pkgdir}"/usr/share/doc/rtmidi/html
  install -Dm644 doc/images/*  "${pkgdir}"/usr/share/doc/rtmidi/images

  # License
  csplit -s readme "%LEGAL AND%"
  install -Dm644 xx00 "${pkgdir}"/usr/share/licenses/rtmidi/LICENSE
}
