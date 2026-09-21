pkgname=fenriz-bar-git
pkgver=0.1.18
pkgrel=1
pkgdesc="Status bar for Wayland compositors"
arch=('x86_64')
url="https://github.com/zackb/fenriz"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'glib2' 'json-glib' 'wayland' 'wireplumber' 'libnm')
makedepends=('cmake' 'ninja' 'git' 'wayland-protocols')
optdepends=('fenriz: the compositor this bar is built for'
            'fenriz-desktop: shared config and theme'
            'networkmanager: wifi'
            'bluez: bluetooth'
            'upower: battery'
            'wf-recorder: screen recording')
provides=('fenriz-bar')
conflicts=('fenriz-bar' 'fenriz-bar-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

# the git source dir is named after the repo, not the package
pkgver() {
    cd fenriz
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

# bar compiles sources from ../desktop, so it builds from the full checkout
build() {
    cmake -B build -S fenriz/bar -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
