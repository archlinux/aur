# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=snmpb
pkgver=1.0
pkgrel=2
pkgdesc="SnmpB is a desktop SNMP browser and MIB editor written in Qt."
arch=(x86_64)
url="https://sourceforge.net/projects/snmpb/"
license=(GPL2)
depends=()
makedepends=(
        git
        bison
        flex
        qt5-base
        qwt
)
provides=(snmpb)
conflicts=(snmpb)
source=(
        "$pkgname-code::git+git://git.code.sf.net/p/snmpb/code"
        "libsmi-master.tar.gz::https://gitlab.ibr.cs.tu-bs.de/nm/libsmi/-/archive/master/libsmi-master.tar.gz"
        "libtom-1.18.2.tar.gz::https://github.com/libtom/libtomcrypt/archive/refs/tags/v1.18.2.tar.gz"
        "qwt-6.2.0.zip::https://sourceforge.net/projects/qwt/files/qwt/6.2.0/qwt-6.2.0.zip/download"
        libsmi.patch
        qwt.patch
        graph.patch
        Makefile.patch
)
sha256sums=('SKIP'
            '345ed0826a42ea8db959807ede75afddda398821501225d03563f76df4530fac'
            'd870fad1e31cb787c85161a8894abb9d7283c2a654a9d3d4c6d45a1eba59952c'
            '3e9632a9be6a883db5c496e42ce74cbbf8da02cc3328faa89e2c43e434a2eb76'
            'af1a270a6f07b90f250be4ac3607c6754c01f0e893e24f939c20a9558a79f338'
            '8c8b8ac9e3abf28a3fee45689584bd0fd86ac2fa1878b03dfc623c158ae76af4'
            '36587fe4eb9fff2d2f96c01db2a1a549f1e76373b3528d063f4d648ec56c3453'
            '8fdf92573d5c351bad9c891bb087ed8186a99fdb24f0e4ecabc0096d260f0486')

prepare() {
        cd "${srcdir}"
        mv "$pkgname-code" "$pkgname-$pkgver"

        # update to latest libs
        rm -rf \
                "$pkgname-$pkgver/libsmi"/* \
                "$pkgname-$pkgver/libtomcrypt"/* \
                "$pkgname-$pkgver/qwt"/*

        cp -r "libsmi-master"/* "$pkgname-$pkgver/libsmi"
        cp -r "libtomcrypt-1.18.2"/* "$pkgname-$pkgver/libtomcrypt"
        cp -r "qwt-6.2.0"/* "$pkgname-$pkgver/qwt"

        # prepare libtomcrypt src
        cat "$srcdir/$pkgname-$pkgver/libtomcrypt/makefile.unix" > "$srcdir/$pkgname-$pkgver/libtomcrypt/makefile"

        # prepare libsmi src
        cd "$srcdir/$pkgname-$pkgver/libsmi"
        ./autogen.sh
        ./configure \
                --disable-shared \
                --disable-yang \
                --with-pathseparator=";" \
                --with-dirseparator="/" \
                --with-smipath="/usr/share/apps/snmpb/mibs;/usr/share/apps/snmpb/pibs"

        # remove mibs/ietf/IANA-ITU-ALARM-TC-MIB: redundant with one in iana folder
        rm -f "mibs/ietf/IANA-ITU-ALARM-TC-MIB"

        # apply patches
        cd "$srcdir/$pkgname-$pkgver"
        patch --forward --strip=1 --input="${srcdir}/libsmi.patch"
        patch --forward --strip=1 --binary --input="${srcdir}/qwt.patch"
        patch --forward --strip=1 --input="${srcdir}/graph.patch"
        patch --forward --strip=1 --input="${srcdir}/Makefile.patch"
}

build() {
        cd "$srcdir/$pkgname-$pkgver/libtomcrypt"
        make

        cd "$srcdir/$pkgname-$pkgver/libsmi"
        make

        cd "$srcdir/$pkgname-$pkgver/qwt"
        qmake qwt.pro
        make

        cd "$srcdir/$pkgname-$pkgver/app"
        qmake -o makefile.snmpb snmpb.pro
        make -f makefile.snmpb
}

package() {
        # install package
        cd "$srcdir/$pkgname-$pkgver"
        make INSTALL_PREFIX="$pkgdir/usr" install

        # install license files
        install -Dvm644 "$srcdir/$pkgname-$pkgver/license.txt" \
                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

        # User config files stored in
        # $HOME/.config/snmpb.sourceforge.net

        # Default dirs for MIBs/PIBs:
        # /usr/share/apps/snmpb/mibs
        # /usr/share/apps/snmpb/pibs
}
