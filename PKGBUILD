# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="pbox"
pkgname="passwordbox"
pkgver=0.11
pkgrel=1
pkgdesc="A console-mode program that will keep all your passwords safe"
arch=('x86_64')
url="https://passwbox.sourceforge.net"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
makedepends=('freebasic')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}.zip")
source=("${_pkgsrc}.zip::https://downloads.sourceforge.net/sourceforge/passwbox/${_binname}${pkgver//./}-src.zip")
b2sums=('d019524b85897e01a03024cd2e11ef3b599d649e1f4629cf6ecf54fee2bb2f2214bab2d15ec1311e3d12cd32912290c04d899bd3a9c0cfba28b167e5723a4945')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.zip" -C "${srcdir}/${_pkgsrc}"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CFLAGS="$(echo "$CFLAGS" | sed 's/-Wp,[^ ]*//g')"
  export LDFLAGS="$(echo "$LDFLAGS" | sed 's/-Wl,//g')"
  fbc -Wc "${CFLAGS}" -Wl "${LDFLAGS}" "${_binname}".bas
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${_binname}"     "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "${_binname}.txt" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "changes.txt"     "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 "license.txt"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
