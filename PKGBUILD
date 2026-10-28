# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=serein-bin
pkgver=1.0.0pre.nightly.20261028.68
# Upstream tags the same release without the pkgver prefix mangling.
_upver="${pkgver/pre./-}"
pkgrel=1
pkgdesc='Unofficial native Discord client (prebuilt binary)'
arch=('x86_64')
url='https://github.com/ViceVerse-cz/Serein'
license=('MIT' 'Apache-2.0')
# namcap calls dbus, the gst plugins, libxkbcommon-x11 and xdg-desktop-portal unneeded because
# they are dlopen'd at runtime: they carry voice, screen sharing and X11 input.
depends=('alsa-lib' 'dbus' 'glib2' 'glibc' 'gst-plugin-pipewire' 'gst-plugins-base'
         'gst-plugins-base-libs' 'gst-plugins-good' 'gstreamer' 'gtk4' 'hicolor-icon-theme'
         'libgcc' 'libpulse' 'libsoup3' 'libstdc++' 'libxkbcommon-x11' 'webkitgtk-6.0'
         'xdg-desktop-portal')
optdepends=(
    'gnome-keyring: Secret Service credential provider'
    'gst-libav: inline video'
    'gst-plugins-bad: hardware screen encoding'
    'xdg-desktop-portal-gtk: screen sharing and global shortcuts on GTK desktops'
    'xdg-desktop-portal-kde: screen sharing and global shortcuts on KDE Plasma'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
# Upstream's binary ships stripped; !strip keeps it byte-identical, since
# makepkg's strip rewrites it regardless.
options=('!strip' '!debug')

# Upstream ships a ready Arch package per nightly; repack it instead of rebuilding.
_asset="serein-v${_upver}-Linux-arch-serein-${pkgver}-1-${CARCH}.pkg.tar.zst"
source=("serein-${pkgver}-${CARCH}.pkg.tar.zst::${url}/releases/download/v${_upver}/${_asset}")
sha256sums=('6d3349d5265c72b04c621e3b40d99f36e45c4a266f98f860245bbf85d58e44c0')

latestver() {
    gh api repos/ViceVerse-cz/Serein/releases?per_page=10 \
        --jq '[.[].assets[].name | select(test("-Linux-arch-"))][0]' |
    sed -nE 's/.*-Linux-arch-serein-(.+)-[0-9]+-[^.]+\.pkg\.tar\.zst$/\1/p'
}

package() {
    cp -a --no-preserve=ownership usr "$pkgdir/"

    install -Dm644 usr/share/doc/serein/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
