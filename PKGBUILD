# Based on snapgene-viewer package by Antony Lee <anntzer dot lee at gmail dot com>
# Maintainer: Bitals <me at bitals dot xyz>
# Co-Maintainer: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
# Co-Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>
pkgname=snapgene
pkgver=7.0.2
_pkgver_major=$(cut -d '.' -f 1 <<<"$pkgver")
_pkgver_major_middle=$(cut -d '.' -f 1-2 <<<"$pkgver")
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene/'
license=('custom')
# A valid licence is required to use the full version of snapgene
source=("https://cdn.snapgene.com/downloads/SnapGene/"$_pkgver_major".x/"$_pkgver_major_middle"/"$pkgver"/snapgene_"$pkgver"_linux.rpm")
sha512sums=('517fb1812508d9457a0f75e746a3923e72ed314df5ba8ddf504220442ad9d08dd9a8b14c7d078306ba68f0b391f1f1ce08551e29394876fa3883267cce3b21fe')

package() {
    cd "$pkgdir"
    cp -r "$srcdir/opt" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
    mkdir "$pkgdir/usr/bin"
    cat <<'EOF' >"$pkgdir/usr/bin/snapgene"
#!/bin/sh
# Snapgene is not localized and genbank exports are invalid in other
# locales, so we just set LANG=C.
LANG=C /opt/gslbiotech/snapgene/snapgene.sh
EOF

    sed -i 's`${INSTALLED_DIR}/snapgene "$@"`QT_QPA_PLATFORM="xcb" ${INSTALLED_DIR}/snapgene "$@"`' "$pkgdir/opt/gslbiotech/snapgene/snapgene.sh"
    
    chmod a+x "$pkgdir/usr/bin/snapgene"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/gslbiotech/snapgene/resources/licenseAgreement.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
