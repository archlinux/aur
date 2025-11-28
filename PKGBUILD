# Maintainer: MojArch
pkgname=opera-developer
pkgver=125.0.5727.1  # ← Change this when updating
pkgrel=1           # ← Reset to 1 when bumping pkgver
pkgdesc='A fast and secure web browser and Internet suite - developer stream'
arch=('x86_64')
url='https://www.opera.com/computer'
license=('custom:opera')
provides=('opera-developer')
depends=(
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
)
optdepends=(
    'opera-developer-ffmpeg-codecs'
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
    "508512464e24126fddfb2c41a1e2e86624bdb0c0748084b6a922573b6cf6b9c5"  # opera wrapper
    "99fc0d2822edd14e234d451995db47148125e4580221a292598959421d131231"  # default config
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
