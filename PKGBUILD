# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=termius-beta
pkgver=7.58.6
pkgrel=2
pkgdesc="Desktop SSH Client"
url="https://www.termius.com/"
arch=('x86_64')
license=('custom')
depends=('libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'libxss')
makedepends=('squashfs-tools')
# Get latest version + link from https://snapcraft.io/termius-beta|| snap info termius-beta || run the following
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/termius-beta | jq '.download_url' -r
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/termius-beta | jq '.version' -r
source=(
    "$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/yyZzRdoyiRz3EM7iuvjhaIjDfnlFJcZs_258.snap"
    "termius-beta.desktop"
    "tos.html"
)
sha512sums=('ea2527143cf41935f1ea68f16077a65c6b21b4a96c7509cfd57048fa379b99ab920f62ca016338b44cd23643e1d5672e9ac76f49b4a87e96b697dc1944b6ecd2'
            'f626754916d9a07faa6d1b2bbdf34da8385aaf1b29eca3c0007079b06de18a4a3c51007d8b753a0c9d721c9ea48f646d00ac3ec219cb4eb77c4419bba634d34b'
            '53f9c61fba12b72817c5e7f4e0ac520489265fbf425fa46f13129da66632b41a2a128072d9e0e64e37e4e8feb8424bc1c15eed127d630314e6459ceb2dbafb4b')

prepare() {
    mkdir -p $pkgname
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
        termius-beta \
        v8_context_snapshot.bin \
        "$pkgdir"/opt/$pkgname
    
    cd "$srcdir"
    # Option 2 - copy all files from the .snap file ~503 MiB
    #mkdir -p "$pkgdir"/opt/
    #cp -r "$srcdir"/$pkgname "$pkgdir"/opt/$pkgname

    find "$pkgdir"/opt/$pkgname/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/$pkgname/termius-beta
    chmod 755 "$pkgdir"/opt/$pkgname/chrome_crashpad_handler

    mkdir -p "$pkgdir"/usr/bin
    ln -sf /opt/$pkgname/termius-beta "$pkgdir"/usr/bin/$pkgname
    install -Dm0644 tos.html "$pkgdir"/usr/share/licenses/$pkgname/tos.html
    install -Dm0644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    install -Dm0644 $pkgname/meta/gui/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
