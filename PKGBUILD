# Maintainer: skydrome -at- protonmail

pkgname=scrcpy-git
pkgver=1.17.r3.ged130e0
pkgrel=1
pkgdesc='Display and control your Android device (development version)'
arch=('i686' 'x86_64')
url='https://github.com/Genymobile/scrcpy'
license=('Apache')
depends=('ffmpeg' 'sdl2')
makedepends=('meson' 'git')
optdepends=('android-tools: required if adb is not already installed')
provides=("scrcpy")
conflicts=("scrcpy")
noextract=("scrcpy-server"*)

# Get latest tagged version
_pkgver="$(curl -qILs -o /dev/null -w %{url_effective} "$url/releases/latest")"
_pkgver="${_pkgver##*/}"

source=("git+$url.git"
        "$url/releases/download/$_pkgver/scrcpy-server-$_pkgver")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd scrcpy
    git describe |sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd scrcpy
    rm -rf build

    arch-meson \
        -D prebuilt_server="${srcdir}/scrcpy-server-${_pkgver}" \
        build

    ninja -C build
}

package() {
    cd scrcpy/build

    DESTDIR="$pkgdir" ninja install
    install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
