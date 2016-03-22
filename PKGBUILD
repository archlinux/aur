# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgver=3.1.1
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene_viewer/'
license=('custom')
depends=('shared-mime-info')
makedepends=('rpmextract')
install="$pkgname.install"
source=("snapgene_viewer_${pkgver}_linux.rpm::http://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=${pkgver:0:3}&minorRelease=${pkgver}&os=linux_rpm")
md5sums=('f27ea8f78211b1a952f5f8336ac95bdd')

# Some shared libraries could be stripped out and installed as dependencies
# instead.  However, directly calling the snapgene-viewer binary currently
# segfaults, so some care is needed.

package() {
    cd "$pkgdir"
    rpmextract.sh "$srcdir/snapgene_viewer_${pkgver}_linux.rpm"
    mkdir "$pkgdir/usr/bin"
    cat <<'EOF' >"$pkgdir/usr/bin/snapgene-viewer" 
#!/bin/sh
# Snapgene Viewer is not localized and genbank exports are invalid in other
# locales, so we just set LANG=C.
LANG=C /opt/gslbiotech/snapgene-viewer/snapgene-viewer.sh
EOF
    chmod a+x "$pkgdir/usr/bin/snapgene-viewer"
}
