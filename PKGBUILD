# Maintainer: Sergey A. <murlakatamenka@disroot.org>
# Contributor: Magnus Boman

_pkgname=replay-sorcery
pkgname=$_pkgname-git
pkgver=r282.d8d5921
pkgrel=2
pkgdesc='Open-source, instant-replay solution for Linux'
url='https://github.com/matanui159/ReplaySorcery'
arch=(x86_64 i686)
license=(GPL3)
depends=(ffmpeg libx11 gcc-libs)
optdepends=('pulseaudio: recording audio'
             'libdrm: listing kms devices')
makedepends=(git cmake)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git"
        'git+https://github.com/ianlancetaylor/libbacktrace.git'
        '0000-include-avutil-ch-layout.patch')
sha256sums=('SKIP'
            'SKIP'
            '5404e7d26db1eb8e051844d65c2182f9dfac813243d093ea8e4c4ae97bc548da')

pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"

    git submodule init
    git config submodule."dep/libbacktrace".url ../libbacktrace
    git -c protocol.file.allow=always submodule update

    git apply ${srcdir}/0000-include-avutil-ch-layout.patch
}

build() {
    cd "$_pkgname"

    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    cd "$_pkgname"

    DESTDIR=${pkgdir} make -C build install
}
