# Maintainer: Sergey A. <murlakatamenka@disroot.org>
# Contributor: Magnus Boman

_pkgname=replay-sorcery
pkgname=$_pkgname-git
pkgver=r113.9855d9d
pkgrel=1
pkgdesc="Open-source, instant-replay solution for Linux"
url="https://github.com/matanui159/ReplaySorcery"
arch=("i686" "x86_64")
license=(GPL3)
depends=(gcc-libs libxext)
makedepends=(git cmake nasm)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git"
        "git+https://github.com/libjpeg-turbo/libjpeg-turbo.git"
        "git+https://github.com/ianlancetaylor/libbacktrace.git"
        "git+https://code.videolan.org/videolan/x264.git"
        "git+https://github.com/lieff/minimp4.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule init
    git config submodule."dep/libjpeg-turbo".url ../libjpeg-turbo
    git config submodule."dep/libbacktrace".url ../libbacktrace
    git config submodule."dep/x264".url ../x264
    git config submodule."dep/minimp4".url ../minimp4
    git submodule update
}

build() {
    cd "$_pkgname"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd  "$srcdir/$_pkgname/build"

    install -Dm 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"

    install -Dm 644 $_pkgname.service -t "$pkgdir/usr/lib/systemd/user/"

    install -Dm 644 "../$_pkgname.default.conf" "$pkgdir/etc/xdg/$_pkgname.conf"
}
