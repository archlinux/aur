# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
# Contributor: Lorenzo Gaifas <brisvag at gmail dot com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgver=7.0.3
_pkgver_major=$(cut -d '.' -f 1 <<<"$pkgver")
_pkgver_major_middle=$(cut -d '.' -f 1-2 <<<"$pkgver")
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene-viewer/'
license=('custom')
# A valid licence is required to use the full version of snapgene
source=("https://cdn.snapgene.com/downloads/SnapGeneViewer/"$_pkgver_major".x/"$_pkgver_major_middle"/"$pkgver"/snapgene_viewer_"$pkgver"_linux.rpm")
sha512sums=('b82dd421890f918102d1136533d6db3ae71710274c2b5c0196910c6d33f22cfc6003db90d8526ed57adec122f0c84bafb1788ab31495d51871f1f40333137ca7')

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

  sed -i 's`${INSTALLED_DIR}/snapgene-viewer "$@"`QT_QPA_PLATFORM="xcb" ${INSTALLED_DIR}/snapgene-viewer "$@"`' "$pkgdir/opt/gslbiotech/snapgene-viewer/snapgene-viewer.sh"
    
  chmod a+x "$pkgdir/usr/bin/snapgene-viewer"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/gslbiotech/snapgene-viewer/resources/licenseAgreement.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
  cd "${pkgdir}"
  rm -rf usr/lib
}
