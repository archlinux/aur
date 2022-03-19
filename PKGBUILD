pkgname=hunspell-gl
pkgver=22.03
pkgrel=2
epoch=2
pkgdesc="Galician hunspell dictionaries. RAG/ILG normative"
arch=(any)
url="https://gitlab.com/proxecto-trasno/hunspell-gl"
license=('GPL3')
optdepends=('hunspell:  the spell checking libraries and apps')
makedepends=('scons' 'python-pyicu' 'qt6-webengine')
provides=($pkgname)
conflicts=($pkgname)
source=("${pkgname}.tar.bz2::https://gitlab.com/proxecto-trasno/hunspell-gl/-/archive/${pkgver}/hunspell-gl-${pkgver}.tar.bz2")
md5sums=('975956a5e790c15f42ada0a52847fb25')

prepare() {
  mkdir -p "$srcdir/$pkgname" && tar xfj "$pkgname.tar.bz2" -C "$pkgname" --strip-components 1
}

build() {
  cd "$srcdir/$pkgname"

  _exclude='(iso[0-9]+|volga)'
  _use=$(ls src | grep -v / | xargs echo | sed -E "s/$_exclude( |\$)//g" | sed 's/ /,/g')

  scons aff=$_use dic=$_use rep=$_use
}

package(){
    cd "$srcdir"
    install -dm755 "$pkgdir"/usr/share/hunspell
    install -m644 \
        "$pkgname"/build/gl.dic \
        "$pkgname"/build/gl.aff \
        "$pkgdir"/usr/share/hunspell
    pushd "$pkgdir"/usr/share/hunspell
    ln -sv /usr/share/hunspell/gl.dic gl_ES.dic
    ln -sv /usr/share/hunspell/gl.aff gl_ES.aff
    popd

    # myspell symlinks
    install -dm755 "$pkgdir"/usr/share/myspell/dicts
    pushd "$pkgdir"/usr/share/myspell/dicts
    for file in "$pkgdir"/usr/share/hunspell/*; do
        ln -sv /usr/share/hunspell/$(basename $file) .
    done
    popd

    # docs
    install -dm644 "$pkgdir"/usr/share/doc/$pkgname

    # webengine dictionaries
    install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
    /usr/lib/qt6/qwebengine_convert_dict \
        "$pkgdir"/usr/share/hunspell/gl.dic \
        "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/gl.bdic
    pushd "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/
    ln -sv "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/gl.bdic gl_ES.bdic
    ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/gl.bdic "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
    popd
}
