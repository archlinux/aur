pkgname="gourou"
pkgver=0.8.10
pkgrel=2
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL-3.0-or-later' 'BSD-3-Clause')
url="https://forge.soutade.fr/soutade/libgourou"
depends=(updfparser glibc libgcc libstdc++ zlib libzip openssl pugixml curl)
makedepends=()
conflicts=(gourou-git gourou-bin gourou-appimage)
provides=("gourou=${pkgver}" "libgourou=${pkgver}")
options=(strip)
source=("libgourou-$pkgver.tar.gz::https://forge.soutade.fr/soutade/libgourou/archive/v$pkgver.tar.gz")
sha512sums=('bf9c4341f45b1fe77a9c95b5844da7ac5cc96b0edf7ef39caf11b980e82765f6a7c5932aaee998df002b965215cd7fbae2606dbbb86da12f88eafa830e7c5c14')

build() {
    cd libgourou
    # We want to link dynamically, but UPDFPARSERLIB needs to point to a valid file so we point it to /dev/null
    make \
        BUILD_STATIC=0 \
        BUILD_SHARED=1 \
        UPDFPARSERLIB="/dev/null" \
        LDFLAGS="-lpugixml -lupdfparser -Wl,-z,relro,-z,now" \
        obj libgourou

    cd utils
    make ROOT=..
}

package() {
    cd libgourou
    install -Dm755 "libgourou.so.$pkgver" -t "$pkgdir/usr/lib"
    ln -s "libgourou.so.$pkgver" "$pkgdir/usr/lib/libgourou.so"
    make DESTDIR="$pkgdir" PREFIX="/usr" install_headers

    cd utils
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/utils-LICENSE"
}
