# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-zijinmaa
pkgver=0.0.0.20200813
_commit=f425af390b211041fa96710ec3a9e545364ffec6
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
sha512sums=('edc08c0b45576519bcbdbb42cdd258cbe9e53bcb6fcf2dc72e9de592210a4941e2f553a82badbe3f81dbe7b84a5654d5db56077fecd7f69c757e54f115c4c1d0')

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
