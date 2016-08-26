# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgver=3.2.2
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene_viewer/'
license=('custom')
makedepends=('rpmextract' 'patchelf')
source=("snapgene_viewer_${pkgver}_linux.rpm::http://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=${pkgver:0:3}&minorRelease=${pkgver}&os=linux_rpm")
sha512sums=('e3a6da02fc8e07a347bf94b8972edfbd912c5256254a6fb31911c79b24a8796cabc55d522951a962d45a585eaa433c9447f6547444133f84d46c2f087ab0ab10')

# Some shared libraries could be stripped out and installed as dependencies
# instead.  However, directly calling the snapgene-viewer binary currently
# segfaults, so some care is needed.

package() {
    cd "$pkgdir"
    rpmextract.sh "$srcdir/snapgene_viewer_${pkgver}_linux.rpm"
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
