# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Dan Elkouby <streetwalrus@codewalr.us>
# Contributor: Braden Pellett (daBrado) <aurcontact@dabrado.net>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Kristoffer Fossgård <kfs1@online.no>

_pkgname=terminus-font
pkgname=${_pkgname}-td1-ttf
pkgver=4.49.1
pkgrel=1
pkgdesc="Fixed-width bitmap font (td1 patch) (TTF version)"
arch=('any')
url="https://files.ax86.net/terminus-ttf"
license=('OFL-1.1')
conflicts=('terminus-font-ttf')
provides=('terminus-font-ttf')
makedepends=('git' 'python' 'fontforge' 'potrace' 'mkbold-mkitalic' 'xorg-bdftopcf')
source=("https://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-${pkgver%.*}/${_pkgname}-${pkgver}.tar.gz"
        "git+https://github.com/Tblue/mkttf")
sha256sums=('d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79'
            'SKIP')

prepare() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  patch < alt/td1.diff

  sed -i -e "s/-A ' -a -1' -V \"\${FONTVER}\" -O/-A ' -a -1' -V \"\${FONTVER}\"/" \
    "${srcdir}"/mkttf/mkttf.sh

  sed -i 's/magick convert/magick/g' "${srcdir}"/mkttf/potrace-wrapper.sh
}

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  ./configure --prefix=/usr --x11dir=/usr/share/fonts/misc --psfdir=/usr/share/kbd/consolefonts
  make

  cd "${srcdir}"/mkttf
  # MALLOC_CHECK_ is a temporary workaround to avoid crashing in fontforge code
  # It will print errors but they are harmless
  MALLOC_CHECK_=1 ./mkttf.sh "${srcdir}/${_pkgname}-${pkgver}" "${pkgver}" "TerminusTTF" "Terminus (TTF)"
}

package() {
  cd "${srcdir}"/mkttf

  for i in {Normal,Bold,Italic}/*.ttf; do
    local destname="$(basename "$i" | sed -E 's/-[[:digit:].]+\.ttf$/.ttf/')"
    install -Dm 644 "$i" "${pkgdir}/usr/share/fonts/TTF/${destname}"
  done

  cd "${srcdir}"/${_pkgname}-${pkgver}
  install -Dm644 OFL.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
