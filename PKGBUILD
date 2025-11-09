# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail-bin
_name=${pkgname%-bin}
pkgver=1.10.1
pkgrel=1
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=('x86_64')
url='https://proton.me/mail'
license=('GPL-3.0-or-later')
options=('!strip')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'libcups'
    'libnotify'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'libxtst'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'xdg-utils'
)
makedepends=('libarchive')
optdepends=(
    'kde-cli-tools: file deletion support (kioclient5)'
    'libgnome-keyring'
    'lsb-release'
    'trash-cli: file deletion support (trash-put)'
)
provides=("$_name")
conflicts=("$_name")
source=("ProtonMail-$pkgver.deb::https://proton.me/download/mail/linux/$pkgver/ProtonMail-desktop-beta.deb")
sha512sums=('405ad9659153fdd5c426b4601a1f20138e5f4eacdf58524a2cefc0612d89fefd37265457bdef6b7da7bb223d7c17124e100703857c985b792d2528a7916f18a1')
b2sums=('6d3534e9743b444181bde5c2c9aa4037a6b2bca120df6f5b1457394ac542e18f379230412bc364c02e18d7d7d4ca6e9a0d572f13f5c089e8029f96c95e402048')

package() {
    bsdtar -xvf data.tar.xz -C "$pkgdir/"

    # Move main files to proper directory
    install -d "$pkgdir/opt/"
    mv "$pkgdir"/usr/lib/* "$pkgdir/opt"
    rm -rf "$pkgdir/usr/lib"

    # Fix permissions on misc files
    chmod go-w "$pkgdir"/opt/$_name/resources/*

    # Rename binary and replace symlink
    mv "$pkgdir/opt/$_name/Proton Mail Beta" "$pkgdir/opt/$_name/protonmail"
    ln -sf /opt/$_name/protonmail "$pkgdir/usr/bin/$_name"

    # Remove lintian folder
    rm -rf "$pkgdir/usr/share/lintian"
}
