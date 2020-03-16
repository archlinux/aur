# Maintainer: TBK <aur@jjtc.eu>
# Contributor: TBK <aur@jjtc.eu>

pkgname=termius
pkgver=5.6.1
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
    "${pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/WkTBXwoX81rBe3s3OTt3EiiLKBx2QhuS_39.snap"
    "termius.desktop"
    "tos.html"
)
sha256sums=('a1f66464d046b261fd8d8e4a93d07ef7a6437873f9ff538835b72502725141a7'
            'a64e00e3fb2f3d3b81e0f4492e339ab72c61572f4e70b2268edd94c9e69acf1b'
            '9c969cc82314240860737dc09d48970271c798c9b1116ceb91556f75959788a2')

prepare() {
    mkdir ${pkgname}
    unsquashfs -f -d ${pkgname} ${pkgname}-${pkgver}.snap
}

package() {
    # Option 1 - copy only the needed files ~183 MiB
    mkdir -p "$pkgdir"/opt/${pkgname}

    cd "$srcdir"/${pkgname}

    cp -r icudtl.dat \
        libffmpeg.so \
        locales \
        natives_blob.bin \
        resources \
        resources.pak \
        termius-app \
        v8_context_snapshot.bin \
        "$pkgdir"/opt/${pkgname}
    
    cd "$srcdir"
    # Option 2 - copy all files from the .snap file ~503 MiB
    #mkdir -p "$pkgdir"/opt/
    #cp -r "$srcdir"/${pkgname} "$pkgdir"/opt/${pkgname}

    find "$pkgdir"/opt/${pkgname}/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/${pkgname}/termius-app

    mkdir -p "${pkgdir}"/usr/bin
    ln -sf /opt/${pkgname}/termius-app "${pkgdir}"/usr/bin/${pkgname}
    install -Dm0644 tos.html "${pkgdir}"/usr/share/licenses/${pkgname}/tos.html
    install -Dm0644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
    install -Dm0644 ${pkgname}/meta/gui/icon.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
}
