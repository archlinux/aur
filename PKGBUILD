# Maintainer   : bartus <arch-local-repo(at).bartus.33mail.com>
# Co-Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor  : Rafał Kozdrój <kozeid2+aur@gmail.com>
# Contributor  : kikadf <kikadf.01@gmail.com>
# Contributor  : Daniel Henry <d at hackr dot pl>
# Contributor  : Miguel Revilla <yo at  miguelrevilla dot com>
# Contributor  : Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
# Contributor  : Hexchain Tong <i at hexchain dot org>

pkgname=megasync-nopdfium
pkgver=4.12.2.0
pkgrel=2
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive(stripped of pdfium dependency)"
arch=('i686' 'x86_64')
provides=(megasync=$pkgver)
conflicts=(megasync)
url="https://github.com/meganz/MEGAsync"
license=('custom:MEGA LIMITED CODE REVIEW LICENCE')
depends=('c-ares' 'crypto++' 'libsodium' 'hicolor-icon-theme' 'libuv'
         'qt5-base' 'qt5-svg' 'qt5-x11extras' 'libmediainfo' 'libraw'
         'ffmpeg' 'freeimage' 'qt5-declarative')
makedepends=('qt5-tools' 'swig' 'doxygen' 'lsb-release' 'git')
_extname="_Win"
source=("git+https://github.com/meganz/MEGAsync.git#tag=v${pkgver}${_extname}"
        "meganz-sdk::git+https://github.com/meganz/sdk.git"
        "ffmpeg.patch")
sha256sums=('SKIP'
            'SKIP'
            'feef2f0ff3c0f4ad29fd882fddfca038e8f6e4158fa8dc9af2248d2f83e1a083')

prepare() {
    cd "MEGAsync"
    git config submodule.src/MEGASync/mega.url "../meganz-sdk"
    git -c protocol.file.allow=always submodule update --init
    git -C src/MEGASync/mega/src/gfx apply -v "$srcdir/ffmpeg.patch"

    cd "src/MEGASync"
    sed -i '/DEFINES += REQUIRE_HAVE_PDFIUM/d' MEGASync.pro
    sed -i '/CONFIG += USE_PDFIUM/d' MEGASync.pro

}

build() {
    # build sdk
    cd "MEGAsync/src/MEGASync/mega"

    ./autogen.sh
    ./configure \
        --disable-shared \
        --enable-static \
        --disable-silent-rules \
        --disable-curl-checks \
        --disable-megaapi \
        --with-ffmpeg \
        --with-cryptopp \
        --with-sodium \
        --with-zlib \
        --with-sqlite \
        --with-cares \
        --with-curl \
        --with-freeimage \
        --with-libuv \
        --disable-posix-threads \
        --disable-examples \
        --with-libzen \
        --with-libmediainfo \
        --prefix="${srcdir}/MEGAsync/src/MEGASync/mega/bindings/qt/3rdparty"

    # build megasync
    cd "../.."
    qmake-qt5 \
        "CONFIG += FULLREQUIREMENTS" \
        MEGA.pro
    lrelease-qt5 MEGASync/MEGASync.pro
    make
}

package () {
    cd "MEGAsync"
    install -Dm 644 LICENCE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENCE"
    install -Dm 644 installer/terms.txt "${pkgdir}/usr/share/licenses/$pkgname/terms.txt"
    install -Dm 644 src/MEGASync/mega/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/SDK-LICENCE"

    cd "src"
    install -dm 755 "${pkgdir}/usr/bin"
    make INSTALL_ROOT="${pkgdir}" TARGET="${pkgdir}/usr/bin/megasync" install

    install -Dm 755 "MEGASync/megasync" "${pkgdir}/usr/bin/megasync"
}
