# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributor: Andrew <darkseed2007@yandex.ru>
# Contributor: Robert Štětka <robert dot stetka at gmail dot com>

pkgname=freenet-fms
pkgver=0.3.82
pkgrel=1
pkgdesc="Freenet Messaging System"
url="http://127.0.0.1:8888/freenet:USK@0npnMrqZNKRCRoGojZV93UNHCMN-6UU3rRSAmP6jNLE,~BG-edFtdCC1cSH4O3BWdeIYa8Sw5DfyrSV-TKdO5ec,AQACAAE/fms/150"
license=('GPL2')
arch=('i686' 'x86_64')
install=fms.install
depends=('poco' 'sqlite3' 'mbedtls')
makedepends=('cmake')

_FREENET=${FREENET_PROXY:-http://127.0.0.1:8888}
_URI='CHK@TXV7TmdC9TH6CBWeyl8HrgRqmHbDjUdxDs99dzsVavk,P-FMaSkEaa~Qo4xdZkrqegOfepWwAE7WCzVk~a214UQ'

source=("$_FREENET/?forcedownload&max-size=99999999&key=${_URI},AAMC--8/fms-src-${pkgver}.zip"
        #"https://dev.gentoo.org/~tommy/distfiles/fms-src-${pkgver}.zip"
        fms.{install,tmpfiles,service}
        'use-system-mbedtls.patch')

b2sums=('c18630b8b1b8871290f1d66c4638b99c110e0f49bef11517aa83760274707fd5d0b53c053ea3b38a0c35018de4a4b6f3dd426499228997bac377bb1f04f784fb'
        '496875c2960675684e7ac3b055e033f50828cff30a71ff6d04b1ff23e45681b42cc6a30c04ac1e277704f00ebc716c66944da153f6e34bc9b624afd33561ab9d'
        '8e1618c6d01a3e62bf56d2db87612ec68d1cc825e5eb85e829afc95215bca17bbf1dee79945d1170ccdd9f992525c6a1f396710ecfe50669062910ce01c60bad'
        '2fa023fd0c5c0dbb99e1fe6aba0d66fbc0d939592b4ab6fb9ec862d65d3961b333cebb7ed95897a5bf9d2402ab5771818024255e4eba4be4407311b61f4320a8'
        '841e9bcbf2bb0a620e27fa02ff3ae70c4b100b50d64c43558168a6c4aea58d331aff37982480317f599a8ff60fe4c158531738ba79808af8f1058a9afe8420cf')

prepare() {
    rm -rf libs
    perl -pi -e 's/\r\n/\n/' CMakeLists.txt
    patch -Np0 -i use-system-mbedtls.patch
}

build() {
    rm -rf build
    mkdir build
    cd build

    cmake -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-endif-labels" \
          -DI_HAVE_READ_THE_README=ON \
          -DDO_CHARSET_CONVERSION=ON \
          -DFROST_SUPPORT=ON \
          -DFCP_SSL_SUPPORT=ON \
          -DUSE_BUNDLED_SQLITE=OFF \
          ..
    make
}

package() {
    install -dm770 "$pkgdir/opt/$pkgname"
    install -dm750 "$pkgdir/usr/share/doc/$pkgname"

    install -m755 build/fms  "$pkgdir/opt/$pkgname"
    install -m644 *.htm      "$pkgdir/opt/$pkgname"
    install -m644 readme.txt "$pkgdir/usr/share/doc/$pkgname"

    cp -r fonts images styles translations "$pkgdir/opt/$pkgname"

    # systemd
    install -Dm644 fms.service  "$pkgdir"/usr/lib/systemd/system/fms.service
    install -Dm644 fms.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/fms.conf

    echo "u fms - \"Freenet Message System\" /opt/$pkgname /bin/false" |
    install -Dm644 /dev/stdin   "$pkgdir"/usr/lib/sysusers.d/fms.conf
}
