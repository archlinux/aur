# Maintainer: Daniel Koch <dkoch84@gmail.com>
# Structure, PKGBUILD and fonts taken from texlive-fontsextra  maintained by Rémy Oudompheng <remy.archlinux.org>

pkgname=texlive-fonts-fontawesome
pkgver=2021.61408
_revnr=${pkgver#2021.}
pkgrel=1
pkgdesc="TeX Live - Font Awesome fonts"
license=('GPL')
arch=(any)
depends=('texlive-core')
conflicts=('texlive-fontsextra')
url='http://tug.org/texlive/'
source=(https://github.com/dkoch84/texlive-fonts-fontawesome/raw/master/"$pkgname-$pkgver-src.zip"
https://github.com/dkoch84/texlive-fonts-fontawesome/raw/master/"$pkgname.maps")
options=('!emptydirs')
sha256sums=('92495ad3a2457f3c8bbbf22d9eedeb5a15c03253fda69bc1f8198096c943419d'
'a1fe9dd7e64687c2e684a2fcb5e6f1309a09c74804940326004a6b82a0fa611c')

build() {
    mv "$srcdir"/$pkgname-$pkgver/* "$srcdir"/
    rm -rf "$srcdir"/$pkgname-$pkgver
    cd "$srcdir"
    for p in *.tar.xz; do
        bsdtar -xf $p
    done
    rm -rf {tlpkg,doc,source} || true
}

package() {
    cd "$srcdir"
    install -m755 -d "$pkgdir"/var/lib/texmf/arch/installedpkgs
    sed -i '/^#/d' CONTENTS
    install -m644 CONTENTS "$pkgdir"/var/lib/texmf/arch/installedpkgs/${pkgname}_${_revnr}.pkgs
    install -m644 $pkgname.maps "$pkgdir"/var/lib/texmf/arch/installedpkgs/
    install -m755 -d "$pkgdir"/usr/share
    wanteddirs=$(for d in *; do test -d $d && [[ $d != texmf* ]] && echo $d; done) || true
    for dir in $wanteddirs; do
        find $dir -type d -exec install -d -m755 "$pkgdir"/usr/share/texmf-dist/'{}' \;
        find $dir -type f -exec install -m644 '{}' "$pkgdir"/usr/share/texmf-dist/'{}' \;
    done
    if [[ -d texmf-dist ]]; then
        find texmf-dist -type d -exec install -d -m755 "$pkgdir"/usr/share/'{}' \;
        find texmf-dist -type f -exec install -m644 '{}' "$pkgdir"/usr/share/'{}' \;
    fi
    if [[ -d "$pkgdir"/usr/share/texmf-dist/scripts ]]; then
        find "$pkgdir"/usr/share/texmf-dist/scripts -type f -exec chmod a+x '{}' \;
    fi
}