# Maintainer: MojArch
pkgname=opera-developer
pkgver=126.0.5734.0
pkgrel=3
pkgdesc='Fast, secure, easy-to-use web browser
 Opera is a fast, secure, and user-friendly web browser.
 It includes a built-in ad blocker, Video pop-out, and free VPN.(Developer Stream)'
arch=('x86_64')
url='https://www.opera.com/computer'
license=('custom:opera')
provides=('opera-developer')
depends=(
    'qt5-base'
    'gtk3'
    'alsa-lib'
    'libnotify'
    'curl'
    'nss'
    'libxss'
    'ttf-font'
    'desktop-file-utils'
    'shared-mime-info'
    'hicolor-icon-theme'
    'upower'
    'cups'
    'at-spi2-core'
    'dbus'
    'libxkbcommon'
    'egl-gbm'
)
optdepends=(
    'opera-developer-ffmpeg-codecs'
    'cairo'
)

# Base URL
_baseurl="https://get.geo.opera.com/pub/${pkgname}/${pkgver}/linux"
_debfile="${pkgname}_${pkgver}_amd64.deb"

source=(
    "${_baseurl}/${_debfile}"
    "opera"
    "default"
)
# dynamic Integrity checks
sha256sums=(
    "$(curl -s "${_baseurl}/${_debfile}.sha256sum" | awk -v f="${_debfile}" '$0 ~ f {print $1; found=1; exit} {h=$1} END { if (!found) print h }')"
    "508512464e24126fddfb2c41a1e2e86624bdb0c0748084b6a922573b6cf6b9c5"
    "99fc0d2822edd14e234d451995db47148125e4580221a292598959421d131231"
)

prepare() {
    sed -e "s/%pkgname%/$pkgname/g" \
        -e "s/%operabin%/$pkgname\/$pkgname/g" \
        -i "$srcdir/opera"
}

package() {
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
