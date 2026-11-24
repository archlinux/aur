# Maintainer: novesce <120620395+novesce@users.noreply.github.com>
pkgname=liney-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Unofficial LINE desktop client for Linux, packaged from the upstream Liney release'
arch=('x86_64')
url='https://github.com/Cytech-Team/Liney'
license=('LicenseRef-TLL-1.0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
         'gtk3' 'libcups' 'libgcc' 'libnotify' 'libpipewire' 'libsecret'
         'libstdc++' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
         'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa'
         'nspr' 'nss' 'pango' 'systemd-libs' 'util-linux-libs' 'wayland' 'xdg-utils')
optdepends=('gnome-keyring: persist credentials using Secret Service'
            'kwallet: persist credentials using KDE Wallet'
            'libayatana-appindicator: tray integration on supported desktops'
            'xdg-desktop-portal: screen sharing on supported desktops')
provides=("liney=$pkgver")
conflicts=('liney')
options=('!strip' '!debug')
_deb="Liney-${pkgver}-amd64.deb"
_license="Liney-${pkgver}-LICENSE"
source=("$url/releases/download/v$pkgver/$_deb"
        "$_license::https://raw.githubusercontent.com/Cytech-Team/Liney/v$pkgver/LICENSE")
sha256sums=('f69890f6e9bb7db9169a2586b1b10583920018e2c58caa059b847819b02f0f2f' '9f0db73b7644a3628dcc9cf4728ce2a098b598a967a55a3988c750f78586fb0f')
noextract=("$_deb")

package() {
    local archive
    set -o pipefail
    archive=$(bsdtar -tf "$srcdir/$_deb" | grep -Ex 'data\.tar\.(xz|gz|zst)')
    bsdtar -xOf "$srcdir/$_deb" "$archive" |
        bsdtar --no-same-owner --no-acls --no-xattrs --no-fflags -xf - -C "$pkgdir" \
            ./opt/Liney ./usr/share/applications/dev.cytechteam.liney.desktop \
            ./usr/share/icons/hicolor ./usr/share/doc/liney

    install -d "$pkgdir/usr/bin"
    ln -s ../../opt/Liney/liney "$pkgdir/usr/bin/liney"
    # Arch enables unprivileged user namespaces for Chromium's sandbox.
    chmod 0755 "$pkgdir/opt/Liney/chrome-sandbox"
    install -Dm644 "$srcdir/$_license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    printf 'Unofficial Arch packaging of the upstream Liney binary.\nCorresponding source: %s/archive/refs/tags/v%s.tar.gz\n' \
        "$url" "$pkgver" > "$pkgdir/usr/share/doc/liney/arch-package.txt"
}
