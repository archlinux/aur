# Maintainer: Carlos A. Planchón <carlosandresplanchonprestes@gmail.com>

# This package is not affiliated with or endorsed by AGESIC.
# This package repackages proprietary middleware distributed by AGESIC for Arch Linux.

pkgname=cedula-uruguay-pkcs11
pkgver=7.5.0
pkgrel=1
pkgdesc="PKCS#11 middleware for the Uruguayan electronic ID card (cédula)"
arch=('x86_64')
url="https://www.gub.uy/agencia-gobierno-electronico-sociedad-informacion-conocimiento/firma-digital/drivers-para-usar-cedula-digital"
license=('custom')
depends=('pcsclite' 'ccid')
makedepends=('binutils' 'tar')
options=('!debug')
source=("libclassicclient.deb::https://archivos.agesic.gub.uy/nextcloud/index.php/s/8kqSb9z4xKABM8T/download")
sha256sums=('b6fd0150fcea2b952b0d82027324cf3250dea6f42eaac430d6d08ea22eb840ed')

prepare() {
  cd "$srcdir"
  ar x libclassicclient.deb
}

package() {
  cd "$srcdir"

  local extractdir="$srcdir/extract"
  rm -rf "$extractdir"
  mkdir -p "$extractdir"

  tar -xf data.tar.* -C "$extractdir"

  install -dm755 "$pkgdir/usr/lib/ClassicClient"
  cp -a "$extractdir/usr/lib/ClassicClient/." "$pkgdir/usr/lib/ClassicClient/"

  if [[ -d "$extractdir/etc/ClassicClient" ]]; then
    install -dm755 "$pkgdir/etc/ClassicClient"
    cp -a "$extractdir/etc/ClassicClient/." "$pkgdir/etc/ClassicClient/"
  fi

  install -dm755 "$pkgdir/usr/lib/pkcs11"
  ln -sf ../ClassicClient/libgclib.so "$pkgdir/usr/lib/pkcs11/libgclib.so"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
This package installs proprietary middleware obtained from AGESIC distribution channels.
The user is responsible for complying with the vendor's license and usage terms.
EOF
}
