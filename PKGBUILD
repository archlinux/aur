# Maintainer: razaq <github.com/razaqq>

pkgname='potatoalert'
pkgdesc='A statistics companion app for World Of Warships'
pkgver='3.1.16'
url='https://github.com/razaqq/PotatoAlert'
arch=('x86_64')
license=('MIT')
pkgrel=1
makedepends=('cmake' 'rust' 'python' 'ninja' 'gendesk')
depends=('qt6-base' 'qt6-svg' 'openssl')
source=("https://github.com/razaqq/PotatoAlert/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8760116883f14493a1a873da10fec912b7e7286d3de619fe3785b7d5ae6adc57')
options=('strip' '!libtool' '!debug' '!lto' 'buildflags')

prepare()
{
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build()
{
    cmake -B build -G Ninja -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_C_COMPILER:FILEPATH='/usr/bin/gcc' \
        -DCMAKE_CXX_COMPILER:FILEPATH='/usr/bin/g++' \
        -DCMAKE_INSTALL_PREFIX:STRING='/usr/local' \
        -Wno-dev
    cmake --build build --config Release
}

check()
{
    ctest --test-dir build --output-on-failure
}

package()
{
    mkdir -p $pkgdir/usr/local/bin
    cp -r $srcdir/build/bin/* $pkgdir/usr/local/bin
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-$pkgver/Resources/potato.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
