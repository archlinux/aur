# Maintainer: Truong Vu <wanwan.vxt@gmail.com>

_pkgname=nirimod
pkgname=nirimod-git
pkgver=r66.d871327
pkgrel=1
pkgdesc='A visual, interactive configuration interface for the niri Wayland compositor'
arch=('any')
url='https://github.com/srinivasr/nirimod'
license=('MIT')

depends=(
    'gtk4'
    'libadwaita'
    'python'
    'python-gobject'
    'python-cairo'
    'hicolor-icon-theme'
    'sh'
    'niri'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)

provides=('nirimod')
conflicts=('nirimod')

source=("$_pkgname::git+https://github.com/srinivasr/nirimod.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/nirimod" <<EOF
#!/bin/sh
exec python -m nirimod "\$@"
EOF
    install -Dm644 "data/nirimod.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/io.github.nirimod.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=NiriMod
GenericName=Compositor Settings
Comment=GUI Configuration Manager for the Niri Wayland Compositor
Exec=nirimod
Icon=nirimod
Terminal=false
Type=Application
Categories=Utility;Settings;DesktopSettings;
Keywords=compositor;windowmanager;wayland;niri;settings;config;
StartupNotify=true
StartupWMClass=nirimod
EOF
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
