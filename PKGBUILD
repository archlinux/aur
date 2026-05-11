pkgname=dusk-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Dusk is a reverse-engineered reimplementation of Twilight Princess."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusk"
license=('GPL')
depends=('glibc' 'gcc-libs' 'curl' 'freetype2' 'libidn2' 'rtmpdump' 'libssh' 'libpsl' 'openssl' 'krb5' 'openldap' 'zstd' 'brotli' 'zlib' 'bzip2' 'libpng' 'libunistring' 'gnutls' 'nettle' 'gmp' 'e2fsprogs' 'cyrus-sasl' 'p11-kit' 'libtasn1' 'keyutils' 'libffi')
makedepends=('unzip')
source=("dusk" "https://github.com/TwilitRealm/dusk/releases/download/v$pkgver/Dusk-v$pkgver-linux-x86_64.AppImage")
sha256sums=('61a2a82768320fdbd9de2cf8ab83d2dd247eada4b80970e746219aa0f8c519aa'
            '91c46a77f5e5071fcac7a52c21821a927ce2e9301bbb3724675b2040771f5017')

package() {
    install -dm755 "$pkgdir/usr/bin/Dusk"
    install -dm755 "$pkgdir/usr/lib/Dusk"
    install -dm775 "$pkgdir/usr/share"

    # Extracting appimage
    cd $srcdir
    chmod +x ./Dusk-v$pkgver-linux-$arch.AppImage
    ./Dusk-v$pkgver-linux-$arch.AppImage --appimage-extract

    # Packaging files
    cd "$srcdir/squashfs-root"
    cp -a "$srcdir/squashfs-root/usr/bin/." "$pkgdir/usr/bin/Dusk/"
    cp -a "$srcdir/squashfs-root/usr/lib/." "$pkgdir/usr/lib/Dusk/"
    cp -a "$srcdir/squashfs-root/usr/share" "$pkgdir/usr/"
    install -Dm755 "$srcdir/dusk" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/squashfs-root/usr/share/applications/dusk.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/dusk.desktop"
}
