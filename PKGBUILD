pkgname=fenriz-desktop-git
pkgver=0.1.11
pkgrel=1
pkgdesc="Desktop shell for Wayland compositors"
arch=('x86_64')
url="https://github.com/zackb/fenriz"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'glib2' 'wayland' 'polkit' 'wireplumber' 'pam')
makedepends=('cmake' 'ninja' 'git' 'wayland-protocols')
optdepends=('fenriz: the compositor this shell is built for'
            'fprintd: fingerprint unlock, see /usr/share/fenriz-desktop/pam'
            'xdg-desktop-portal: file chooser for the wallpaper picker')
provides=('fenriz-desktop')
conflicts=('fenriz-desktop' 'fenriz-desktop-bin')
backup=('etc/pam.d/fenriz-desktop')
source=("git+${url}.git")
sha256sums=('SKIP')

# the git source dir is named after the repo, not the package
pkgver() {
    cd fenriz
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S fenriz/desktop -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
