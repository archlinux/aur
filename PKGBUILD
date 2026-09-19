# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
_upver='1.0.0-nightly.20260918.39'
pkgname='serein'
pkgver="${_upver/-/pre.}"
pkgrel=1
pkgdesc='Unofficial native Discord client'
arch=('x86_64')
url='https://github.com/ViceVerse-cz/Serein'
license=('MIT' 'Apache-2.0')
depends=(
    'alsa-lib'
    'dbus'
    'glib2'
    'glibc'
    'gst-plugin-pipewire'
    'gst-plugins-base'
    'gst-plugins-base-libs'
    'gst-plugins-good'
    'gstreamer'
    'gtk4'
    'hicolor-icon-theme'
    'libgcc'
    'libpulse'
    'libsoup3'
    'libstdc++'
    'libxkbcommon-x11'
    'webkitgtk-6.0'
    'xdg-desktop-portal'
)
makedepends=('cmake' 'desktop-file-utils' 'git' 'pkgconf' 'python' 'rust')
optdepends=(
    'gnome-keyring: Secret Service credential provider'
    'gst-plugins-bad: hardware screen encoding'
    'gst-libav: inline video'
    'xdg-desktop-portal-gtk: screen sharing and global shortcuts on GTK desktops'
    'xdg-desktop-portal-kde: screen sharing and global shortcuts on KDE Plasma'
)
options=('!debug' '!lto')
source=("$pkgname::git+$url.git#tag=v$_upver")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    python3 .github/release/version.py "$_upver"
}

build() {
    cd "$srcdir/$pkgname"
    rm -rf -- dist
    cargo xtask package --format dir
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir"
    cp -a -- dist/linux-root/usr "$pkgdir/"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE-MIT LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/"
}
