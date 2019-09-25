# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene_viewer/'
license=('custom')
_dlurl=("https://www.snapgene.com/local/targets/viewer_download.php?os=linux_rpm&majorRelease=latest&minorRelease=latest")
_filename=$(curl --silent --head --location "$_dlurl" | grep -Po 'filename=".*"' | cut -d'"' -f2)
pkgver="$(grep -Po '[0-9]([0-9]|\.)+[0-9]' <<< "$_filename")"
source=("$_filename::$_dlurl")
sha512sums=('7163cf178114073bba9d8e55c2afa56c1571b38ae5595328f8e141aec2af305f5883b8b198c9619093d153b383445147c5c246b3541d3584b9ab36610125c70f')

package() {
    cd "$pkgdir"
    cp -r "$srcdir/opt" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
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
