# Maintainer: Igor Deyashkin <igor_deyawka@mail.ru>
pkgname="medivia"
pkgver="2.9.2"
pkgrel=0
pkgdesc="Client for medivia.online mmorpg server."
arch=('i686' 'x86_64')
url="https://medivia.online/download"
# I am not sure what license is used
license=('unknown')
depends_x86_64=('lib32-libglvnd')
depends_i686=('libglvnd')
makedepends=('chrpath')
source=("$pkgname-$pkgver.tar.gz::https://medivia.online/uploads/downloads/medivia-$pkgver-linux-32bits.tar.gz"
        "$pkgname.desktop")

# The archive does not containing root folder in it. I unextract it later on build stage into separate subfolder.
noextract=("$pkgname-$pkgver.tar.gz")

# autofill using updpkgsums
md5sums=('a15fe61553e4d26656c393cde0897291'
         '2791be26444cdf1b14d8a49736a6bbb9')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xzf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"

    # Rpath of the binary is "RPATH=$ORIGIN:/usr/local/lib:" and I replace it for just "RPATH=$ORIGIN" because we need
    # $ORIGIN to search for the libfmod.so.11 included in the package in the executable directory.

    # scottmada [explained](https://www.lexaloffle.com/bbs/?pid=29296#p) this:
    # > It means the binary looks for lib files in this directory before anywhere else. This is not a huge issue, as
    # > ArchLinux do not use this directory normally, but as this directory is meant for system-wide libraries installed
    # > by the user, a conflict could occur if the user would install there their own version of glibc (or malicious
    # > software there). A simple fix would be to delete the RPATH from the binary using "chrpath" or "patchelf"
    # > commands, after the build, but before the release. The /usr/local/lib is insecure and don't

    chrpath -r '$ORIGIN' "$pkgname-$pkgver/medivia"
}

package() {
    mkdir -p "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"

    cp -Rv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

    install -Dm644 "$srcdir/$pkgname.desktop"    "$pkgdir/usr/share/applications/$pkgname.desktop"

    # I am not sure this is a good way
    ln -s "/opt/$pkgname/medivia" "$pkgdir/usr/bin/$pkgname"
}
