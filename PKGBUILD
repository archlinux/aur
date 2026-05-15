pkgname=dusk-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Dusk is a reverse-engineered reimplementation of Twilight Princess."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusklight"
license=('GPL')
depends=('glibc' 'gcc-libs' 'curl' 'freetype2' 'libidn2' 'rtmpdump' 'libssh' 'libpsl' 'openssl' 'krb5' 'openldap' 'zstd' 'brotli' 'zlib' 'bzip2' 'libpng' 'libunistring' 'gnutls' 'nettle' 'gmp' 'e2fsprogs' 'cyrus-sasl' 'p11-kit' 'libtasn1' 'keyutils' 'libffi')
makedepends=('unzip')
source=("dusklight" "https://github.com/TwilitRealm/dusk/releases/download/v$pkgver/Dusklight-v$pkgver-linux-x86_64.AppImage")
sha256sums=('9d8b481884b504dc4faf69a882351b9c12d9adb1b2c4a4ed5ec8f9d3bb47b946'
            'f01b4ad576461f1c3611b6e0ca657cea0be760f60ee9f89961076e791b3ca163')

package() {
    install -dm755 "$pkgdir/usr/bin/Dusklight"
    install -dm755 "$pkgdir/usr/lib/Dusklight"
    install -dm775 "$pkgdir/usr/share"

    # Extracting appimage
    cd $srcdir
    chmod +x ./Dusklight-v$pkgver-linux-$arch.AppImage
    ./Dusklight-v$pkgver-linux-$arch.AppImage --appimage-extract

    # Packaging files
    cd "$srcdir/squashfs-root"
    cp -a "$srcdir/squashfs-root/usr/bin/." "$pkgdir/usr/bin/Dusklight/"
    cp -a "$srcdir/squashfs-root/usr/lib/." "$pkgdir/usr/lib/Dusklight/"
    cp -a "$srcdir/squashfs-root/usr/share" "$pkgdir/usr/"
    install -Dm755 "$srcdir/dusklight" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/squashfs-root/usr/share/applications/dusklight.desktop" \
    "$pkgdir/usr/share/applications/dusklight.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/dusklight.desktop"
}
