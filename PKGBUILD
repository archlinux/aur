# Maintainer: Yuta Katayama <8683947+yutkat@users.noreply.github.com>
#
# This package installs the nightly build of WezTerm from the official GitHub releases.
# The nightly build is updated daily, so each installation may get a different version.
# SHA256 is set to SKIP because the file content changes daily while the URL remains the same.
#
pkgname=wezterm-nightly-bin
pkgver=nightly
pkgrel=1
pkgdesc="A GPU-accelerated cross-platform terminal emulator and multiplexer (nightly build)"
arch=('x86_64')
url="https://wezfurlong.org/wezterm/"
license=('MIT')
depends=('fontconfig' 'hicolor-icon-theme' 'libxkbcommon' 'libxkbcommon-x11' 'ttf-font' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-wm')
optdepends=('python-nautilus: for Nautilus integration')
provides=('wezterm')
conflicts=('wezterm' 'wezterm-git')
source=("wezterm-nightly.Ubuntu24.04.tar.xz::https://github.com/wezterm/wezterm/releases/download/nightly/wezterm-nightly.Ubuntu24.04.tar.xz")
sha256sums=('SKIP')

pkgver() {
    # Use current date as version for nightly builds
    date +%Y%m%d
}

package() {
    cd "$srcdir/wezterm"

    # Install binaries
    install -Dm755 usr/bin/wezterm "$pkgdir/usr/bin/wezterm"
    install -Dm755 usr/bin/wezterm-gui "$pkgdir/usr/bin/wezterm-gui"
    install -Dm755 usr/bin/wezterm-mux-server "$pkgdir/usr/bin/wezterm-mux-server"
    install -Dm755 usr/bin/strip-ansi-escapes "$pkgdir/usr/bin/strip-ansi-escapes"
    install -Dm755 usr/bin/open-wezterm-here "$pkgdir/usr/bin/open-wezterm-here"

    # Install desktop file
    install -Dm644 usr/share/applications/org.wezfurlong.wezterm.desktop \
        "$pkgdir/usr/share/applications/org.wezfurlong.wezterm.desktop"

    # Install icons
    install -Dm644 usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png"

    # Install shell completions
    install -Dm644 usr/share/bash-completion/completions/wezterm \
        "$pkgdir/usr/share/bash-completion/completions/wezterm"

    install -Dm644 usr/share/zsh/functions/Completion/Unix/_wezterm \
        "$pkgdir/usr/share/zsh/site-functions/_wezterm"

    # Install metainfo
    install -Dm644 usr/share/metainfo/org.wezfurlong.wezterm.appdata.xml \
        "$pkgdir/usr/share/metainfo/org.wezfurlong.wezterm.appdata.xml"

    # Install Nautilus extension
    install -Dm644 usr/share/nautilus-python/extensions/wezterm-nautilus.py \
        "$pkgdir/usr/share/nautilus-python/extensions/wezterm-nautilus.py"

    # Install profile script
    install -Dm644 etc/profile.d/wezterm.sh \
        "$pkgdir/etc/profile.d/wezterm.sh"

    # Install wezterm data directory (if exists)
    if [ -d usr/share/wezterm ]; then
        cp -r usr/share/wezterm "$pkgdir/usr/share/"
    fi
}
