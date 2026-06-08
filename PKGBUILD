# Maintainer: dydydd <admin@lidream.cn>

pkgname=nyaterm-bin
pkgver=1.1.5
_rel=beta.2
pkgverfull=${pkgver}-${_rel}
pkgrel=1
pkgdesc="A modern, high-performance terminal workspace built with Tauri 2, React, and Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/nyakang/nyaterm"
license=('MIT')
depends=(
    cairo
    gdk-pixbuf2
    gtk3
    hicolor-icon-theme
    libayatana-appindicator
    libsoup3
    webkit2gtk-4.1
)
source=("LICENSE-MIT::$url/raw/v$pkgverfull/LICENSE"
        "nyaterm.sh")
sha256sums=('baa8a0ccd4a43e998a0bd47172f03f548bcd0e8cb0f6689ca9ba8973b4d5ca49'
            'aa3c571e680b3023cb62778c9c15e80491abaf23bd794018be1801ef581b6d49')
sha256sums_x86_64=('c7f05805ec80c2155b46607434a0d91a6ffacaa17b3e57eb66855553c6e24806')
sha256sums_aarch64=('e950b3c1461c8aab77bc854a815579e15ed936b3e43e3cd64e4ee0f3b0de41ba')
source_x86_64=("$pkgname-$pkgverfull-x86_64.deb::$url/releases/download/v$pkgverfull/NyaTerm_${pkgverfull}_linux_x64.deb")
source_aarch64=("$pkgname-$pkgverfull-aarch64.deb::$url/releases/download/v$pkgverfull/NyaTerm_${pkgverfull}_linux_arm64.deb")

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
