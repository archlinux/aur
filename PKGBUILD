# Maintainer: 67mustard41 (current), MojArch (previous)
pkgname=opera-gx-stable
pkgver=129.0.5823.64
pkgrel=4
pkgdesc='Its finally here on Linux! Opera GX is the browser built specifically for gamers.'
arch=('x86_64')
url='https://www.opera.com/browser/'
license=('custom:opera')
provides=('opera-gx-stable' 'www-browser')
conflicts=('opera')
replaces=('opera')
depends=(
    'alsa-lib'
    'atk'
    'at-spi2-atk'
    'at-spi2-core'
    'cairo'
    'cups'
    'curl'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gnupg'
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
    'qt5-base'
    'systemd-libs'
    'cairo'
)
optdepends=(
    'opera-gx-stable-ffmpeg-codecs-bin'
)

_baseurl="https://get.opera.com/pub/opera_gx/${pkgver}/linux"
_debfile="${pkgname}_${pkgver}_amd64.deb"

source=(
    "${_baseurl}/${_debfile}"
    "opera"
    "default"
)

# Updated Integrity checks for version 129.0.5823.64
sha256sums=('f084698cb9bb99f45a6eaf4436d4357d8531659422b296dc87c7cbca40c10fa1'
            '49af89cd980519b256033fc6175ec5773570bcdee234f816ac813596d004ac45'
            '99fc0d2822edd14e234d451995db47148125e4580221a292598959421d131231')

prepare() {
    sed -e "s/%pkgname%/$pkgname/g" \
        -e "s/%operabin%/$pkgname\/opera/g" \
        -i "$srcdir/opera"
}

package() {
    bsdtar -xf "${_debfile}" -C "$srcdir"
    tar -xf data.tar.xz --exclude=usr/share/{lintian,menu} -C "$pkgdir/"

    local libdir="$pkgdir/usr/lib/"
    mv "$libdir/"*-linux-gnu/$pkgname "$libdir"
    rm -rf "$libdir/"*-linux-gnu

    chmod 4755 "$pkgdir/usr/lib/$pkgname/opera_sandbox"

    install -Dm644 "$srcdir/default" "$pkgdir/etc/$pkgname/default"

    rm -f "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/opera" "$pkgdir/usr/bin/$pkgname"
    # The .deb ships a symlink to the old multiarch path, fix it so desktop
    # entries with TryExec=opera-gx are not hidden.
    ln -sf "$pkgname" "$pkgdir/usr/bin/opera-gx"

    install -Dm644 \
        "$pkgdir/usr/share/doc/$pkgname/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/copyright"
}
