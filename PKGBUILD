# Maintainer: Sergey A. <murlakatamenka@disroot.org>
# Contributor: Magnus Boman

_pkgname=replay-sorcery
pkgname=$_pkgname-git
pkgver=r245.7a7e0e5
pkgrel=1
pkgdesc='Open-source, instant-replay solution for Linux'
url='https://github.com/matanui159/ReplaySorcery'
arch=(x86_64 i686)
license=(GPL3)
depends=(ffmpeg libx11 gcc-libs)
optdependss=('pulseaudio: recording audio'
             'libdrm: listing kms devices')
makedepends=(git cmake)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git"
        'git+https://github.com/ianlancetaylor/libbacktrace.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule init
    git config submodule."dep/libbacktrace".url ../libbacktrace
    git submodule update
}

build() {
    cd "$_pkgname"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    cd "$srcdir/$_pkgname/build"

    install -Dm 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"

    install -Dm 644 $_pkgname.service -t "$pkgdir/usr/lib/systemd/user/"

    install -Dm 644 "../sys/$_pkgname.conf" "$pkgdir/usr/local/etc/$_pkgname.conf"
}
