pkgname=hunspell-gl
pkgver=18.07
pkgrel=2
epoch=2
pkgdesc="Galician hunspell dictionaries. RAG/ILG normative"
arch=(any)
url="https://github.com/meixome/hunspell-gl"
license=('GPL3')
optdepends=('hunspell:  the spell checking libraries and apps')
makedepends=('scons' 'python-pyicu')
provides=($pkgname)
conflicts=($pkgname)
source=("${pkgname}.tar.gz::https://github.com/meixome/hunspell-gl/archive/${pkgver}.tar.gz")
md5sums=('f997f11bcfc0eefd923af03d71c107ad')

prepare() {
  mkdir -p "$srcdir/$pkgname" && tar xfz "$pkgname.tar.gz" -C "$pkgname" --strip-components 1
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

