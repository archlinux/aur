# Contributor: rtfreedman  (rob dot til dot freedman at gmail dot com>
# Contributor: Limao Luo <luolimao+AUR at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
pkgname=rtaudio
pkgver=4.1.1
pkgrel=6
pkgdesc="A set of C++ classes that provide a common API for realtime audio input/output."
arch=('any')
url="http://www.music.mcgill.ca/~gary/rtaudio/"
license=('MIT')
depends=('jack2-dbus' 'rtmidi')
source=("${url}release/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b47f909d7b5485fa670005642ff2846122b15229f72e600318eca187c93d18b34ba38f5f8ba367799e3d47f3b0c9cb84f28d1315e6607ab779b0799e364b454b')

prepare() {
  cd "${pkgname}-${pkgver}"
  aclocal
  autoconf
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-alsa --with-jack
  # Add jack or comment line without jack
  sed -i 's/Requires: /Requires: jack /' librtaudio.pc
  make
  make -C tests
}

package() {
  cd "${pkgname}-${pkgver}"
  
  # Install library files.
  install -Dm755 librtaudio.so.${pkgver} "${pkgdir}"/usr/lib/librtaudio.so.${pkgver}
  ln -sf librtaudio.so."${pkgver}" "${pkgdir}"/usr/lib/librtaudio.so.4
  ln -sf librtaudio.so."${pkgver}" "${pkgdir}"/usr/lib/librtaudio.so

  # Install header file.
  install -Dm644 RtAudio.h "${pkgdir}"/usr/include/RtAudio.h

  # Install RtAudio configuration tool.
  install -Dm644 librtaudio.pc "${pkgdir}"/usr/lib/pkgconfig/librtaudio.pc
  install -Dm755 rtaudio-config "${pkgdir}"/usr/bin/rtaudio-config

  # Install test utilities with prefix 'rtaudio-'
  for i in $(find tests -maxdepth 1 -perm 755 -type f); do
      install -Dm755 $i "${pkgdir}"/usr/bin/rtaudio-${i/*\//}
  done

  # Text documentation.
  install -dm755 "${pkgdir}"/usr/share/doc/rtaudio
  install -m644 readme doc/release.txt "${pkgdir}"/usr/share/doc/rtaudio

  # HTML documentation.
  install -d "${pkgdir}"/usr/share/doc/rtaudio/{html,images}
  install -Dm644 doc/html/*  "${pkgdir}"/usr/share/doc/rtaudio/html
  install -Dm644 doc/images/*  "${pkgdir}"/usr/share/doc/rtaudio/images

  # License
  csplit -s readme "%LEGAL AND%"
  install -Dm644 xx00 "${pkgdir}"/usr/share/licenses/rtaudio/LICENSE

  # Install python2 bindings - Currently fails to build.
  #cd contrib/python/pyrtaudio/
  #python2 setup.py install --root="${pkgdir}"
  #install -Dm644 PyRtAudioTest.py "${pkgdir}"/usr/share/doc/${pkgname}/
}
