# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-jyutgaan
pkgver=0.0.0.20200811
_commit=728b7a9708695232c7c296c3fa6890671b2c7fb9
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
sha512sums=('53eff73e7465059652b9fc68f785e04c310ada658e59cb2e606a2a76c06877e7fed43e7d3b1ef372e67763c6fa5e31d436437c217bbeb2355825acb06154567d')

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
