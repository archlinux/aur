# Maintainer: skydrome -at- protonmail

pkgname=scrcpy-git
pkgver=1.12.1.r10.g7bb9163
_pkgver=${pkgver%.r*}
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

source=("git+$url.git"
        "$url/releases/download/v$_pkgver/scrcpy-server-v$_pkgver")
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
        -D prebuilt_server="${srcdir}/scrcpy-server-v${_pkgver}" \
        build

    ninja -C build
}

package() {
    cd scrcpy/build

    DESTDIR="$pkgdir" ninja install
    install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
