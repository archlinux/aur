# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=xbps
pkgver=0.51
pkgrel=2
pkgdesc="The X Binary Package System from Void Linux. Don't use it instead of Arch's 'pacman'."
arch=('i686' 'x86_64')
url="https://github.com/voidlinux/xbps"
license=('custom:2-clause-BSD')
depends=('ca-certificates' 'libarchive' 'openssl-1.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/voidlinux/xbps/archive/$pkgver.tar.gz"
        "fix-lflags.patch::https://github.com/voidlinux/xbps/commit/e8c1ae96ae487e4aa84d22a5a045df0e2a7113f5.patch"
        "fix-openssl.patch::https://github.com/voidlinux/xbps/commit/861617a708622d1411d88a45e1c5c644d497c086.patch")
md5sums=('8acd65768e3be3827841f3a5848a19d7'
         '38438c0ea4369b77d333372e5212a382'
         '836cfb2a0a762e4943a6c0a565beaadd')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < ../fix-lflags.patch
    patch -p1 < ../fix-openssl.patch
}

build() {
    cd "$pkgname-$pkgver"
    export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --dbdir=/var/lib/xbps

    sed -i '/-Werror/d' config.mk
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 COPYING.3RDPARTY "$pkgdir/usr/share/licenses/$pkgname/COPYING.3RDPARTY"
}
