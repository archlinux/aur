# Maintainer: razaq <github.com/razaqq>

pkgname='potatoalert'
pkgdesc='A statistics companion app for World Of Warships'
pkgver='3.1.17'
url='https://github.com/razaqq/PotatoAlert'
arch=('x86_64')
license=('MIT')
pkgrel=1
makedepends=('cmake' 'rust' 'python' 'ninja' 'gendesk')
depends=('qt6-base' 'qt6-svg' 'openssl')
source=("https://github.com/razaqq/PotatoAlert/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d81493c36afaa3c5ddfcd8995eb8c40b4314ca423cc0f4685f6bc3c6fa5b06d1')
options=('strip' '!libtool' '!debug' '!lto' 'buildflags')

prepare()
{
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "PotatoAlert" --exec "PotatoAlert"
}

build()
{
    cmake -B build -G Ninja -S "PotatoAlert-$pkgver" \
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
    install -Dm644 "$srcdir/PotatoAlert-$pkgver/Resources/potato.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
