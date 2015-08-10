# Maintainer: Benjamin Hedrich <kiwisauce@pagenotfound.de>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Tomas Strand <tomas@fik1.net>
pkgname=libspotify
pkgver=12.1.51
pkgrel=3
pkgdesc="C API package allowing third-party developers to write applications that utilize the Spotify music streaming service"
arch=(i686 x86_64 armv7h armv6h)
url="https://developer.spotify.com/technologies/libspotify/"
license=('custom')
depends=('glibc')

if [ "$CARCH" == "armv6h" ]; then
    pkgver=12.1.103
    SPOTIFY_ARCH="armv6-bcm2708hardfp"
    md5sums=('bf9afc8c7b966841735734b248f9c7a7')
    sha256sums=('d658e6c1978fb46cf33376eb8367a51d024f4014f21beac1dd264532bcc54b24')
fi

if [ "$CARCH" == "armv7h" ]; then
    SPOTIFY_ARCH="armv7"
    md5sums=('eb7e98849b3bb6d364fa74034602afbf')
    sha256sums=('ad27b6c5aee5382b66b39bfea3b1752076b7abcc445979ce25c1ec9d7ff3aeda')
fi

if [ "$CARCH" == "x86_64" ]; then
    SPOTIFY_ARCH="x86_64"
    md5sums=('83efddcc195d6ff12b24c97c767a5e45')
    sha256sums=('43a14e0732ba6ae30078fac105d0e2998d04d5f5c396a4968386bc4e22491058')
fi

if [ "$CARCH" == "i686" ]; then
    SPOTIFY_ARCH="i686"
    md5sums=('04735b890da0b1fc7f1f14e68a5293de')
    sha256sums=('941ab4ba10bcd6ec4e96127afd095a39e11bc955de0882734c97e4f588b155ae')

fi

source=(http://developer.spotify.com/download/libspotify/libspotify-${pkgver}-Linux-${SPOTIFY_ARCH}-release.tar.gz)

build() {
    cd "$srcdir/$pkgname-$pkgver-Linux-${SPOTIFY_ARCH}-release"

    # Don't do stupid things from a Makefile
    msg2 "Patching Makefile..."
    sed -i 's/ldconfig//' Makefile
}

package() {
    cd "$srcdir/$pkgname-$pkgver-Linux-${SPOTIFY_ARCH}-release"

    make prefix="$pkgdir/usr" install

    # Install documentation
    cp -R share "$pkgdir"/usr/share
    mkdir -p "$pkgdir"/usr/share/man
    mv "$pkgdir"/usr/share/man3 "$pkgdir"/usr/share/man/man3

    # Correct pkgconfig file
    sed -e s:PKG_PREFIX:/usr:g \
          < lib/pkgconfig/libspotify.pc \
          > "$pkgdir"/usr/lib/pkgconfig/libspotify.pc

    # Custom license
    install -Dm644 LICENSE licenses.xhtml "$pkgdir"/usr/share/doc/libspotify
    mkdir -p "$pkgdir"/usr/share/licenses/libspotify
    ln -s ../../doc/libspotify/LICENSE "$pkgdir"/usr/share/licenses/libspotify/LICENSE
}
