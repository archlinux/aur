# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki/>
# Contributor: leper <blubblub@mail.ru>
# shellcheck disable=SC2034,2154,2148

pkgname=smokinguns-git
_pkgname=${pkgname%-git}
pkgver=1.1.r859.gf5d9ecf2
pkgrel=8
pkgdesc='A semi-realistic simulation of the old west great atmosphere built on id Tech 3.'
url="https://www.smokin-guns.org"
arch=('i686' 'x86_64')
license=('GPL2')
changelog=.CHANGELOG
depends=('freetype2' 'hicolor-icon-theme' 'libgl' 'libjpeg-turbo' 'libogg' 'sdl' 'speex' 'zlib')
makedepends=('git' 'glu' 'openal')
conflicts=('smokinguns-bin' 'smokinguns' 'smokinguns-data')
provides=('smokinguns-data' 'smokinguns')
source=("$pkgname::git+https://github.com/smokin-guns/SmokinGuns.git"
        "$pkgname.data.zip::https://www.smokin-guns.org/downloads/Smokin_Guns_1.1.zip"
        "$pkgname.desktop"
        "$pkgname-#11-build-fail.patch")
sha512sums=('SKIP'
            '51954ce00cccd9eb95a10491f0fcdea2d024058da11cbda7ee56c6369e8bc101d89ed95549cf4255393c3e1bec4585be12937e7ed7b20ff4cc0ce96685a5ce72'
            '37aefb4a9e811644af09bbbfdb35d6a2572bc70b6fe8ff0078330d1070e73ebcd18f2e656156f1e3d92b2ec7f6fdffe63b2c66018b449d8b5aa6402b3eb24d7d'
            '4ad6e8c1775ccce791810349febfbcc9235bb4cc1310d0b5eb61ea522558c32457e192ab1b9860215d72441c708638cfa845af56e4749a0bfeecaa5bf120d051')

pkgver() {
    cd "$pkgname" || exit
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname" || exit
    {
        # Set basedir
        echo "DEFAULT_BASEDIR = /usr/share/$_pkgname"

        # Use system libraries
        echo "USE_INTERNAL_ZLIB=0"
        echo "USE_INTERNAL_JPEG=0"
        echo "USE_INTERNAL_SPEEX=0"
        echo "USE_INTERNAL_OPUS=1"
        echo "USE_INTERNAL_OGG=0"

        # Use system headers
        echo "USE_LOCAL_HEADERS=0"

    } >> "Makefile.local"

    # https://github.com/smokin-guns/SmokinGuns/issues/11
    patch --forward --strip=1 --input="$srcdir/$pkgname-#11-build-fail.patch"
}

build() {
    cd "$pkgname" || exit
    make
}

package() {
    install -Dm 644 "$pkgname.desktop" \
                    "$pkgdir/usr/share/applications/$_pkgname.desktop"

    cd "Smokin' Guns 1.1" || exit

    install -d "$pkgdir/usr/share/$_pkgname/baseq3"
    install -m 644 baseq3/* "$pkgdir/usr/share/$_pkgname/baseq3"
    install -d "$pkgdir/usr/share/$_pkgname/$_pkgname"
    install -m 644 "$_pkgname"/* "$pkgdir/usr/share/$_pkgname/$_pkgname"

    cd "$srcdir/$pkgname" || exit

    SUFFIX=${CARCH//i686/i386}
    install -Dm 755 "build/release-linux-$SUFFIX/$_pkgname.$SUFFIX" \
                    "$pkgdir/usr/bin/$_pkgname"

    install -Dm 755 "build/release-linux-$SUFFIX/${_pkgname}_dedicated.$SUFFIX" \
                    "$pkgdir/usr/bin/${_pkgname}_dedicated"

    install -Dm 644 "build/release-linux-$SUFFIX/renderer_opengl1_$SUFFIX.so" \
                    "$pkgdir/usr/share/$_pkgname"

    install -Dm 644 "build/release-linux-$SUFFIX/renderer_opengl2_$SUFFIX.so" \
                    "$pkgdir/usr/share/$_pkgname"

    install -Dm 644 "misc/$_pkgname.png" \
                    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
