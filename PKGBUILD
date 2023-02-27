# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgver=6.2.1
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url="https://www.snapgene.com/${pkgname}"
license=('custom')
_dlurl="https://www.snapgene.com/local/targets/viewer_download.php?os=linux_rpm&majorRelease=latest&minorRelease=latest"
source=("$(curl --silent --head --location "$_dlurl" | grep -Po 'Location: \K.*rpm' | tail -n1)")
sha512sums=('SKIP')

pkgver() {
  grep -Po '\d(\d|\.)+\d' <<<"$source" | tail -n1
}

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
  cd "${pkgdir}"
  rm -rf usr/lib
}
