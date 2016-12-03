# Maintainer: Rafał Kozdrój <rafal.kozdroj+aur@gmail.com>

_pkgname=megasync
pkgname="${_pkgname}-qt5"
pkgver=2.9.10
pkgrel=1
pkgdesc="Sync your files to your Mega account (qt5 version)"
arch=('i686' 'x86_64')
url="https://mega.nz/#sync"
license=('custom')
depends=('qt5-base' 'hicolor-icon-theme' 'c-ares' 'crypto++' 'curl' 'libuv' 'libsodium')
makedepends=('qt5-tools' 'lsb-release')
optdepends=("nautilus-megasync: for integration with nautilus")
provides=("megasync=${pkgver}")
conflicts=('megatools' 'megasync')
source=("https://mega.nz/linux/MEGAsync/Debian_8.0/${_pkgname}_${pkgver}.orig.tar.gz")
md5sums=('9e8fc07533555de5eb8dfe832647097a')

build() {
    export QT_SELECT=5

    cd "${_pkgname}-${pkgver}/MEGASync/mega"
    ./clean.sh
    ./autogen.sh
    ./configure \
    --disable-silent-rules \
    --disable-curl-checks \
    --disable-megaapi \
    --with-cryptopp \
    --with-sodium \
    --with-zlib \
    --with-sqlite \
    --with-cares \
    --with-curl \
    --without-freeimage \
    --without-readline \
    --without-termcap \
    --disable-posix-threads \
    --disable-examples \
    --prefix=/usr

    cd "../.."
    qmake CONFIG+="release" MEGA.pro
    lrelease MEGASync/MEGASync.pro
    make
}

package() {
    cd "${_pkgname}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm 644 debian.copyright $pkgdir/usr/share/licenses/megasync-qt5/license

    cd "MEGASync"
    install -Dm 755 megasync $pkgdir/usr/bin/megasync
}
