# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=easyeda-pro-electron
_pkgname=${pkgname%-electron}
pkgver=2.0.32
pkgrel=2
pkgdesc="EasyEDA Professional Edition. Run with system electron."
arch=('x86_64' 'aarch64')
url="https://pro.easyeda.com/"
license=('custom')
depends=('electron' 'libnotify' 'libappindicator-gtk3')
makedepends=()
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-git $_pkgname-bin)
install=$pkgname.install
source=("LICENSE"
        "$pkgname.install"
        "$_pkgname.sh")
source_x86_64=("$_pkgname-x86_64-$pkgver.zip::https://image.easyeda.com/files/easyeda-pro-linux-x64-$pkgver.zip")
source_aarch64=("$_pkgname-aarch64-$pkgver.zip::https://image.easyeda.com/files/easyeda-pro-linux-arm64-$pkgver.zip")
sha256sums=('37f229a8fa5de9f1e1af1ad2046295a4837bfe3b0e1272cbb9d9f6c5747d2f10'
            'cc1661c75c9366d2fe43c4b864cf81acb9aae7cab505ce21e7de2db3c68cde76'
            '89289056ed4b5d051280e3a69dfb550b6914f470f201be1ca3b165ddd4f3e435')
sha256sums_x86_64=('7df45c6b5d8a67430eb73797da0b9268fe1e4cdc545f41763123ac75d088231e')
sha256sums_aarch64=('1692f916386759ac3d3b90171d0360b2476aceabe4125286326e143958808346')

package() {
    cd $srcdir
    install -Dm755 $_pkgname.sh $pkgdir/usr/bin/$_pkgname
    install -Dm644 LICENSE      $pkgdir/usr/share/licenses/$pkgname/LICENSE

    cd $srcdir/$_pkgname
    install -Dm644 EasyEDA-Distribution-License.txt \
                   $pkgdir/usr/share/licenses/$pkgname/EasyEDA-DLA.txt
    install -dm755 $pkgdir/usr/lib/$_pkgname
    cp -dpr --no-preserve=ownership resources $pkgdir/usr/lib/$_pkgname
    cp -dpr --no-preserve=ownership locales   $pkgdir/usr/lib/$_pkgname

    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        install -Dm644 icon/icon_${_icon}x${_icon}.png \
                       $pkgdir/usr/share/icons/hicolor/${_icon}x${_icon}/apps/$_pkgname.png
    done
    install -Dm644 icon/icon_512x512@2x.png \
                   $pkgdir/usr/share/icons/hicolor/1024x1024/apps/$_pkgname.png

    # desktop entry
    install -Dm644 easyeda-pro.dkt \
                   $pkgdir/usr/share/applications/$_pkgname.desktop

    sed -i 's|/opt/easyeda-pro/icon/icon_128x128.png|easyeda-pro|g' \
        $pkgdir/usr/share/applications/$_pkgname.desktop
    sed -i 's|/opt/easyeda-pro/||g' \
        $pkgdir/usr/share/applications/$_pkgname.desktop
}
