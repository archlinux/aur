# Maintainer: Vitrum <wqdxosty1yhj at bk dot ru>

pkgbase=hunspell-hy
pkgname=('hunspell-hy-classical' 'hunspell-hy-reformed')
pkgver=3.0.1
pkgrel=4
pkgdesc="Armenian hunspell dictionaries"
arch=(any)
url="https://github.com/hyspell/"
license=('MIT')
optdepends=('hunspell: the spell checking libraries and apps')
source=(
    'https://raw.githubusercontent.com/hyspell/HySpell_3.0.1/master/Dictionaries/Dictc/hy-c.aff'
    'https://raw.githubusercontent.com/hyspell/HySpell_3.0.1/master/Dictionaries/Dictc/hy-c.dic'
    'https://raw.githubusercontent.com/hyspell/HySpell_3.0.1/master/Dictionaries/Dictr/hy-r.aff'
    'https://raw.githubusercontent.com/hyspell/HySpell_3.0.1/master/Dictionaries/Dictr/hy-r.dic'
    'https://raw.githubusercontent.com/hyspell/HySpell_3.0.1/master/Dictionaries/license.txt'
)
sha1sums=('d01c0c802013115c7701c04425f865f3aa78743b'
          'da1c9f8c51b77b16789c4473756d688e691b74c8'
          '77d9996d4d1b50ac1134d2882ad51e53968ee7c6'
          'cfd078f93c44e9b9a5f1a27fb04bd4e7763ee2ae'
          '04fa1d9d0b8017e2877b1d338d4ff862cd540002')

prepare() {
    # add WORDCHARS and IGNORE lines
    sed -i '4i\\nWORDCHARS ֊՛՜՞՚\nIGNORE ֊՛՜՞՚' hy-c.aff
    sed -i '4i\\nWORDCHARS ֊՛՜՞՚\nIGNORE ֊՛՜՞՚' hy-r.aff
}

package_hunspell-hy-classical() {
    pkgdesc="Armenian hunspell dictionaries. Classical Orthography."
    conflicts=('hunspell-hy-reformed')

    cd "$srcdir"
    install -dm755 ${pkgdir}/usr/share/hunspell
    install -m644 hy-c.aff $pkgdir/usr/share/hunspell/hy_AM.aff
    install -m644 hy-c.dic $pkgdir/usr/share/hunspell/hy_AM.dic
    _common
}

package_hunspell-hy-reformed() {
    pkgdesc="Armenian hunspell dictionaries. Reformed Orthography."
    conflicts=('hunspell-hy-classical')

    cd "$srcdir"
    install -dm755 ${pkgdir}/usr/share/hunspell
    install -m644 hy-r.aff $pkgdir/usr/share/hunspell/hy_AM.aff
    install -m644 hy-r.dic $pkgdir/usr/share/hunspell/hy_AM.dic
    _common
}

_common() {
    # MySpell symlinks
    install -dm755 ${pkgdir}/usr/share/myspell/dicts
    pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
        ln -sv /usr/share/hunspell/$(basename $file) .
    done
    popd

    # licenses
    install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
