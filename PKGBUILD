# Maintainer: scorpion-26 <dev dot scorpion26 at gmail dot com>

_pkgname=gBar
pkgname=gbar-git
pkgver=r221.d3f46bc
pkgrel=1
# Architectures which are atleast confirmed to somewhat work.
arch=('x86_64' 'aarch64')
pkgdesc='Blazingly fast status bar written with GTK'
url='https://github.com/scorpion-26/gBar'
source=("$_pkgname::git+$url")
license=('MIT')
depends=('gtk-layer-shell' 'pulseaudio' 'libdbusmenu-gtk3' 'pamixer' 'libsass')
optdepends=('bluez-utils: Bluetooth support'
            'hyprland: Workspace widgets'
            'nvidia-utils: Nvidia GPU support'
            'pacman-contrib: Arch update checking')
makedepends=('git' 'meson' 'ninja' 'gcc' 'pkgconf')
provides=('gbar')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# 'meson setup build' should only be called once, so call it here
prepare() {
    cd "$_pkgname"
    git submodule update --init
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
    # TODO: Install default config into /usr/share (not supported by gBar)
}
