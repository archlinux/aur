# Maintainer: initMayday <initMayday@protonmail.com>
# GIT DEV branch package

_pkgname="dinit-user-spawn"
pkgname="$_pkgname-dev-git"
pkgrel=1
pkgver=r9.fcdca67
pkgdesc='Launches a user process dinit for you on login'
arch=('any')
url='https://github.com/initMayday/dinit-user-spawn.git'
makedepends=('meson' 'git')
depends=('tomlplusplus')
provides=("$_pkgname")
conflicts=("$_pkgname")
license=('AGPL-3.0-or-later')
source=("$_pkgname::git+$url#branch=dev")
sha256sums=('SKIP')
builddir='build-release'

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    meson setup "$builddir" --prefix=/usr
    meson compile -C "$builddir"
}

package() {
    cd "$_pkgname"
    meson install -C "$builddir" --destdir="$pkgdir"
    install -Dm644 "dinit-user-spawn.service" "$pkgdir/usr/lib/dinit.d/dinit-user-spawn"
    echo "RUN:"
    echo "dinitctl enable dinit-user-spawn"
    echo "as root, to enable this service"
}
