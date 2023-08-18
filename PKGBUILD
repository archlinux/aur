# Maintainer:  (dreieck https://aur.archlinux.org/account/dreieck)

_pkgname='mathtex'
pkgname="${_pkgname}"
pkgver=1.05
pkgrel=1
pkgdesc="Creates PNG or GIF images from LaTeX mathematical expressions."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://ctan.org/pkg/mathtex"
license=("GPL3")
depends=(
  'glibc'
  'imagemagick'
  'ghostscript'
  'texlive-bin'
)
source=(
  "${_pkgname}.${pkgver}.zip::http://mirrors.ctan.org/support/mathtex.zip"
)
sha256sums=(
  '9eaf9f2287892d8ba5a76a7fefcaa74ad109891a7215fc1812bcd473f6ec0733'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  grep -m1 Version README | sed -E 's|.*[[:space:]]+Version[[:space:]]+([^[:space:]]+)[[:space:]]*.*|\1|'
}

build() {
  cd "${srcdir}/${_pkgname}"

  _latex="`which latex`"
  _pdflatex="`which pdflatex`"
  _dvipng="`which dvipng`"
  _dvips="`which dvips`"
  _ps2epsi="`which ps2epsi`"
  _convert="`which convert`"

  # Compilation option see the `README`/ `mathtex.html`.

  gcc ${CFLAGS} ${LDFLAGS} \
    -DLATEX=\"${_latex}\" \
    -DPDFLATEX=\"${_pdflatex}\" \
    -DDVIPNG=\"${_dvipng}\" \
    -DDVIPS=\"${_dvips}\" \
    -DPS2EPSI=\"${_ps2epsi}\" \
    -DCONVERT=\"${_convert}\" \
    -DWORK=\"/tmp/\" \
    -DCACHE=\"./\" \
    -DPNG \
    -DDISPLAYSTYLE \
    -DFONTSIZE=5 \
    -DGAMMA=\"2.5\" \
    -DDPI=\"120\" \
    -DNQUIET=3 \
    -DKILLTIME=120 \
    -DMAXMSGLEVEL=999999 \
    -DADFREQUENCY=0 \
    -o mathtex mathtex.c
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm755 "mathtex" "${pkgdir}/usr/bin/mathtex"
  ln -svr "${pkgdir}/usr/bin/mathtex" "${pkgdir}/usr/bin/mathtex.cgi"

  for _docfile in README mathtex.html; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in COPYING; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
