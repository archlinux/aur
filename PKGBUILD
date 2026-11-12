# Maintainer: Radon Rosborough <radon@radian.codes>
# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgbase="libgourou"
pkgname=("libgourou" "libgourou-utils")
pkgver=0.9
pkgrel=1
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
    "fix-lto.patch"
)
sha512sums=(
    '9d1804efcc66689e3dda3060443cdfce16a553770e8e973c3eb990845076879beaf78a8ebf9d1b496defbcaf4c602d8528f0e214242ec02f146e13c187e40c7b'
    'fd203dd8ffcfc4644805c32588c880f8beb3424821e8844e210f7d8596bf6ce36b0993eb8fc7bbe2fdff084b4088f877f189c86d10fcebc4f80d74201f7572a6'
)
# For dealing with the humanity check
_cookie=$(curl -s https://forge.soutade.fr/402.html | sed -nE 's/.*document\.cookie = "([^;"]*).*/\1/p')
DLAGENTS=("https::/usr/bin/curl -b $_cookie -o %o %u")

prepare() {
    cd libgourou
    patch -Np1 < ../fix-lto.patch
}

build() {
    cd libgourou
    # We want to link dynamically, but UPDFPARSERLIB needs to point to a valid file so we point it to /dev/null
    make \
        BUILD_STATIC=0 \
        BUILD_SHARED=1 \
        UPDFPARSERLIB="/dev/null" \
        LDLIBS="-lpugixml -lupdfparser" \
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
