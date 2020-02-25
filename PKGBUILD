# Maintainer: Robert Hartung <hartung@ibr.cs.tu-bs.de>
# Contributor: Tim Schubert <tim.schubert@tu-bs.de>
pkgname=texlive-tubs
pkgver=1.2.0
_revnr=${pkgver}
pkgrel=1
pkgdesc="LaTeX-Templates for the Corporate Design of TU Braunschweig"
arch=('any')
url="https://www.tu-braunschweig.de/latex"
license=('LPPL')
depends=('urw-arial' 'texlive-core' 'texlive-bibtexextra' 'texlive-fontsextra' 'texlive-formatsextra' 'texlive-latexextra' 'texlive-science')
provides=('texlive-tubslatex')
conflicts=('texlive-tubslatex')
source=("https://gitlab.ibr.cs.tu-bs.de/tubslatex/tubslatex/-/jobs/116760/artifacts/raw/builds/tubslatex.tds.zip" "$pkgname.maps" "CONTENTS")
md5sums=(
  '5b89ac9c6118ee916d08eccf2bddb6b0'
  '9308c3138886469377a8d975a43cde39'
  '0c3f2dd8a9de10032ebf04caa355c1a8')
sha512sums=(
  'b64f04f366276669bc8c677e413e7f1eb35c7e7bb96cf30c3bcc544847c69a2dfc930a50de71e3c0775d22e2ce9ac5afafaa1e047cbc0ad710b1a2b0c7be738b'
  'ef2db742d543ccde08d40386b4625b8bfdfda50354f18d7e256ad732901cbd4046c776bcf2d79b5ec0950cd51310a9e4709586473fbdb3925240faec92e15b1f'
  'c82b6a1afe0b36286b5c824acf29197d3a7ef5cbbdd00ed251af81aae1f5ea20f7964c8d3b213f3a2169d946f3fa0bf84f6115a8464ff91c13e959873bcd3ed4')

package() {
  cd "$srcdir"
  install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs
  sed -i '/^#/d' CONTENTS
  install -m644 CONTENTS $pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${_revnr}.pkgs
  install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs/
  install -m755 -d $pkgdir/usr/share
  wanteddirs=$(for d in *; do test -d $d && [[ $d != doc ]] && echo $d; done) || true
  for dir in $wanteddirs; do
    find $dir -type d -exec install -d -m755 $pkgdir/usr/share/texmf-dist/'{}' \;
    find $dir -type f -exec install -m644 '{}' $pkgdir/usr/share/texmf-dist/'{}' \;
  done
  if [[ -d texmf-dist ]]; then
    find texmf-dist -type d -exec install -d -m755 $pkgdir/usr/share/'{}' \;
    find texmf-dist -type f -exec install -m644 '{}' $pkgdir/usr/share/'{}' \;
  fi
  if [[ -d $pkgdir/usr/share/texmf-dist/scripts ]]; then
    find $pkgdir/usr/share/texmf-dist/scripts -type f -exec chmod a+x '{}' \;
  fi
}
