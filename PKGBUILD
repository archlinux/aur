# Maintainer: TaintedAngel <lordmaxking42@gmail.com>
pkgname=linuxshot-git
pkgver=1.0.0
pkgrel=1
pkgdesc="ShareX-inspired screenshot and upload tool for Linux"
arch=('any')
url="https://github.com/TaintedAngel/linuxshot"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.10'
    'python-pillow'
    'python-requests'
    'python-gobject'
    'python-pyside6'
    'python-dbus'
    'libnotify'
)
optdepends=(
    'spectacle: KDE Plasma screenshot backend'
    'grim: wlroots screenshot capture'
    'slurp: wlroots region selection'
    'wl-clipboard: Wayland clipboard support'
    'maim: X11 screenshot capture'
    'xdotool: X11 window detection'
    'xclip: X11 clipboard support'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("git+https://github.com/TaintedAngel/linuxshot.git")
sha256sums=('SKIP')

pkgver() {
    cd linuxshot
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || echo "$pkgver"
}

build() {
    cd linuxshot
    python -m build --wheel --no-isolation
}

package() {
    cd linuxshot
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install desktop file, autostart, and icon
    install -Dm644 resources/linuxshot.desktop "$pkgdir/usr/share/applications/linuxshot.desktop"
    install -Dm644 resources/icons/linuxshot.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/linuxshot.svg"
}
