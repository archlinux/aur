# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Dan Elkouby <streetwalrus@codewalr.us>
# Contributor: Braden Pellett (daBrado) <aurcontact@dabrado.net>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Kristoffer Fossgård <kfs1@online.no>

_pkgname=terminus-font
pkgname=${_pkgname}-td1-ttf
pkgver=4.47
pkgrel=1
pkgdesc="Fixed-width bitmap font (td1 patch) (TTF version)"
arch=("any")
url="https://files.ax86.net/terminus-ttf"
license=("GPL2" "custom:OFL")
depends=("xorg-fonts-encodings" "xorg-font-utils" "fontconfig")
makedepends=("python" "fontforge" "potrace" "mkbold-mkitalic" "git")
conflicts=("terminus-font-ttf")
provides=("terminus-font-ttf")
source=("https://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "git+https://github.com/Tblue/mkttf")
sha256sums=('0f1b205888e4e26a94878f746b8566a65c3e3742b33cf9a4e6517646d5651297'
            'SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch < alt/td1.diff

  sed -i -e "s/-A ' -a -1' -V \"\${FONTVER}\" -O/-A ' -a -1' -V \"\${FONTVER}\"/" \
    "${srcdir}/mkttf/mkttf.sh"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --x11dir=/usr/share/fonts/misc --psfdir=/usr/share/kbd/consolefonts
  make

  cd "${srcdir}/mkttf"
  # MALLOC_CHECK_ is a temporary workaround to avoid crashing in fontforge code
  # It will print errors but they are harmless
  MALLOC_CHECK_=1 ./mkttf.sh "${srcdir}/${_pkgname}-${pkgver}" "${pkgver}" "TerminusTTF" "Terminus (TTF)"
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
