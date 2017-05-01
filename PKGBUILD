# Maintainer: William Gathoye <william + aur at gathoye dot be> (4.17-now)
# Contributor: Andre Ericson <de dot ericson at gmail dot com> (4.6-4.17)
# Contributor: madmack <ali at devasque dot com> (x-4.6)

pkgname=asix-dkms
pkgver=4.20.0
pkgrel=1
pkgdesc="Driver for USB ASIX Ethernet models AX88760 AX88772 AX88772A AX88772B AX88772C AX88178"
arch=('i686' 'x86_64')

# Browse the pages for USB-to-Ethernet devices and see which devices are
# comatible with this driver.
# http://asix.com.tw/products.php?op=ProductList&PLine=71&PSeries=100
url="http://www.asix.com.tw/"
license=('GPL')

depends=('dkms')
provides=('asix-dkms' 'asix-module')
conflicts=("asix-module")

install=${pkgname}.install
options=(!strip)

_filename="AX88772C_772B_772A_760_772_178_LINUX_DRIVER_v${pkgver}_Source"
source=(
    "http://asix.com.tw/FrootAttach/driver/${_filename}.tar.gz"
    "dkms.conf"
    "asix-dkms.install")
sha512sums=(
    '1c51cba49481b7a7273019c9ce6fdf988cfbeeb270cef78a5722439f8fd0e07e9e05bc4983b81998724413df803f3aabe5a75d0367a0423751115e4c2f64009d'
    'c6230810dfe963452b89800f220713ef3c5539b27f5d2e94b302f51f3b5cd65ed364e7f326b2fb61fdfbe6b831909f2d50c88ce93c5805e3af3d280dc03f0fe1'
    '534ea77f5aa8a008be53def7d45c5ccc89b0b36402d97ebdb71def59882a0b3655d95f2cac9ae16480b5e9ecd562f7acb9ad1c38b5e7fd7b4aa5edf94de4e7e6')

package() {
    # We are in the source directory ./src/
    # Please note the source of the driver are in a subfolder:
    # i.e.: src/AX88772C_772B_772A_760_772_178_LINUX_DRIVER_v<version>_Source/

    installDir="$pkgdir/usr/src/${pkgname%-dkms}-${pkgver}"

    install -dm755 "$installDir"
    install -m644 "$srcdir/dkms.conf" "$installDir"
    install -dm755 "$pkgdir/etc/modprobe.d"
    install -dm755 "$pkgdir/etc/modules-load.d"

    # Set name and version
    sed -e "s/@_PKGBASE@/${pkgname%-dkms}/" \
            -e "s/@PKGVER@/$pkgver/" \
            -i "$installDir/dkms.conf"

    # Copy sources (including Makefile)
    cp -r "${_filename}"/* "$installDir/"
}
