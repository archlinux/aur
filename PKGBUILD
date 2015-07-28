# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: max_meyer <dev@fedux.org>

pkgname=svg2tikz-git
pkgver=r203.d138c81
pkgrel=1
pkgdesc="set of tools for converting SVG graphics to TikZ/PGF code"
arch=('any')
url="https://github.com/kjellmf/svg2tikz"
license=('GPL')
depends=('python2-lxml')
makedepends=('git')
provides=('inkscape-tikz')
conflicts=('inkscape-tikz')
replaces=('inkscape-tikz-hg')
optdepends=('inkscape: for using the inksape extension files')
source=("git+https://github.com/kjellmf/svg2tikz")
md5sums=('SKIP')
_gitname="svg2tikz"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/"$_gitname"
  [[ -d build ]] || rm -rf build
  cd $_gitname
  for _i in inkexlib/inkex.py \
		inkexlib/simplepath.py \
   		inkexlib/simplestyle.py \
   		extensions/tikz_export.py \
		extensions/tikz_export.py
  do
    sed -i '1s+python$+python2+' ${_i}
  done
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  _inkscape_ext="$pkgdir/usr/share/inkscape/extensions"
  install -d "$_inkscape_ext"
  cp ./svg2tikz/extensions/tikz_export* "$_inkscape_ext"
}
