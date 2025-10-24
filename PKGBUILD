# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail-bin
_name=${pkgname%-bin}
pkgver=1.9.1
pkgrel=2
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=('x86_64')
url='https://proton.me'
license=('GPL-3.0-or-later')
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
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
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
source=("ProtonMail-desktop-beta-$pkgver.deb::$url/download/mail/linux/$pkgver/ProtonMail-desktop-beta.deb")
sha512sums=('8f78db0707e3f1f0cd8ad259891840f88027c56b347c7526e8283576a997cef543c8014569aaf774f444e0d714bcd6e54a5c48171553384368c38cec4cf94e5b')
b2sums=('988589cc10a8130e1d80e5888557791cbaa9e881b4f21979fec5d472b3f9770b03065416f962e68ade25263246b498b8d4822e8751eca90ac5a512b94e736bf9')

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
