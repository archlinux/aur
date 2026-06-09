# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributor: Andrew <darkseed2007@yandex.ru>
# Contributor: Robert Štětka <robert dot stetka at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=freenet-fms
pkgver=0.3.86
pkgrel=1
pkgdesc="Freenet Messaging System"
url="http://127.0.0.1:8888/freenet:USK@0npnMrqZNKRCRoGojZV93UNHCMN-6UU3rRSAmP6jNLE,~BG-edFtdCC1cSH4O3BWdeIYa8Sw5DfyrSV-TKdO5ec,AQACAAE/fms/-155"
license=('GPL-2.0')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
install=fms.install
depends=('poco' 'sqlite3' 'mbedtls')
makedepends=('cmake')

_FREENET=${FREENET_PROXY:-http://127.0.0.1:8888}
_URI='CHK@ZndjoXMPzYxVTxhfpAzBMKlLYfQ~LjlDz-~N9xGB-JE,HhAoviqsLgsasYAEGPdDY3ZeeMfJa0QbIfLby8YjxEI'

source=("${_FREENET}/?forcedownload&max-size=99999999&key=${_URI},AAMC--8/fms-src-${pkgver}.zip"
        fms.{install,tmpfiles,service}
        '0001-mbedtls-3.6.patch'
        '0002-fix-compile-on-aarch64.patch'
        '0003-fix-narrowing-array.patch')

b2sums=('a0f082d759b757e1cabdd58a28b6723ba516a340d100b414917f33f00d53e2575c3cee7aca23b61074d98887192d9e4babd0409389f95c6777213c415f4608dc'
        '496875c2960675684e7ac3b055e033f50828cff30a71ff6d04b1ff23e45681b42cc6a30c04ac1e277704f00ebc716c66944da153f6e34bc9b624afd33561ab9d'
        '8e1618c6d01a3e62bf56d2db87612ec68d1cc825e5eb85e829afc95215bca17bbf1dee79945d1170ccdd9f992525c6a1f396710ecfe50669062910ce01c60bad'
        '2fa023fd0c5c0dbb99e1fe6aba0d66fbc0d939592b4ab6fb9ec862d65d3961b333cebb7ed95897a5bf9d2402ab5771818024255e4eba4be4407311b61f4320a8'
        '3bc7e716067ebeabece8832d31008c259b3fbfcb3674ae4e2dc6281d8af6b81a566089b1510f0ef07c42a592cc2238d42afb1b954e1a114fe6c5d3a41efdafd4'
        '8d52ed92fb75a600365a9ddb22efb432a658a0e139cddd579fb27b0edf7024de7f257d7ea1a0531e8f238db87d17cce049339105cc77a1c166d75ec13960cb74'
        'c69fedbbd1ea4d15ed6ecb8d6008fbc3994c08745754f38d3e7211a64f8b247fb20442987751ded0af661957de185907b5656c625e62129f10ca01aa844639f1')

prepare() {
    rm -rf libs
    patch -p1 --binary -i 0001-mbedtls-3.6.patch
    patch -p1 --binary -i 0002-fix-compile-on-aarch64.patch
    patch -p1 --binary -i 0003-fix-narrowing-array.patch
}

build() {
    rm -rf build
    mkdir build
    cd build

    cmake -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-endif-labels -Wno-unused-result -Wno-deprecated-declarations" \
          -DI_HAVE_READ_THE_README=ON \
          -DDO_CHARSET_CONVERSION=ON \
          -DFROST_SUPPORT=ON \
          -DFCP_SSL_SUPPORT=ON \
          -DUSE_BUNDLED_SQLITE=OFF \
          -DALTERNATE_CAPTCHA=OFF \
          ..
    make
}

package() {
    install -dm770 "$pkgdir/opt/$pkgname"
    install -dm750 "$pkgdir/usr/share/doc/$pkgname"

    install -m755 build/fms  "$pkgdir/opt/$pkgname"
    install -m644 ./*.htm    "$pkgdir/opt/$pkgname"
    install -m644 readme.txt "$pkgdir/usr/share/doc/$pkgname"

    cp -r fonts images styles translations "$pkgdir/opt/$pkgname"

    # systemd
    install -Dm644 fms.service  "$pkgdir"/usr/lib/systemd/system/fms.service
    install -Dm644 fms.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/fms.conf
    echo "u fms - \"Freenet Message System\" /opt/$pkgname /bin/false" |
    install -Dm644 /dev/stdin   "$pkgdir"/usr/lib/sysusers.d/fms.conf
}
