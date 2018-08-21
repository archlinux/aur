# Maintainer: Tim Schubert <tim.schubert@tu-bs.de>
pkgname=texlive-tubs
pkgver=1.1.0
_revnr=${pkgver}
pkgrel=1
pkgdesc="LaTeX-Templates for the Corporate Design of TU Braunschweig"
arch=('any')
url="http://tubslatex.ejoerns.de/"
license=('LPPL')
depends=('urw-arial' 'texlive-core' 'texlive-bibtexextra' 'texlive-fontsextra' 'texlive-formatsextra' 'texlive-latexextra' 'texlive-science')
provides=('texlive-tubslatex')
conflicts=('texlive-tubslatex')
source=("http://tubslatex.ejoerns.de/$pkgver/tubslatex_$pkgver.tds.zip" "$pkgname.maps" "CONTENTS")
md5sums=(
  '3768f97ff43dc5cdf5faa52d42b18dd5'
  '9308c3138886469377a8d975a43cde39'
  '8a5b8f3b01c2a08af1350c34da1638bf')
sha512sums=(
  'bad54c632d0413a98b163fd393d280f68196733d6c34c4d6fed59919075112c96813f56d389ef06fd3f5163328e06b692a0e9df400f27881b42581d9d7ff6f78'
  'ef2db742d543ccde08d40386b4625b8bfdfda50354f18d7e256ad732901cbd4046c776bcf2d79b5ec0950cd51310a9e4709586473fbdb3925240faec92e15b1f'
  '7d3fdbfe1c80d7da2f73a7bdcf3c347b8114778f7d358b82ef75d9472341df3449b389fb79f9b915eb24273715422b2ab1c9bee29f349fa3c401f8014eaee34c')

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
