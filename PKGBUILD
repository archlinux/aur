# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=satellitereign-hib
pkgver=093
pkgrel=1
pkgdesc="Spiritual successor to the Syndicate games"
arch=("i686" "x86_64")
url="https://www.humblebundle.com/store/p/satellitereign_storefront"
license=("custom:commercial")
depends_x86_64=("gcc-libs" "glibc" "libx11" "libxau" "libxcb" "libxcursor" "libxdmcp" "libxext" "libxfixes" "libxrandr" "libxrender" "libgl")
depends_i686=("gcc-libs" "glibc" "libx11" "libxau" "libxcb" "libxcursor" "libxdmcp" "libxext" "libxfixes" "libxrandr" "libxrender" "libgl")
options=("!emptydirs" "!strip")
source=("${pkgname}.desktop"
        "SatelliteReignLinux${pkgver}.zip::hib://SatelliteReignLinux${pkgver}.zip")
sha256sums=("87cc04b37e83a2871d4eb2aa694ea13eae2670fa364d4f06b823cf1c4323da33"
            "9d7ca804a73ee318319d464082439180ec700648807e9d23f1288a6555b7db64")

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
