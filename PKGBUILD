# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: rtfreedman  <rob dot til dot freedman at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org> 

pkgname=rtmidi
pkgver=2.1.1
pkgrel=1
pkgdesc="A set of C++ classes that provides a common API for realtime MIDI input/output."
arch=('i686' 'x86_64')
url="http://www.music.mcgill.ca/~gary/rtmidi/"
license=('MIT')
depends=('alsa-lib' 'jack')
source=("${url}release/${pkgname}-${pkgver}.tar.gz")
sha512sums=('964825a73ca24cbda5b6546cf89e9e28f8d0c3528ad1e4996e525892a09b94c5df039044b9c47b58177e80441fd1b4feb81b71b4e88d58ef2bf98d186e4db880')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-alsa --with-jack
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install test utilities with prefix 'rtmidi-'
  for _bin in `find tests -maxdepth 1 -type f -perm 755 ! -name "*.*"`; do
    install -Dm755 $_bin "${pkgdir}/usr/bin/${pkgname}-"`basename $_bin`
  done

  # Text documentation.
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 readme doc/release.txt  "${pkgdir}/usr/share/doc/${pkgname}"

  # HTML documentation.
  install -d "${pkgdir}/usr/share/doc/${pkgname}/"{html,images}
  install -Dm644 doc/html/*  "${pkgdir}/usr/share/doc/${pkgname}/html"
  install -Dm644 doc/images/*  "${pkgdir}/usr/share/doc/${pkgname}/images"

  # License.
  csplit -s readme "%LEGAL AND%"
  install -Dm644 xx00 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
