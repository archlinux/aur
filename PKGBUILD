# Maintainer: MojArch
pkgname=opera-gx-stable
pkgver=127.0.5778.75
pkgrel=1
pkgdesc='Fast, secure, easy-to-use web browser'
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
)
optdepends=(
    'opera-gx-ffmpeg-codecs'
    'cairo'
)

_baseurl="https://get.opera.com/pub/opera_gx/${pkgver}/linux"
_debfile="${pkgname}_${pkgver}_amd64.deb"

source=(
    "${_baseurl}/${_debfile}"
    "opera"
    "default"
)
# dynamic Integrity checks
sha256sums=('0da8afb8dabafa8bdce31895535994896a90e9333df93c7015a506dc320d3f02'
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

    install -Dm644 \
        "$pkgdir/usr/share/doc/$pkgname/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/copyright"
}
