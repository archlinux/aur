# Maintainer: TBK <aur@jjtc.eu>
# Contributor: TBK <aur@jjtc.eu>

pkgname=termius-beta
pkgver=5.5,1
pkgrel=1
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
    "${pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/yyZzRdoyiRz3EM7iuvjhaIjDfnlFJcZs_83.snap"
    "termius-beta.desktop"
    "tos.html"
)
sha256sums=('34ed84c67e9c998104bb7c9a4ca05ab2531b0445f4937741eff225e957050edb'
            'cd9d14924c7721042640d6db1fbdc882b156d756bd906cd09193221b59f979f5'
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
        termius-beta \
        v8_context_snapshot.bin \
        "$pkgdir"/opt/${pkgname}
    
    cd "$srcdir"
    # Option 2 - copy all files from the .snap file ~503 MiB
    #mkdir -p "$pkgdir"/opt/
    #cp -r "$srcdir"/${pkgname} "$pkgdir"/opt/${pkgname}

    find "$pkgdir"/opt/${pkgname}/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/${pkgname}/termius-beta

    mkdir -p "${pkgdir}"/usr/bin
    ln -sf /opt/${pkgname}/termius-beta "${pkgdir}"/usr/bin/${pkgname}
    install -Dm0644 tos.html "${pkgdir}"/usr/share/licenses/${pkgname}/tos.html
    install -Dm0644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
    install -Dm0644 ${pkgname}/meta/gui/icon.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
}
