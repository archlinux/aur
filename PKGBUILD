# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgver=3.3.3
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene_viewer/'
license=('custom')
makedepends=('patchelf')
source=("snapgene_viewer_${pkgver}_linux.rpm::http://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=${pkgver:0:3}&minorRelease=${pkgver}&os=linux_rpm")
sha512sums=('7900bb4d0235f7d8609f848bb0a471e11dd5ecffb8bf3d0a2463e2fb559283f7ba14d045e688c7bb923d52903dedf169ce5999da218fdb91db82b4096183c7eb')

# Some shared libraries could be stripped out and installed as dependencies
# instead.  However, directly calling the snapgene-viewer binary currently
# segfaults, so some care is needed.

package() {
    cd "$pkgdir"
    cp -r "$srcdir/opt" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
    patchelf --remove-rpath "$pkgdir/opt/gslbiotech/snapgene-viewer/snapgene-viewer"
    patchelf --remove-rpath "$pkgdir/opt/gslbiotech/snapgene-viewer/libqntp.so.1"
    patchelf --remove-rpath "$pkgdir/opt/gslbiotech/snapgene-viewer/crypto/libqca-ossl.so"
    mkdir "$pkgdir/usr/bin"
    cat <<'EOF' >"$pkgdir/usr/bin/snapgene-viewer"
#!/bin/sh
# Snapgene Viewer is not localized and genbank exports are invalid in other
# locales, so we just set LANG=C.
LANG=C /opt/gslbiotech/snapgene-viewer/snapgene-viewer.sh
EOF
    chmod a+x "$pkgdir/usr/bin/snapgene-viewer"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/gslbiotech/snapgene-viewer/resources/licenseAgreement.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
