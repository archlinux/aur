# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgbase=rime-flypy
pkgname=('rime-flypy' 'fcitx5-flypy')
pkgver=10.9.3.5
pkgrel=1
arch=('x86_64')
url="http://flypy.com/"
license=('unknown')
makedepends=('libime' 'librime' 'python' 'rime-prelude')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/cubercsl/rime-flypy/archive/v$pkgver.tar.gz")
sha256sums=('8f8defeedc06466b6ecb5527c1157596f4c4d6a1079ca9c0afc03b3a516ef01e')

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
    depends=('rime-lua-hook')
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
