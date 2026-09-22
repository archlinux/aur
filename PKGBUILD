# Maintainer: Haven Software <havensoftware@zohomail.com>
pkgname=haven-desktop-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Matrix chat and social client, built on Element Web/Desktop (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Haven-Organization/haven-desktop"
license=('AGPL-3.0-only')
provides=('haven-desktop')
conflicts=('haven-desktop')
options=('!strip' '!debug')
depends=(
    'gtk3'
    'nss'
    'libxss'
    'libnotify'
    'libayatana-appindicator'
    'alsa-lib'
    'at-spi2-core'
    'libsecret'
    'c-ares'
    'libevent'
    'libvpx'
    'libxslt'
    're2'
    'snappy'
)
source=("https://github.com/Haven-Organization/haven-desktop/releases/download/haven-v${pkgver}/haven-desktop-${pkgver}.pacman"
        "LICENSE::https://raw.githubusercontent.com/Haven-Organization/haven-desktop/haven-v${pkgver}/LICENSE")
sha256sums=('797caab7c7810d4acc208aa507418ccce9870fd70075f80eb378261fcac1c356'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
install=haven-desktop-bin.install

package() {
    cd "$srcdir"
    # Upstream already ships this as a real pacman package (built by electron-builder's
    # fpm-based pacman target) - re-extract just the file payload rather than its own
    # .PKGINFO/.MTREE/.BUILDINFO/.INSTALL, and let makepkg regenerate correct metadata
    # from this PKGBUILD instead. Its own depends list is fpm's generic Debian-style
    # default (some names like http-parser/libappindicator-gtk3 don't exist as such on
    # Arch) - hand-curated above instead, based on what other Electron AUR packages use.
    bsdtar -xf "haven-desktop-${pkgver}.pacman" -C "$pkgdir" --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO' --exclude='.INSTALL'

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
