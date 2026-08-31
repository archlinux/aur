# Maintainer: dydydd <admin@lidream.cn>
# Co-Maintainer: NyaKang <CoderKang@hotmail.com>

pkgname=nyaterm-bin
pkgver=1.2.6
_pkgverfull=${pkgver}
pkgrel=1
pkgdesc="A modern, high-performance terminal workspace built with Tauri 2, React, and Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/nyakang/nyaterm"
license=('MIT')
options=(!debug)
depends=(
    bash
    cairo
    fontconfig
    gdk-pixbuf2
    glib2
    gtk3
    hicolor-icon-theme
    libayatana-appindicator
    libsoup3
    systemd-libs
    webkit2gtk-4.1
)
source=("LICENSE-MIT::$url/raw/v$_pkgverfull/LICENSE"
        "nyaterm.sh")
sha256sums=('baa8a0ccd4a43e998a0bd47172f03f548bcd0e8cb0f6689ca9ba8973b4d5ca49'
            'aa3c571e680b3023cb62778c9c15e80491abaf23bd794018be1801ef581b6d49')
sha256sums_x86_64=('6c414a9969440257f2b0107140a1e9be0a8e5b5708f189e013d464622cf026cb')
sha256sums_aarch64=('932d344c1e17c9be71b0a0c17d4bffc1983469354d64abc657ae2e16ba42e5ef')
source_x86_64=("$pkgname-$_pkgverfull-$CARCH.deb::$url/releases/download/v$_pkgverfull/NyaTerm_${_pkgverfull}_linux_x64.deb")
source_aarch64=("$pkgname-$_pkgverfull-aarch64.deb::$url/releases/download/v$_pkgverfull/NyaTerm_${_pkgverfull}_linux_arm64.deb")

package() {
    # Extract the contents of data.tar.gz into the pkgdir itself
    tar -xf data.tar.gz -C "$pkgdir"

    # Move binary to lib and wrap with a launcher that sets
    # WEBKIT_DISABLE_DMABUF_RENDERER=1 for Wayland compatibility
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    mv "$pkgdir/usr/bin/nyaterm" "$pkgdir/usr/lib/$pkgname/nyaterm"
    install -Dm755 "$srcdir/nyaterm.sh" "$pkgdir/usr/bin/nyaterm"

    # Fix empty Categories so launcher displays correctly in DE menus
    sed -i '/^Categories=/c\Categories=Network;TerminalEmulator;' \
        "$pkgdir/usr/share/applications/NyaTerm.desktop"

    # Install the license
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
