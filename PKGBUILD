# Maintainer: alphabitserial <alphabitserial at pm dot me> (just the patch file)
# Maintainer: Rosalie Wanders <rosalie@mailbox.org> (rmg-git maintainer)
_pkgname=rmg
pkgname=${_pkgname}-romhacks-git
pkgver=0.5.7.4.gbc7efed
pkgrel=1
pkgdesc="Rosalie's Mupen GUI"
arch=('x86_64')
url="https://github.com/Rosalie241/${_pkgname}"
license=('GPL3')

provides=("$_pkgname")
conflicts=("$_pkgname" "rmg-git")

depends=("hidapi" "libsamplerate" "speexdsp" "minizip" "sdl2" "zlib" "freetype2" "qt6-base" "qt6-svg" "xdg-user-dirs")
makedepends=("git" "pkg-config" "nasm" "cmake" "ninja")

source=("git+https://github.com/Rosalie241/${_pkgname}.git"
        "raise-maximum-rom-size-limit.patch")
sha256sums=('SKIP'
            'b9e61634beb6153d308cf7b2c5a476105775467708f82bb288b50771999dae1b')

pkgver()
{
    cd "$_pkgname"

    git describe --tags --always | sed -e 's|^v||;s|-|.|g'
}

prepare()
{
    mkdir -p "$srcdir/${_pkgname}/build"
    patch --directory="$srcdir/${_pkgname}" --forward --strip=1 --input="$srcdir/raise-maximum-rom-size-limit.patch"
}

build()
{
    cmake -S "$srcdir/${_pkgname}" -B "$srcdir/${_pkgname}/build" \
                -DCMAKE_BUILD_TYPE="Release" \
                -DPORTABLE_INSTALL="OFF" \
                -DNO_RUST="ON" \
                -DCMAKE_INSTALL_PREFIX="/usr" \
                -G "Ninja"

    cmake --build "$srcdir/${_pkgname}/build"
}

package()
{
    cmake --install "$srcdir/${_pkgname}/build" --prefix="$pkgdir/usr"
}
