# Maintainer: David Xu <xuwd1@hotmail.com>

# Huge thanks to:
# Maintainer of package wemeet-bin: sukanka
# Contributor of package wemeet-bin: Sam L. Yes

_pkgname=wemeet-wayland-screenshare
pkgname=wemeet-wayland-screenshare-git
provides=('wemeet-wayland-screenshare')
pkgver=3.19.2.400_hooked.r56.g7f33896
pkgrel=1
pkgdesc='Hooked wemeet that enables screenshare on Wayland. 实现Wayland下腾讯会议屏幕共享.'
arch=('x86_64')
license=('MIT')
url="https://github.com/xuwd1/wemeet-wayland-screenshare"
source=(
    'git+https://github.com/xuwd1/wemeet-wayland-screenshare.git'
    'wemeet-wayland-screenshare.sh'
    'wemeetapp-wayland-screenshare.desktop'
)
sha1sums=(
    'SKIP'
    '2932140a95db996285d3415f353200e199fbe7ee'
    '59ebf686c5b80ac96fce8a58bee2b8ae28d9aa78'
)
depends=(
    'wemeet-bin'
    'wireplumber'
    'libportal'
    'xdg-desktop-portal'
    'xdg-desktop-portal-impl'
    'qt5-wayland'
    'opencv'
    'libxrandr'
)
optdepends=(
    'xwaylandvideobridge: legacy xwaylandvideobridge dependency, in case it is needed on some DEs'
)
makedepends=(
    'cmake'
    'git'
)

_starter="wemeet-wayland-screenshare.sh"
_libhook="libhook.so"
_desktop_entry_file="wemeetapp-wayland-screenshare.desktop"

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "3.19.2.400_hooked.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_pkgname"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    install -Dm755 "$srcdir/$_starter" "$pkgdir/usr/bin/wemeet-wayland-screenshare"
    install -Dm755 "$srcdir/$_pkgname/build/$_libhook" "$pkgdir/usr/lib/wemeet/$_libhook"
    mkdir -p $pkgdir/usr/share/applications
    install -Dm644 "$srcdir/$_desktop_entry_file" "$pkgdir/usr/share/applications/$_desktop_entry_file"
}
