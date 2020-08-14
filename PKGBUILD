# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-zijinmaa
pkgver=0.0.0.20200813
_commit=18dc759b9e96c76168d7f75070fb810d1a83b752
pkgrel=1
pkgdesc="Zijinmaa input for rime"
arch=('any')
url="https://github.com/redchenjs/rime-zijinmaa"
license=('CCPL:cc-by')
# dependency on dictionary: rime-cantonese
# dependency for reverse lookup: rime-luna-pinyin
depends=('rime-cantonese' 'rime-luna-pinyin')
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("https://github.com/redchenjs/rime-zijinmaa/archive/$_commit/rime-zijinmaa-$_commit.tar.gz")
sha512sums=('41479a5910a11869579c92586b69a50d66a6e1072a6800edb6490c0a5cddb7598a622615153441aaf754395f12d2b6866135df249a8bccdf1da4451b7444feda')

prepare() {
    cd $pkgname-$_commit
    # Link essentials
    for _f in $(pacman -Qql rime-prelude rime-essay rime-cantonese | grep -v "/$"); do ln -sf $_f; done
}

build(){
    cd $pkgname-$_commit
    for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
    cd $pkgname-$_commit
    find . -type l -delete
    rm build/*.txt
    rm build/jyut6ping3*
    install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
    install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
