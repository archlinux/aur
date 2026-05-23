# Maintainer: Dennis Fink <me+coding@dennisfink.me>
pkgname=transcode.sh
pkgver=2.1.0
pkgrel=1
pkgdesc="Batch transcode helper for media files using ffmpeg."
arch=('any')
url="https://codeberg.org/metalgamer/transcode.sh"
license=('BSD-3-Clause')
depends=('bash' 'coreutils' 'ffmpeg')
makedepends=('gzip' 'findutils')
optdepends=(
  'yq: for tomlq support when reading TOML configuration files'
)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/metalgamer/${pkgname}/releases/download/v${pkgver}/${pkgname//./-}-${pkgver}.tar.gz")
sha256sums=('1426b9f134debde2fc0dafa172ea737f77ea7148d02e8d53809e0c0e05b7c78d')

build() {
  cd $srcdir/${pkgname//./-}-$pkgver
  gzip -c transcode.sh.1 >transcode.sh.1.gz
}

package() {
  cd $srcdir/${pkgname//./-}-$pkgver
  install -D -m755 transcode.sh "${pkgdir}/usr/bin/transcode.sh"
  install -D -m644 transcode.sh.1.gz "${pkgdir}/usr/share/man/man1/transcode.sh.1.gz"
  install -D -m644 transcode.sh.bash-completion.sh "${pkgdir}/etc/bash_completion.d/transcode.sh"
  install -D -m644 LICENSES/BSD-3-Clause.txt "${pkgdir}/usr/share/licenses/${pkgname}/BSD-3-Clause.txt"
  find contrib/presets -type f -print0 | while IFS= read -r -d '' preset; do
    install -D -m644 "${preset}" \
      "${pkgdir}/usr/share/${pkgname}/presets/${preset#contrib/presets/}"
  done
}

# vim:set ts=2 sw=2 et:
