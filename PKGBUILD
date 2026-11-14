# Maintainer: Mikhail Velichko <efklid@gmail.com>
# Contributor: Lolka Team <support@lolka.app>

pkgname=lolka-x-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Lolka X - chat, voice and screen sharing desktop client'
arch=('x86_64')
url='https://lolka.app'
license=('custom')
# Qt and FFmpeg are bundled; list only external runtime requirements here.
depends=(
    'glibc' 'gcc-libs' 'glib2' 'dbus' 'gtk3'
    'fontconfig' 'freetype2' 'krb5' 'zlib'
    'libglvnd' 'mesa' 'libpulse'
    'libx11' 'libxi' 'libxext' 'libxtst'
    'libxkbcommon' 'libxkbcommon-x11'
    'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm'
    'openssl' 'xdg-utils'
)
provides=('lolka-x' 'lolka' 'lolka-bin')
conflicts=('lolka-x' 'lolka' 'lolka-bin')
# Preserve upstream's prebuilt libraries and avoid generating a debug package.
options=('!strip' '!debug')

source=("https://cdn.lolka.app/desktop/linux/${pkgver}/lolka-x_${pkgver}_amd64.deb")
sha256sums=('dc91b08a359ed0cb777dd81d3de9857d30670a4003af54a2886fc9324577021d')

prepare() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$srcdir"
}

package() {
    cp -a --no-preserve=ownership "$srcdir/opt" "$srcdir/usr" "$pkgdir/"

    # Package the launcher link directly; Debian's update-alternatives is unused.
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/lolka-x/bin/lolka-x "$pkgdir/usr/bin/lolka-x"

    # Keep bundled dependency notices accessible through the standard location.
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    cp -a --no-preserve=ownership "$srcdir/opt/lolka-x/share/doc/LolkaDesktop/licenses/." \
        "$pkgdir/usr/share/licenses/$pkgname/"
}
