# Maintainer: gilcu3 <gilcu3 at gmail dot com>

pkgbase=hunspell-lb
pkgname=(hunspell-lb mythes-lb)
pkgver="2.1"
_date=2023-01-25
_gitcommit='4b75d78d12a67afe6111814da034acb83a732d95'
pkgrel=1
arch=('any')
makedepends=('hunspell' 'git' 'qt6-webengine')
url="https://spellchecker.lu"
giturl="https://github.com/spellchecker-lu/dictionary-lb-lu"
license=('EUPL')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$giturl/archive/$_gitcommit.tar.gz")
sha256sums=('be13a518987d35b68769cc398d1b17137e23e24ba7a1253e86e3b221f0b8cf29')

package_hunspell-lb(){
    pkgdesc="Luxembourguish hunspell dictionary"
    depends=(hunspell)
    provides=('hunspell-dictionary')
    optdepends=('hunspell: the spell checking libraries and apps')
    
    cd dictionary-lb-lu-${_gitcommit}

    install -d "${pkgdir}"/usr/share/hunspell

    install -D -m644 lb_LU.dic "${pkgdir}/usr/share/hunspell/lb_LU.dic"
    install -D -m644 lb_LU.aff "${pkgdir}/usr/share/hunspell/lb_LU.aff"


    # the symlinks
    install -d "${pkgdir}"/usr/share/myspell/dicts
    pushd "${pkgdir}"/usr/share/myspell/dicts
        for file in "${pkgdir}"/usr/share/hunspell/*; do
        ln -sv /usr/share/hunspell/$(basename $file) .
        done
    popd

    # Install webengine dictionaries   
    install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
    for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
    _filename=$(basename $_file)
        /usr/lib/qt6/qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
    ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic} "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
    done

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mythes-lb(){
    pkgdesc="Luxembourguish thesaurus"
    optdepends=('libmythes: offers thesaurus library functions')


    cd dictionary-lb-lu-${_gitcommit}


    install -dm755 "${pkgdir}"/usr/share/mythes
    install -dm755 "${pkgdir}"/usr/share/mythes

    install -m644 th_lb_LU_v2.dat "${pkgdir}/usr/share/mythes/th_lb-LU_v2.dat"
    install -m644 th_lb_LU_v2.idx "${pkgdir}/usr/share/mythes/th_lb-LU_v2.idx"

    # the symlinks
    install -dm755 "${pkgdir}"/usr/share/myspell/dicts
    pushd "${pkgdir}"/usr/share/myspell/dicts
        for file in "${pkgdir}"/usr/share/mythes/*; do
        ln -sv /usr/share/mythes/$(basename $file) .
        done
    popd

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

