# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=termius-beta
pkgver=8.8.1
pkgrel=1
pkgdesc="Desktop SSH Client"
url="https://www.termius.com/"
arch=('x86_64')
license=('custom')
depends=('at-spi2-core' 'dbus' 'e2fsprogs' 'expat' 'gtk3' 'keyutils' 'libbsd' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3')
makedepends=('squashfs-tools')
# Get latest version + link from https://snapcraft.io/termius-beta|| snap info termius-beta || run the following
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/termius-beta | jq '.download_url' -r
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/termius-beta | jq '.version' -r
source=(
    "$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/yyZzRdoyiRz3EM7iuvjhaIjDfnlFJcZs_293.snap"
    "termius-beta.desktop"
    "tos.html"
)
sha512sums=('24bd2048a068be14521cd786124f97c286ded1be98bd6a12a0e5a3c9e682a3b03ac2da3db9e7a9a11811515235ffebbe7157d014658d27856e330215e1a395ed'
            '8bf93360614226cf477e5322d87e5fefe781d97e30390777ccb89282219c90714e98868381ab69b001c67a606e068f51a177b6f48bbbdb0c0f4a4f27bf0f0dd4'
            '6ac7c082d1adba92dd911f46f9926f702be0f92a9843e6252364477d81364569eeeee9b37170a6d9000fde644588734cb6a11d165fc0aff3dbfbcd6ad353ca96')

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
        chrome_200_percent.pak \
        chrome_crashpad_handler \
        icudtl.dat \
        libEGL.so \
        libffmpeg.so \
        libGLESv2.so \
        libvk_swiftshader.so \
        libvulkan.so.1 \
        locales \
        resources \
        resources.pak \
        termius-beta \
        v8_context_snapshot.bin \
        vk_swiftshader_icd.json \
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
