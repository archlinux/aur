# Maintainer: MojArch

pkgname=opera-developer
pkgver=124.0.5691.0
pkgrel=1
pkgdesc='A fast and secure web browser and Internet suite - developer stream'
arch=('x86_64')
url='https://www.opera.com/computer'
license=('custom:opera')
provides=('opera')
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
#    'opera-developer-ffmpeg-codecs-bin: additional support for proprietary codecs'
    'opera-developer-ffmpeg-codecs'
)
source=(
    "https://get.geo.opera.com/pub/${pkgname}/${pkgver}/linux/${pkgname}_${pkgver}_amd64.deb"
    "opera"  
    "default"  
)
sha256sums=(
    'e25ec075e2fd03e7de207a8cedb67871982d5b2666931ef4695217754c4715aa'
    '508512464e24126fddfb2c41a1e2e86624bdb0c0748084b6a922573b6cf6b9c5'  
    '99fc0d2822edd14e234d451995db47148125e4580221a292598959421d131231'  
)

prepare() {
    # Replace placeholders in the wrapper script with actual values
    sed -e "s/%pkgname%/$pkgname/g" \
        -e "s/%operabin%/$pkgname\/$pkgname/g" \
        -i "$srcdir/opera"
}

package() {
    # Extract the .deb package while excluding unnecessary directories
    tar -xf data.tar.xz --exclude=usr/share/{lintian,menu} -C "$pkgdir/"

    # Simplify the library path by removing architecture-specific subfolder
    local libdir="$pkgdir/usr/lib/"
    mv "$libdir/"*-linux-gnu/$pkgname "$libdir"
    rm -rf "$libdir/"*-linux-gnu

    # Set the appropriate permissions for the sandbox binary
    chmod 4755 "$pkgdir/usr/lib/$pkgname/opera_sandbox"

    # Install the default configuration file
    install -Dm644 "$srcdir/default" "$pkgdir/etc/$pkgname/default"

    # Replace the original binary with a custom wrapper script
    rm -f "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/opera" "$pkgdir/usr/bin/$pkgname"

    # Move license information to the correct location
    install -Dm644 \
        "$pkgdir/usr/share/doc/$pkgname/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/copyright"
}
