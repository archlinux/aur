pkgname=hunspell-gl
pkgver=20.08
pkgrel=1
epoch=2
pkgdesc="Galician hunspell dictionaries. RAG/ILG normative"
arch=(any)
url="https://gitlab.com/proxecto-trasno/hunspell-gl"
license=('GPL3')
optdepends=('hunspell:  the spell checking libraries and apps')
makedepends=('scons' 'python-pyicu')
provides=($pkgname)
conflicts=($pkgname)
source=("${pkgname}.tar.bz2::https://gitlab.com/proxecto-trasno/hunspell-gl/-/archive/${pkgver}/hunspell-gl-${pkgver}.tar.bz2")
md5sums=('9355f8752e2ae5a3ce7b8dd574f2dced')

prepare() {
  mkdir -p "$srcdir/$pkgname" && tar xfz "$pkgname.tar.bz2" -C "$pkgname" --strip-components 1
}

build() {
  cd "$srcdir/$pkgname"
  scons aff=norma,trasno,unidades dic=comunidade,rag,iso639,iso4217,norma,trasno,unidades,uvigo,wikipedia,wiktionary rep=comunidade,rag,wikipedia code=gl_ES
}

package(){
    cd "$srcdir"
    install -dm755 ${pkgdir}/usr/share/hunspell
    install -m644 ${pkgname}/build/gl_ES.dic ${pkgname}/build/gl_ES.aff $pkgdir/usr/share/hunspell

    # myspell symlinks
    install -dm755 ${pkgdir}/usr/share/myspell/dicts
    pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
        ln -sv /usr/share/hunspell/$(basename $file) .
    done
    popd

    # docs
    install -dm755 $pkgdir/usr/share/doc/$pkgname
}

