# Maintainer: Addison Snelling <addison@asnell.io>

pkgname=scrcpy-git
pkgver=1.4.r4.gb882322
pkgrel=1
pkgdesc='Display and control your Android device (development version)'
arch=('i686' 'x86_64')
url='https://github.com/Genymobile/scrcpy'
license=('Apache')
depends=('ffmpeg' 'sdl2')
makedepends=('gcc' 'meson' 'git')
optdepends=('android-tools: required if adb is not already installed')
source=("git+https://github.com/Genymobile/scrcpy.git"
        "https://github.com/Genymobile/scrcpy/releases/download/v${pkgver%.r*}/scrcpy-server-v${pkgver%.r*}.jar")
sha256sums=('SKIP'
            '1ff7a72fcfe81dadccfab9d6f86c971cd7c7f38f17196748fe05480e301b443d')
provides=("scrcpy")
conflicts=("scrcpy")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    rm -rf "$srcdir/build"
    meson \
        --prefix /usr \
        --buildtype release \
        --strip \
        -Db_lto=true \
        -Dprebuilt_server="${srcdir}/scrcpy-server-v${pkgver%.r*}.jar" \
        "$srcdir/build"
    ninja -C "$srcdir/build"
}

package() {
    DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
