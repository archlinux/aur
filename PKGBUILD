# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=easyeda-pro-electron
_pkgname=${pkgname%-electron}
pkgver=2.0.35
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
sha256sums=('fdf0f0fe693cb085c92f20e9cf931b9d4b0bafbb895678a6993a41e23a43fab1'
            'cc1661c75c9366d2fe43c4b864cf81acb9aae7cab505ce21e7de2db3c68cde76'
            '89289056ed4b5d051280e3a69dfb550b6914f470f201be1ca3b165ddd4f3e435')
sha256sums_x86_64=('ae0634e0145de254653b4e239c69b33ac8f9713ed8c04ad601cd7743b8977bb6')
sha256sums_aarch64=('e3f4849d2d367792fc000004de968b1df770d978df6c6d60ee727b234192fbdd')

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
