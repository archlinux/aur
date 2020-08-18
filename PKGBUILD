pkgname=hunspell-gl
pkgver=20.08
pkgrel=1
epoch=2
pkgdesc="Galician hunspell dictionaries. RAG/ILG normative"
arch=(any)
url="https://gitlab.com/proxecto-trasno/hunspell-gl"
license=('GPL3')
optdepends=('hunspell:  the spell checking libraries and apps')
makedepends=('scons' 'python-pyicu' 'qt5-webengine')
provides=($pkgname)
conflicts=($pkgname)
source=("${pkgname}.tar.bz2::https://gitlab.com/proxecto-trasno/hunspell-gl/-/archive/${pkgver}/hunspell-gl-${pkgver}.tar.bz2")
md5sums=('3530407085f8fc49bd3bd5f5488be565')

prepare() {
  mkdir -p "$srcdir/$pkgname" && tar xfz "$pkgname.tar.bz2" -C "$pkgname" --strip-components 1
}

build() {
  cd "$srcdir/$pkgname"
  scons code=gl_ES
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
    install -dm644 $pkgdir/usr/share/doc/$pkgname

    # Install webengine dictionaries
    install -d "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
    for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
    _filename=$(basename $_file)
      qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
    done
}
