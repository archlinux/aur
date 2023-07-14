# Contributor: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=beamerscape-git
_pkgname=beamerscape
pkgver=r38.5d95cc1
pkgrel=2
pkgdesc="Tools for integrating Inkscape and LaTeX beamer"
arch=('any')
url="https://github.com/jbohren/beamerscape"
license=('BSD')
makedepends=('git')
depends=('texlive-latexrecommended' 'perl-xml-libxml' 'inkscape')
optdepends=('cmake>=2.8.3: to \% Layergenerate a large number of presentations')
provides=('beamerscape')
conflicts=('beamerscape')
source=($pkgname::git+http://github.com/jbohren/beamerscape.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  # as of 24/Sep/2015 a new escaping "%" is needed.
  sed -i 's#\\% Layer#%% Layer#g' bin/export_overlays
}

package() {
  cd $pkgname
  install -Dm755 bin/export_overlays "$pkgdir"/usr/bin/export_overlays
  install -Dm644 cmake/*.cmake -t "$pkgdir"/usr/share/apps/cmake/modules
  install -d "$pkgdir"/usr/share/doc/${_pkgname}
  cp -R examples "$pkgdir"/usr/share/doc/${_pkgname}/
  install -d "$pkgdir"/usr/share/licenses/${pkgname}/
  sed '14,38s+^#++' bin/export_overlays > "$pkgdir"/usr/share/licenses/${pkgname}/license.txt
  sed -i '1,13d' "$pkgdir"/usr/share/licenses/${pkgname}/license.txt
  sed -i '26,$d' "$pkgdir"/usr/share/licenses/${pkgname}/license.txt
}
