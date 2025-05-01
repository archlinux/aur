# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=wshowkeys-mao-git
_pkgname=wshowkeys
pkgver=r32.24364e5
pkgrel=1
pkgdesc='Displays keys being pressed on a Wayland session for DreamMaoMao fork'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/DreamMaoMao/wshowkeys'
license=('GPL')
depends=('cairo' 'pango' 'libinput' 'libxkbcommon' 'wayland')
makedepends=('git' 'meson' 'wayland-protocols')
provides=('wshowkeys')
conflicts=('wshowkeys' 'wshowkeys-git')
source=("$_pkgname::git+https://github.com/DreamMaoMao/wshowkeys")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    mkdir build
    arch-meson build $_pkgname
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    chmod a+s $pkgdir/usr/bin/wshowkeys
}
