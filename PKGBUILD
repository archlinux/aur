# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-jyutgaan
pkgver=0.0.0.20200811
_commit=3193893d1eb1e9f9a2b808fe8cfbe9e998e4e5e7
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
sha512sums=('c9ff8237d3279d453b5cf10da014b6ae6416f73e48cc95e92c86495506ae579b19a23748ea6ad2e0d89a03f64e58937c1034de6f82d9c613ee12854775b03da9')

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
