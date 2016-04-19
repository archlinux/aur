# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
# Contributor: Braden Pellett (daBrado) <aurcontact@dabrado.net>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Kristoffer Fossgård <kfs1@online.no>

_pkgname=terminus-font
pkgname=${_pkgname}-ll2-td1-ttf
pkgver=4.40
pkgrel=1
pkgdesc="A superb, monospace bitmap font (for X11 and console) with ll2 patch (pass the il1I test) and td1 patch (centered ascii tilde) (TTF version)"
arch=("any")
url="http://files.ax86.net/terminus-ttf"
license=("GPL2" "custom:OFL")
depends=("xorg-fonts-encodings" "xorg-font-utils" "fontconfig")
makedepends=("python" "fontforge" "potrace" "mkbold-mkitalic" "git")
conflicts=("terminus-font-ttf")
provides=("terminus-font-ttf")
install="terminus-font.install"
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "git+https://github.com/Tblue/mkttf")
md5sums=("1e1df0d2c612c374ebe7966f90f04e0c"
         "SKIP")

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch < alt/ll2.diff
  patch < alt/td1.diff

  sed -i -e "s/-A ' -a -1' -V \"\${FONTVER}\" -O/-A ' -a -1' -V \"\${FONTVER}\"/" \
    "${srcdir}/mkttf/mkttf.sh"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --x11dir=/usr/share/fonts/misc --psfdir=/usr/share/kbd/consolefonts
  make

  cd "${srcdir}/mkttf"
  ./mkttf.sh "${srcdir}/${_pkgname}-${pkgver}" "${pkgver}"
}

package() {
  cd "${srcdir}/mkttf"

  for i in {Normal,Bold,Italic}/*.ttf; do
    local destname="$(basename "$i" | sed -E 's/-[[:digit:].]+\.ttf$/.ttf/')"
    install -Dm 644 "$i" "${pkgdir}/usr/share/fonts/TTF/${destname}"
  done

  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 OFL.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
