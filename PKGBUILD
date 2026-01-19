# Maintainer: Rosalie Wanders <rosalie@mailbox.org>
_pkgname=rmg
pkgname=${_pkgname}-git
pkgver=git
pkgrel=2
pkgdesc="Rosalie's Mupen GUI"
arch=('x86_64' 'aarch64')
url="https://github.com/Rosalie241/${_pkgname}"
license=('GPL3')

provides=("$_pkgname")
conflicts=("$_pkgname")

depends=("libusb" "hidapi" "libsamplerate" "speexdsp" "minizip" "sdl3" "zlib" "freetype2" "qt6-base" "qt6-svg" "qt6-websockets")
makedepends=("git" "nasm" "cmake" "vulkan-headers")

source=("git+https://github.com/Rosalie241/${_pkgname}.git")
sha256sums=('SKIP')

pkgver()
{
    cd "$srcdir/$_pkgname"

    git describe --tags --always | sed -e 's|^v||;s|-|.|g'
}

prepare()
{
    mkdir -p "$srcdir/${_pkgname}/build"
}

build()
{
    cmake -S "$srcdir/${_pkgname}" -B "$srcdir/${_pkgname}/build" \
                -DCMAKE_BUILD_TYPE="Release" \
                -DPORTABLE_INSTALL="OFF" \
                -DCMAKE_INSTALL_PREFIX="/usr" \
                -G "Unix Makefiles"

    cmake --build "$srcdir/${_pkgname}/build"
}

package()
{
    cmake --install "$srcdir/${_pkgname}/build" --prefix="$pkgdir/usr"
}
