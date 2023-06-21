# Maintainer: NicKoehler <grillinicolavocal at gmail dot com>
pkgname=yarg
pkgver=0.10.7
pkgrel=1
pkgdesc="YARG - Yet Another Rhythm Game inspired off of Rockband, Guitar Hero, Clone Hero, or similar."
arch=("x86_64")
url="https://github.com/YARC-Official/YARG"
license=("MIT")
depends=("hidapi" "systemd-libs")

source=(
    "$pkgname"
    "$pkgname.desktop"
    "https://github.com/YARC-Official/YARG/releases/download/v${pkgver}/YARG_v${pkgver}-Linux-x86_64.zip"
)
sha256sums=(
    "b6d416482f71a44e29e3d8f82fb6e8e0ecc6522f1d46107526ff57e8dff5b3a0"
    "56b58195f481e1a2e0ccf6bf5ff84f4a81bcf5befbb38a72e47b2b4c4652dcab"
    "b27b40009c0914a622cece8ffa24918c67fa7e9ab669c55674c91b038ad246a6"
)


package() {

    # create dirs
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/etc/udev/rules.d"

    # extract binaries
    bsdtar -xf "YARG_v${pkgver}-Linux-x86_64.zip" -C "$srcdir"

    # install binaries
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/UnityPlayer.so" "$pkgdir/opt/$pkgname/"
    install -Dm755 "$srcdir/YARG.x86_64" "$pkgdir/opt/$pkgname/YARG"
    cp -r "$srcdir/YARG_Data" "$pkgdir/opt/$pkgname/YARG_Data"

    # install icon and .desktop
    install -Dm644 "$pkgdir/opt/$pkgname/YARG_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # create 69-hid.rules
    echo 'KERNEL=="hidraw*", TAG+="uaccess"' > "$pkgdir/etc/udev/rules.d/69-hid.rules"

}
