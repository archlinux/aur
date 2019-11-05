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
sha512sums=('91b348cdaf2a7e399664252ceac96daf039f808c6bf297a7ccd8118cd2980c9b9f526442f0f9fa704e00f63ffafd35b74d8c313c8b9913ec1cf1f8ecbca8e635')

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
