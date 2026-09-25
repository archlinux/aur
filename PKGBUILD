# Maintainer: Xuruh <admin@jorvik.app>

pkgname=jorvik-bin
_pkgname=jorvik
pkgver=1.0.13
pkgrel=1
pkgdesc="Self-hosted Matrix client built to feel like Discord"
arch=('x86_64')
url="https://github.com/jorvikapp/jorvik"
license=('AGPL-3.0-only')
# Translated from the upstream .deb's Depends. libuuid1 is util-linux-libs on
# Arch, and libxss1/libxtst6 are libxss/libxtst.
depends=('gtk3' 'nss' 'libnotify' 'libxss' 'libxtst' 'at-spi2-core' 'libsecret'
         'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon on desktops using AppIndicator')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
install="$pkgname.install"
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/Jorvik-$pkgver.deb")
sha256sums=('b6acdc4d3c7b8ab2e6558d806f19e560377dfd213a2828ccd07523bb94bda515')
# makepkg does not understand .deb, so unpack it by hand in package().
noextract=("$_pkgname-$pkgver.deb")

package() {
    bsdtar -xf "$_pkgname-$pkgver.deb" -C "$srcdir" data.tar.xz
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    # Upstream ships the launcher only under /opt; Debian's postinst makes this
    # symlink through update-alternatives, which Arch has no equivalent for.
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/Jorvik/jorvik "$pkgdir/usr/bin/$_pkgname"

    # A Debian changelog is not something an Arch package should carry.
    rm -rf "$pkgdir/usr/share/doc"

    # Electron's setuid sandbox helper. Left 0755 here and fixed in .install,
    # because a setuid bit inside a package is a footgun if the file is ever
    # replaced; see the comment there.
    chmod 0755 "$pkgdir/opt/Jorvik/chrome-sandbox"
}
