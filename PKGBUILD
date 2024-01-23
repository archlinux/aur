# Maintainer: Frederick Gnodtke <frederick at gnodtke dot net>

pkgname=silabs-usbxpresshostsdk
pkgver=6.7.7
pkgrel=1
pkgdesc="Flashing tool for CP210X UART bridges."
arch=('x86_64')
license=('custom')
url='https://www.silabs.com/search#q=usbxpresshostsdk&t=Documentation&sort=relevancy'
depends=('util-linux-libs' 'libusb' 'glibc' 'gcc-libs')
makedepends=('patchelf')
source=("https://www.silabs.com/documents/public/software/USBXpressHostSDK-Linux.tar")
sha256sums=('4d9e21b143515bfdcdb9c325ea2ac12051125bf02051554ae4ddbacb51c97360')

prepare() {
    # Extract inner archive.
    tar xf USBXpressHostSDK-*-Linux.tar.gz
}

pkgver() {
    # The version is encoded in the tar file that is included in the root tar file.
    ls USBXpressHostSDK-*-Linux.tar.gz | sed 's/^USBXpressHostSDK-\([0-9].[0-9].[0-9]\)-Linux.tar.gz$/\1/'
}

package() {
    cd USBXpressHostSDK
    install -Dm755 -t "$pkgdir"/usr/bin/ \
        CP210x/bin/$arch/cp210xsmt \
        CP2110_4/bin/$arch/cp2110smt \
        CP2112/bin/$arch/cp2112smt \
        CP2130/bin/$arch/cp2130smt \
        CP2615/bin/$arch/cp2615smt

    # Strip insecure rpath.
    patchelf --remove-rpath "$pkgdir"/usr/bin/*

    mkdir -p "$pkgdir"/usr/share/doc/$pkgname
    cp -r Docs/* "$pkgdir"/usr/share/doc/$pkgname/

    install -Dm644 Docs/html/license.html "$pkgdir"/usr/share/license/$pkgname/license.html
}
