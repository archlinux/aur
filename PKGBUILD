# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-jyutgaan
pkgver=0.0.0.20200811
_commit=050d49d080ee2f75ca77be0625dd11f07c712797
pkgrel=1
pkgdesc="Jyutgaan input for rime"
arch=('any')
url="https://github.com/redchenjs/rime-jyutgaan"
license=('CCPL:cc-by')
# dependency on dictionary: rime-cantonese
# dependency for reverse lookup: rime-luna-pinyin
depends=('rime-cantonese' 'rime-luna-pinyin')
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("https://github.com/redchenjs/rime-jyutgaan/archive/$_commit/rime-jyutgaan-$_commit.tar.gz")
sha512sums=('8ed51d909ad1396b504ba72d4897346b8ce940388952deefb4a6a4a100c74f79e43ff9fdfba52bf7c92faba414ec3be318bafdf0a4fbc194a3d87e8ad4fa5298')

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
