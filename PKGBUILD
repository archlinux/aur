# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.34.3.6948
pkgrel=1
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Freeware')
depends=('openssl' 'xdg-utils' 'ffmpeg' 'libtorrent' 'gst-plugins-base' 'qt6-wayland')
# source=("${pkgname}-${pkgver}-amd64.deb::http://debrepo.freedownloadmanager.org/pool/main/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
source=("${pkgname}-${pkgver}-amd64.deb::https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
sha256sums=("af7f410a0049684e8582b1b2157795abb9e12d45fba3c25e522df000e56d0429")

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -xvf data.tar.xz -C "$pkgname-$pkgver"
    # tar --use-compress-program=unzstd -xvf data.tar.zst -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"

    sed -i 's/\/opt\/freedownloadmanager\/icon\.png/freedownloadmanager/g' \
        './usr/share/applications/freedownloadmanager.desktop'
    sed -i 's/\/opt\/freedownloadmanager\/fdm/\/usr\/bin\/fdm/g' \
        './usr/share/applications/freedownloadmanager.desktop'

    # Application Icon
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    ln -sv "/opt/$pkgname/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    # Add StartupWMClass
    sed -i '/^Exec=/a StartupWMClass=fdm' \
        './usr/share/applications/freedownloadmanager.desktop'

    cp -dpr --no-preserve=ownership opt usr "$pkgdir"

    install -d "$pkgdir/usr/bin"
    ln -sv "/opt/$pkgname/fdm" "$pkgdir/usr/bin/fdm"
}
