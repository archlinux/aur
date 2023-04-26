# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=termius
pkgver=7.58.5
pkgrel=1
pkgdesc="Desktop SSH Client"
url="https://www.termius.com/"
arch=('x86_64')
license=('custom')
depends=('libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'libxss')
makedepends=('squashfs-tools')
# Get latest version + link from https://snapcraft.io/termius-app || snap info termius-app || run the following
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/termius-app | jq '.download_url' -r
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/termius-app | jq '.version' -r
source=(
    "$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/WkTBXwoX81rBe3s3OTt3EiiLKBx2QhuS_152.snap"
    "termius.desktop"
    "tos.html"
)
sha512sums=('cb9b865a5942340cffbb67fb9ce5a890ac7bab7da142fd9539556608170f34cf99d2c89a93c1f7e9833b8ef8ce8f47b88ead319415724265a480168602ee6fe0'
            '9b0788a02b9bf371de07adec8f3e14f4db8bf83dae6dee60d91027d8ba09cbab253b8b714f980d5c62b72d97e4ac11e6c3985139322bdceaad9f2f0232427656'
            '53f9c61fba12b72817c5e7f4e0ac520489265fbf425fa46f13129da66632b41a2a128072d9e0e64e37e4e8feb8424bc1c15eed127d630314e6459ceb2dbafb4b')

prepare() {
    mkdir $pkgname
    unsquashfs -f -d $pkgname $pkgname-$pkgver.snap
}

package() {
    # Option 1 - copy only the needed files ~183 MiB
    mkdir -p "$pkgdir"/opt/$pkgname

    cd "$srcdir"/$pkgname

    cp -r \
        chrome_100_percent.pak \
        chrome_crashpad_handler \
        icudtl.dat \
        libffmpeg.so \
        locales \
        resources \
        resources.pak \
        termius-app \
        v8_context_snapshot.bin \
        "$pkgdir"/opt/$pkgname
    
    cd "$srcdir"
    # Option 2 - copy all files from the .snap file ~503 MiB
    #mkdir -p "$pkgdir"/opt/
    #cp -r "$srcdir"/$pkgname "$pkgdir"/opt/$pkgname

    find "$pkgdir"/opt/$pkgname/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/$pkgname/termius-app
    chmod 755 "$pkgdir"/opt/$pkgname/chrome_crashpad_handler

    mkdir -p "$pkgdir"/usr/bin
    ln -sf /opt/$pkgname/termius-app "$pkgdir"/usr/bin/$pkgname
    install -Dm0644 tos.html "$pkgdir"/usr/share/licenses/$pkgname/tos.html
    install -Dm0644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    install -Dm0644 $pkgname/meta/gui/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
