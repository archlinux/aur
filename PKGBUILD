# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: rtfreedman  <rob dot til dot freedman at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org> 

pkgname=rtmidi
pkgver=3.0.0
pkgrel=1
pkgdesc="A set of C++ classes that provides a common API for realtime MIDI input/output."
arch=('i686' 'x86_64')
url="http://www.music.mcgill.ca/~gary/rtmidi/"
license=('MIT')
depends=('jack')
source=("${url}release/${pkgname}-${pkgver}.tar.gz"
        '0001-fix-tests-with-prefix.diff')
sha512sums=('b5cba769e4641ac453493e2e6ca6f947d7ef5fe71870dd10aa19c93ad18dd62ed01358c468c0e1e326dbc29bd00ecc32b9d8895276d9f46e9e0aa20ed6e0b70f'
            'b45156fd1fca578a0952f3819ffe5721b57e8e8237ba3b532bad0349e201bcfc75460d4d393b3233dacbc994be71186e72f2ae475ac97053ef51716e9f7ba99a')

prepare() {
  # Link the tests against build output and not the system library when using --prefix.
  # [https://github.com/thestk/rtmidi/pull/127]
  patch -Np1 -i 0001-fix-tests-with-prefix.diff
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-alsa --with-jack
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Text documentation.
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 README.md doc/release.txt  "${pkgdir}/usr/share/doc/${pkgname}"

  # HTML documentation.
  install -d "${pkgdir}/usr/share/doc/${pkgname}/"{html,images}
  install -Dm644 doc/html/*  "${pkgdir}/usr/share/doc/${pkgname}/html"
  install -Dm644 doc/images/*  "${pkgdir}/usr/share/doc/${pkgname}/images"

  # License.
  csplit -s README.md "%Legal and%"
  install -Dm644 xx00 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
