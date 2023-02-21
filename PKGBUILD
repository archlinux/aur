# Maintainer: scorpion-26 <dev dot scorpion26 at gmail dot com>

_pkgname=gBar
pkgname=gbar-git
pkgver=r53.3d2129c
pkgrel=1
# I currently can't test any other arch, so only specify x64
arch=('x86_64')
pkgdesc='Blazingly fast status bar written with GTK'
url='https://github.com/scorpion-26/gBar'
source=("$_pkgname::git+$url")
license=('MIT')
depends=('gtk-layer-shell' 'pulseaudio')
optdepends=('bluez-utils: Bluetooth support' 'hyprland: Workspace widgets' 'nvidia-utils: Nvidia GPU support')
makedepends=('git' 'meson' 'ninja' 'gcc')
provides=('gbar')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# 'meson setup build' should only be called once, so call it here
prepare() {
    cd "$_pkgname"
    meson setup build -Dbuildtype=release -Dprefix=/usr
}

build() {
    cd "$_pkgname"
    ninja -C build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
    # TODO: Install default config into /usr/share (not supported by)
}
