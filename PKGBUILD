# Maintainer: Radon Rosborough <radon@radian.codes>
# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgbase="libgourou"
pkgname=("libgourou" "libgourou-utils")
pkgver=0.8.10
pkgrel=4
pkgdesc="Free implementation of Adobe's ADEPT protocol used to add DRM on EPUB/PDF files"
arch=('any')
license=('LGPL-3.0-or-later' 'BSD-3-Clause')
url="https://forge.soutade.fr/soutade/libgourou"
depends=(
    'updfparser'
    'glibc'
    'libgcc'
    'libstdc++'
    'pugixml'
    'zlib'
    'libzip'
    'openssl'
    'curl'
)
conflicts=('gourou-git' 'gourou-bin' 'gourou-appimage')
source=(
    "libgourou-$pkgver.tar.gz::https://forge.soutade.fr/soutade/libgourou/archive/v$pkgver.tar.gz"
    "inherit-cxxflags.patch"
)
sha512sums=(
    'bf9c4341f45b1fe77a9c95b5844da7ac5cc96b0edf7ef39caf11b980e82765f6a7c5932aaee998df002b965215cd7fbae2606dbbb86da12f88eafa830e7c5c14'
    '98e1b81a655468f13d7974ba8d9bfd6bfcf6ef58709b9cfb2046c385e4d1bd0c38c1bd55bd0db9fe232c955723dd5adfd66b50c1dbf37e74df69b41152fbcda7'
)
# For dealing with the humanity check
_cookie=$(curl -s https://forge.soutade.fr/402.html | sed -nE 's/.*document\.cookie = "([^;"]*).*/\1/p')
DLAGENTS=("https::/usr/bin/curl -b $_cookie -o %o %u")

prepare() {
    cd libgourou
    # Patch utils/Makefile to inherit CXXFLAGS, and utils/drmprocessorclientimpl.h to work with flto=auto which is set by default in makepkg.conf
    patch -Np1 < ../inherit-cxxflags.patch
}

build() {
    cd libgourou
    # We want to link dynamically, but UPDFPARSERLIB needs to point to a valid file so we point it to /dev/null
    make \
        BUILD_STATIC=0 \
        BUILD_SHARED=1 \
        UPDFPARSERLIB="/dev/null" \
        LDFLAGS="$LDFLAGS -lpugixml -lupdfparser" \
        obj libgourou

    cd utils
    make ROOT=..
}

package_libgourou() {
    license=('LGPL-3.0-or-later')
    depends=(
        'updfparser'
        'glibc'
        'libgcc'
        'libstdc++'
        'pugixml'
    )

    cd libgourou
    install -Dm755 "libgourou.so.$pkgver" -t "$pkgdir/usr/lib"
    ln -s "libgourou.so.$pkgver" "$pkgdir/usr/lib/libgourou.so"
    make DESTDIR="$pkgdir" PREFIX="/usr" install_headers
}

package_libgourou-utils() {
    pkgdesc="Downloading and decrypting tools for Adobe encrypted (ACSM) EPUB/PDF files"
    license=('BSD-3-Clause')
    depends=(
        'libgourou'
        'glibc'
        'libgcc'
        'libstdc++'
        'pugixml'
        'zlib'
        'libzip'
        'openssl'
        'curl'
    )
    provides=("gourou=${pkgver}")
    replaces=('gourou')

    cd libgourou/utils
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/utils-LICENSE"
}
