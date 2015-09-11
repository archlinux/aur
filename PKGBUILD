# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=satellitereign-hib
pkgver=104
pkgrel=1
pkgdesc="Spiritual successor to the Syndicate games"
arch=("i686" "x86_64")
url="https://www.humblebundle.com/store/p/satellitereign_storefront"
license=("custom:commercial")
depends=("gcc-libs" "glibc" "libx11" "libxau" "libxcb" "libxcursor" "libxdmcp" "libxext" "libxfixes" "libxrandr" "libxrender" "libgl")
options=("!emptydirs" "!strip")
source=("${pkgname}.desktop"
        "SatelliteReignLinux${pkgver}.zip::hib://SatelliteReignLinux${pkgver}.zip")
sha256sums=("87cc04b37e83a2871d4eb2aa694ea13eae2670fa364d4f06b823cf1c4323da33"
            "e6f5111f2c8b82ea2b6e4ea98e1dba7d751bfbe06c6319563413791c9262a8df")

# Disable compression of the package
PKGEXT=".pkg.tar"

package() {
    # Binaries
    if [ "$CARCH" = "x86_64" ]
    then
        install -Dm755 "$srcdir/SatelliteReignLinux$pkgver/SatelliteReignLinux.x86_64" "$pkgdir/opt/$pkgname/SatelliteReignLinux"
    else
        install -Dm755 "$srcdir/SatelliteReignLinux$pkgver/SatelliteReignLinux.x86" "$pkgdir/opt/$pkgname/SatelliteReignLinux"
    fi

    # Data
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/$pkgname/" "$srcdir/SatelliteReignLinux$pkgver/SatelliteReignLinux_Data"
    find "$pkgdir/opt/$pkgname/SatelliteReignLinux_Data" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/SatelliteReignLinux_Data" -type f -print0 | xargs -0 chmod 644

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/SatelliteReignLinux" "$pkgdir/usr/bin/$pkgname"

    # License
    # [None provided]

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/SatelliteReignLinux_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"
}
