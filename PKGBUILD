# Maintainer: Tim Schubert <aur-at-timschubert-dot-net>
pkgname=texlive-stratum0-beamer
pkgver=1.0
_revnr=${pkgver}
pkgrel=1
pkgdesc="LaTeX beamer classes for Stratum 0 corporate design"
arch=('any')
url="https://github.com/stratum0/stratum0-latex"
license=('LPPL' 'custom:OFL')
depends=('texlive-core' 'texlive-bin' 'texlive-fontsextra' 'texlive-latexextra')
provides=('texlive-stratum0-beamer')
conflicts=('texlive-stratum0-beamer')
source=("https://github.com/stratum0/stratum0-latex/releases/download/v${pkgver}-beta4/stratum0beamer-v1.0-beta4.zip" "$pkgname.maps" 'CONTENTS' 'LICENSE')
sha512sums=(
'563de3c7611dc62a2003132460a88b660f0a981747fb84fa6d9b29394e7205bf7bcd5ec9fcb36184eb544cb2224e94d38adc2af47a5ed63b1860bc1c0edf1243'
'903a3505b6994bb67ea2d419b5a46bc6f62de1f89c6bdf28d77dadfc46f128f11911aeeaf7d2086557ec284a5c61cad3c7b34e6e81a56911e55b0733949da516'
'6f6a960ade6e616f9150830eb1d2e45cdc00539bf85b8282c62cbd6b1603ae8729b04d8ab3bc7a7118380b9a28edfaabb46fc5e625a32d52c49b0e99d132b551'
'fafa264e25460771db0b01d6f900a51401a6a76caaaeb46c109f2ec938afa24fa3d0d8f063f85d751965477081f96796c5ef94c5b4e2972d12c7c09342242509')

package() {
  cd "$srcdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs
  sed -i '/^#/d' CONTENTS
  install -m644 CONTENTS $pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${_revnr}.pkgs
  install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs/
  install -m755 -d $pkgdir/usr/share
  wanteddirs=$(for d in *; do test -d $d && echo $d; done) || true
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
