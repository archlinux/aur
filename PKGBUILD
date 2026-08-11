# Maintainer: Yash Yadav <yashdimpu@gmail.com>
pkgname=solanum-enhanced-git
pkgver=7.2.0.r0.g08f2ec6
pkgrel=1
pkgdesc="Pomodoro timer app for GNOME with enhanced multi-monitor, auto-start, and window features"
arch=('x86_64' 'aarch64')
url="https://github.com/OhYash/Solanum-gnome"
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'libadwaita'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
)
makedepends=(
    'git'
    'meson'
    'ninja'
    'rust'
    'blueprint-compiler'
    'pkgconf'
)
provides=('solanum')
conflicts=('solanum')
source=("git+https://github.com/OhYash/Solanum-gnome.git")
sha256sums=('SKIP')

pkgver() {
    cd Solanum-gnome
    # ArchWiki standard VCS revision counter fallback
    if git describe --tags --long >/dev/null 2>&1; then
        git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "7.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    # Production profile build per INSTALL.md guidelines
    arch-meson Solanum-gnome build \
        -Dprofile=default \
        --wrap-mode=nofallback
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}

