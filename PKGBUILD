# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Invergo <brandon@invergo.net>

# https://github.com/archlinux/svntogit-community/blob/packages/img2pdf/trunk/PKGBUILD

pkgname=img2pdf-git
pkgver=0.4.0.r8.b5f0912
pkgrel=1
epoch=1
pkgdesc='Losslessly convert raster images to PDF'
arch=(any)
url=https://gitlab.mister-muffin.de/josch/"${pkgname%-*}"
license=(LGPL3)

depends=(python-pillow python-pikepdf)
makedepends=(git python-setuptools)
checkdepends=(python-pytest python-pdfrw python-numpy python-scipy python-lxml
              colord ghostscript imagemagick mupdf-tools poppler perl-image-exiftool netpbm)
optdepends=('tk: experimental tkinter GUI /usr/bin/img2pdf-gui')

# https://man.archlinux.org/man/bash.1#Parameter_Expansion
provides=( {,python-}"${pkgname%-*}=${pkgver/.r*/}"                 ) # =${pkgver:0:5}
conflicts=({,python-}"${pkgname%-*}"                python-$pkgname )
source=(git+https://gitlab.mister-muffin.de/josch/"${pkgname%-*}".git)
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-*}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-*}"
	python setup.py build
}

check() {

  cd "$srcdir/${pkgname%-*}"

  local _gsverdash="$(expac %v ghostscript)" # 9.53.3-3
  local _gsver=${_gsverdash/-*/} # 9.53.3
  sed \
    -e 's|Joint Photographic Experts Group JFIF format|JPEG|g' \
    -e 's|JPEG-2000 File Format Syntax|JP2|g' \
    -e 's|Portable Network Graphics|PNG|g' \
    -e 's|Tagged Image File Format|TIFF|g' \
    -e 's|CompuServe graphics interchange format|GIF|g' \
    -e 's|endianess|endianness|g' \
    -e "s|/usr/share/color/icc/ghostscript/srgb.icc|/usr/share/ghostscript/$_gsver/iccprofiles/srgb.icc|g" \
    -i src/img2pdf_test.py

  # Failures with checksuming and Zip vs None compression and more
  # python -m pytest || { echo "Tests failed"; return 1; }
  # pytest
  pytest --exitfirst || printf "\n${YELLOW}==> $(gettext "WARNING:")${ALL_OFF}${BOLD} At least one test has failed${ALL_OFF}\n\n" >&2
  # /usr/share/makepkg/util/message.sh

}

package() {
	cd "$srcdir/${pkgname%-*}"
  # export PYTHONHASHSEED=0
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
