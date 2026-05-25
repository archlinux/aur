# Maintainer: C-Yassin <c.yassin.org@gmail.com>
pkgname=amethystminer
pkgver=1.1
pkgrel=1
pkgdesc="Amethyst Miner is a smart, and fully automated Monero (XMR) background miner."
arch=('x86_64' 'aarch64')
url="https://github.com/C-Yassin/AmethystMiner"
license=('MIT' 'GPL3')

depends=('python' 'python-pyqt6' 'python-requests' 'hwloc' 'libuv' 'openssl' 'polkit')
makedepends=('git' 'cmake' 'ninja' 'gcc')

_xmrig_ver="v6.26.0"

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "xmrig-$_xmrig_ver.tar.gz::https://github.com/xmrig/xmrig/archive/refs/tags/$_xmrig_ver.tar.gz")

sha256sums=('ff03e4a70193c25cd7c53dca08570fcd624b955b5e828a1419f2eb6f4c4a937a'
            '5005144e78571f26586410c2b2ede2b0c72afe22f97f1708ea24cfb253c3939b')

prepare() {
    local _xmrig_dir="xmrig-${_xmrig_ver#v}"
    cd "$srcdir/$_xmrig_dir"

    sed -i 's/constexpr const int kDefaultDonateLevel = [0-9]*;/constexpr const int kDefaultDonateLevel = 0;/g' src/donate.h
    sed -i 's/constexpr const int kMinimumDonateLevel = [0-9]*;/constexpr const int kMinimumDonateLevel = 0;/g' src/donate.h

    cd "$srcdir/AmethystMiner-$pkgver"
    sed -i "s|/app/share/amethyst|/usr/lib/$pkgname|g" config/start-amethyst
}

build() {
    local _xmrig_dir="xmrig-${_xmrig_ver#v}"
    cd "$srcdir/$_xmrig_dir"

    mkdir -p build && cd build
    cmake .. -DWITH_HWLOC=ON -DWITH_TLS=ON
    make -j$(nproc)
}

package() {
    cd "$srcdir/AmethystMiner-$pkgver"

    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib/$pkgname/core"

    cp -r config core gui "$pkgdir/usr/lib/$pkgname/"
    install -m644 *.py -t "$pkgdir/usr/lib/$pkgname/"

    install -Dm644 gui/AmethystMiner.desktop "$pkgdir/usr/share/applications/amethystminer.desktop"
    install -Dm644 gui/amethyst.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/AmethystMiner.svg"

    install -Dm755 config/start-amethyst "$pkgdir/usr/bin/$pkgname"

    local _xmrig_dir="xmrig-${_xmrig_ver#v}"
    install -m755 "$srcdir/$_xmrig_dir/build/xmrig" "$pkgdir/usr/lib/$pkgname/core/xmrig"

    rm -f "$pkgdir/usr/lib/$pkgname/core/xmrig.exe"
    rm -f "$pkgdir/usr/lib/$pkgname/core/WinRing0x64.sys"
    rm -f "$pkgdir/usr/lib/$pkgname/gui/io.github.C_Yassin.AmethystMiner.metainfo.xml"
    rm -f "$pkgdir/usr/lib/$pkgname/gui/io.github.C_Yassin.AmethystMiner.desktop"
}
