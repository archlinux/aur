_tag=$(curl --silent "https://api.github.com/repos/skyebrowser/skye/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
pkgname=skye-bin
pkgver=${_tag:1}
pkgrel=1
pkgdesc="Modern and feature-rich web browser based on Electron - Powered by Innatical"
arch=("x86_64")
url="https://skye.innatical.com/"
license=("GPL3")
provides=("skye")
depends=(
    "c-ares"
    "ffmpeg"
    "gtk3"
    "http-parser"
    "libevent"
    "libvpx"
    "libxslt"
    "libxss"
    "minizip"
    "nss"
    "re2"
    "snappy"
    "libnotify"
    "libappindicator-gtk3"
)
makedepends=(
    "curl"
    "grep"
)
source=(
    "skye-$pkgver.pacman::https://github.com/skyebrowser/skye/releases/download/$_tag/skye-$pkgver.pacman"
)
sha256sums=("SKIP")

package() {
    cd "$srcdir"
    tar xvf skye-${pkgver}.pacman -C "$pkgdir"
    rm -f "$pkgdir"/.PKGINFO "$pkgdir"/.MTREE $pkgdir/.INSTALL
}

post_install() {
    # Link to the binary
    ln -sf '/opt/Skye/skye' '/usr/bin/skye'

    # SUID chrome-sandbox for Electron 5+
    chmod 4755 '/opt/Skye/chrome-sandbox' || true

    update-mime-database /usr/share/mime || true
    update-desktop-database /usr/share/applications || true
}

post_remove() {
    # Delete the link to the binary
    rm -f '/usr/bin/skye'
}
