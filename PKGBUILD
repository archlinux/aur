# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgbase=rime-flypy
pkgname=('rime-flypy' 'fcitx5-flypy')
pkgver=20240827
pkgrel=1
arch=('x86_64')
url="http://flypy.com/"
license=('unknown')
makedepends=('libime' 'librime' 'python' 'rime-prelude')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/cubercsl/rime-flypy/archive/v$pkgver.tar.gz")
sha256sums=('04fb5dd3ca6a09c13054405025827bcba50f34cb551dd28c4b692ee619a655dd')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf $_f; done
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # build rime table
    make PREFIX=/usr "DESTDIR=$pkgdir"

    # build fcitx5 table
    make -C fcitx5 PREFIX=/usr "DESTDIR=$pkgdir"
}

package_rime-flypy() {
    pkgdesc="小鹤音形 rime 挂接文件"
    optdepends=('ibus-rime: input support'
                'fcitx-rime: input support'
                'fcitx5-rime: input support')
    install="$pkgname.install"
    cd "$srcdir/$pkgbase-$pkgver"
    make PREFIX=/usr "DESTDIR=$pkgdir" install
}

package_fcitx5-flypy() {
    pkgdesc="小鹤音形 fcitx5 码表"
    depends=('fcitx5-chinese-addons')
    cd "$srcdir/$pkgbase-$pkgver"
    make -C fcitx5 PREFIX=/usr "DESTDIR=$pkgdir" install
}
