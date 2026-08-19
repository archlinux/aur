# Maintainer: Yutao Fang <happystraw@outlook.com>

pkgname=keywisp-git
_pkgname=keywisp
pkgver=0.1.1.r0.g43f339d
pkgrel=1
pkgdesc='A small Wayland keystroke visualizer'
arch=('x86_64' 'aarch64')
url='https://github.com/happystraw/keywisp'
license=('MIT')
depends=('cairo' 'pango' 'libinput' 'libxkbcommon' 'wayland')
makedepends=('git' 'zig' 'wayland-protocols')
provides=('keywisp')
conflicts=('keywisp')
source=("$_pkgname::git+https://github.com/happystraw/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    zig build -Doptimize=ReleaseSafe --prefix "$srcdir/artifacts"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "$srcdir/artifacts/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
