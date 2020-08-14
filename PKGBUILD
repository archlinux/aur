# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-zijinmaa
pkgver=0.0.0.20200813
_commit=2ce840875cb92f23886bfd72bd12f3304d1debec
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
sha512sums=('6d7ec75d7a7ead94edee8d316dc53ab482b71e4a8b30d5add859ddb3946f8187867a0077280bc605e704a390b2a2e3402ae277e973ac87257188aa3db8d0d759')

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
