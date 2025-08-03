# Maintainer: Paulo Matias <matias@ufscar.br>

## links
# https://sourceforge.net/projects/incrtcl/
# https://core.tcl-lang.org/itcl/
# https://github.com/tcltk/itk

_pkgname="tk-itk"
pkgname="$_pkgname"
pkgver=4.2.3
pkgrel=1
pkgdesc="OOP extension for Tk"
url="https://github.com/tcltk/itk"
license=('TCL')
arch=('x86_64')

depends=('tcl' 'tk')
makedepends=('git')
checkdepends=(
  'xorg-server-xvfb'
  'noto-fonts'
)

options=('!emptydirs')

_pkgsrc="itk-itk-${pkgver//./-}"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/itk-${pkgver//./-}.$_pkgext"
  "git+https://github.com/tcltk/tclconfig.git"
)
sha256sums=(
  'bc5ed347212fce403e04d3161cd429319af98da47effd3e32e20d2f04293b036'
  'SKIP'
)

prepare() {
  cp -r tclconfig "$_pkgsrc/"
}

build() {
  cd "$_pkgsrc"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-64bit \
    --with-itcl=/$(pacman -Ql tcl | grep -Pom1 'usr/lib/itcl[\d.]+')
  make
}

check() {
  local _headless_run=(
    xvfb-run
    -s "-screen 0 1920x1080x24 -nolisten local"
  )

  cd "$_pkgsrc"
  env "${_headless_run[@]}" -- make test
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir}" install
  install -Dm644 license.terms "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # unwanted
  find "$pkgdir/usr/lib" -name '*.a' -delete
}
