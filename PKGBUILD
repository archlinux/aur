# Maintainer: Evgeny Pokhilko <software@evpo.net>

_pkgname=encryptpad
pkgname=${_pkgname}-git
pkgver=0.3.2.2
pkgrel=2
pkgdesc="Minimalist secure text editor and binary encryptor that implements RFC 4880 Open PGP format"
arch=(i686 x86_64)
url="https://github.com/evpo/${_pkgname}"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme' 'zlib' 'botan-stable')
makedepends=('git' 'gendesk')
options=('!makeflags')
validpgpkeys=('634BFC0CCC426C74389D89310F1CFF71A2813E85')
source=("https://github.com/evpo/EncryptPad/releases/download/v${pkgver}/encryptpad$(echo -n $pkgver | sed -r 's/\./_/g')_src.tar.gz"{,.asc}
"encryptpad.patch")

sha1sums=('SKIP' 'SKIP' 'fc181153279e6c1167b506a50b4c685475f08bc3')

prepare() {
  cd "${srcdir}/encryptpad$(echo -n $pkgver | sed -r 's/\./_/g')_src"
  patch -Np1 -i ../encryptpad.patch
  gendesk --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --categories "Utility;TextEditor" --exec EncryptPad
}

build() {
  cd "$srcdir/encryptpad$(echo -n $pkgver | sed -r 's/\./_/g')_src"
  ./configure.sh --all --use-system-libs
}

package() {
  cd "$srcdir/encryptpad$(echo -n $pkgver | sed -r 's/\./_/g')_src"
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/release/encryptcli bin/release/EncryptPad ${pkgdir}/usr/bin/
  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 images/icns.iconset/icon_16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png
  install -Dm644 images/icns.iconset/icon_32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png
  install -Dm644 images/icns.iconset/icon_128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png
}

# vim:set ts=2 sts=2 sw=2 et:
