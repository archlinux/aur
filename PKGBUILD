# Maintainer: Petko Bordjukov <bordjukov@gmail.com>

_pkgname=mythes-bg
pkgname="$_pkgname"-git
pkgver=r2331.93db4f5
pkgrel=1
pkgdesc="Bulgarian thesaurus"
arch=(any)
url="https://docs.libreoffice.org/lingucomponent.html"
license=('GPL2')
optdepends=('libmythes: offers thesaurus library functions')
makedepends=('perl')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(dictionaries::git+https://github.com/LibreOffice/dictionaries.git
        mythes::git+https://github.com/hunspell/mythes.git)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir"/dictionaries
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/dictionaries/bg_BG
    cat th_bg_BG_v2.dat | "$srcdir"/mythes/th_gen_idx.pl > th_bg_BG_v2.idx
}

package() {
    cd "$srcdir"

    # dictionary
    install -dm755 "${pkgdir}"/usr/share/mythes
    cp -p dictionaries/bg_BG/th_bg_BG_v2.dat "${pkgdir}"/usr/share/mythes/
    cp -p dictionaries/bg_BG/th_bg_BG_v2.idx "${pkgdir}"/usr/share/mythes/

    # symlink
    install -dm755 "${pkgdir}"/usr/share/myspell/dicts
    ln -s /usr/share/mythes/th_bg_BG_v2.dat "${pkgdir}"/usr/share/myspell/dicts/
    ln -s /usr/share/mythes/th_bg_BG_v2.idx "${pkgdir}"/usr/share/myspell/dicts/

    # license
    install -D -m644 "${srcdir}"/dictionaries/bg_BG/COPYING "${pkgdir}"/usr/share/licenses/"$pkgname"/LICENSE

    # docs
    install -dm755 "$pkgdir"/usr/share/doc/"$pkgname"
    cp -p dictionaries/bg_BG/README_th_bg_BG_v2.txt "$pkgdir"/usr/share/doc/"$pkgname"
}
