# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgbase=rime-flypy
pkgname=('rime-flypy' 'fcitx5-flypy')
pkgver=10.9.3.2
pkgrel=2
arch=('x86_64')
url="http://flypy.com/"
license=('unknown')
makedepends=('libime' 'librime' 'python' 'rime-prelude')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/cubercsl/rime-flypy/archive/v$pkgver.tar.gz")
sha256sums=('318cb75dee4075e44b09b1e064cc3d4a0dd985cc60102605d8e20a53e4dcc01d')

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
