# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>

pkgname=emacspeak
pkgver=55.0
pkgrel=1
pkgdesc="Emacs extension that provides spoken output"
arch=('x86_64' 'aarch64')
url="http://emacspeak.sf.net/"
license=('GPL' 'LGPL' 'APACHE')
depends=('emacs' 'tcl' 'tclx' 'espeak-ng')
optdepends=('python: for Stream The World'
            'perl')
source=("https://github.com/tvraman/emacspeak/releases/download/${pkgver}/emacspeak-${pkgver}.tar.bz2"
        "${pkgname}-54.0-directorys.patch"
        "${pkgname}-54.0-flags.patch"
        "${pkgname}.sh")
sha512sums=('2b9424b9d85da8d18803d45403a6e26262e2ed6a51e8868aed2c906c9bd50b9aad797cab8575dba229c3d8f953979d4cf3ed5a0ee16ea8da3e0593e7b040a84f'
            '870aeac1b91e76ac141983bedd6ed328475a8bcd268d5ec5f48a04b5c285ff29ac6d00681a00350212aa07bba54127a0aa91524d2197e785f12dea059e93ca52'
            'b287dbe2cc07c29c6d14b79d2984106d5dfc6bebc7636ed0bb937a9c02db926c6ed1cb0b1aa3026ca6b7700514ae5f94c2c39907b42e0594eff82c4ad20ac02f'
            '3624a1205e70cceb43953d39925e1c9a351635a909100a050b036640df65cc104546939eb3be017b116dbc4f910a018b6a5e2eb39c66c9e01e9c91dde6fdf5d9')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}-54.0-directorys.patch"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}-54.0-flags.patch"
  # prebuilt binary
  rm -v etc/pickup-c/pickup
}

build() {
  cd "$pkgname-$pkgver"
  export DTK_PROGRAM="espeak"
  make config
  make
  make -C etc/pickup-c
  # Espeak isn't compiled by default, but lots of folks use it.
  make espeak
}

package() {
  cd "$pkgname-$pkgver"
  # clean unneeded files
  find . -name Makefile -delete
  rm -vr info/auto
  rm -vr sounds/3d/src

  install -vDm 644 etc/forms/* -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}/etc/forms"
  install -vDm 644 etc/pickup-c/pickup -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}/etc/pickup-c"
  install -vDm 644 etc/tables/* -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}/etc/tables"
  rm -vr etc/forms/
  rm -vr etc/pickup-c/
  rm -vr etc/tables/
  install -vDm 644 etc/* -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}/etc"
  install -vDm 644 info/* -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}/info"
  install -vDm 644 lisp/* -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}/lisp"
  install -vDm 644 xsl/* -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}/xsl"
  install -vDm 644 README -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}"

  install -vDm 644 sounds/3d/* -t "${pkgdir}/usr/share/sounds/${pkgname}/3d"
  install -vDm 644 sounds/classic/* -t "${pkgdir}/usr/share/sounds/${pkgname}/classic"
  install -vDm 644 sounds/pan-chimes/* -t "${pkgdir}/usr/share/sounds/${pkgname}/pan-chimes"
  install -vDm 644 sounds/prompts/* -t "${pkgdir}/usr/share/sounds/${pkgname}/prompts"
  install -vDm 644 sounds/system/* -t "${pkgdir}/usr/share/sounds/${pkgname}/system"
  install -vDm 644 sounds/{emacspeak.mp3,highbells.au} -t "${pkgdir}/usr/share/sounds/${pkgname}"

  # speech server
  install -vDm 755 servers/tts-lib.tcl -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}/servers"
  install -vDm 755 servers/{espeak,log-espeak} -t "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}/servers"
  install -vDm 755 servers/native-espeak/tclespeak.so -t "${pkgdir}/usr/lib/${pkgname}"
  # Add convenient wrapper to keep your configs unmodified
  install -vDm 755 "${srcdir}/emacspeak.sh" "${pkgdir}/usr/bin/${pkgname}"
}
