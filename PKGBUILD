# Maintainer: Moviuro <moviuro+aur at gmail dot com>

_game=thiswarofmine
pkgname="${_game}-hib"
pkgver=20161223
pkgrel=1
pkgdesc="In War... Not everyone is a soldier"
arch=("x86_64")
url="http://www.thiswarofmine.com/"
license=("custom:commercial")
# The game does ship some libs, but we chose not to use them
depends=("lib32-curl" "lib32-openal")
source=("hib://${_game}_deluxe_linux.zip"
        "${pkgname}.in")
# The archive is weird.
noextract=("${_game}_deluxe_linux.zip")
md5sums=("de29d2d7cb2c68b09983e19c864b475e"
         "956e6fe2462d118d64fb0c01f6bc7fc1")
options=(!strip)

# Disable compression of the package
PKGEXT='.pkg.tar'

prepare() {
    mkdir -p "${srcdir}/${pkgname}"
    bsdtar xOf "${_game}_deluxe_linux.zip" 'Linux/Kosovo All - DRM Free.tar.gz' |
      bsdtar x -C "${srcdir}/${pkgname}" -f -
}

package() {
    install -dm755 "${pkgdir}/opt"

    # Data
    # Hardlink files to save the disk space
    cp -Ral "$srcdir/$pkgname" "$pkgdir/opt/$pkgname"

    # Libs
    ln -sf "/usr/lib32/libopenal.so" "$pkgdir/opt/$pkgname/libOpenAL.so"
    ln -sf "/usr/lib32/libcurl.so.4" "$pkgdir/opt/$pkgname/libcurl.so.4"

    # Fix permissions
    find "$pkgdir/opt/$pkgname" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname" -type f -print0 | xargs -0 chmod 644
    chmod 755 "$pkgdir/opt/$pkgname/KosovoLinux"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    sed "s!@PKGDEST@!/opt/$pkgname/!" "$pkgname.in" > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # License
    # None to be found in the archive
}
