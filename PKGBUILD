# Maintainer: Racovik
pkgname=legenda-git
pkgver=2.0.3.6.r1.gbf5a268
pkgrel=1
pkgdesc='GTK 4 subtitle search and downloader'
arch=('any')
license=('MIT')
url='https://github.com/desenrolado-s/Subtitle-Downloader'
depends=('gtk4' 'python-gobject' 'python-keyring')
makedepends=('git')
provides=("legenda=${pkgver}")
conflicts=('legenda')
source=("git+https://github.com/desenrolado-s/Subtitle-Downloader.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Subtitle-Downloader"
  git describe --long --tags --match 'v[0-9]*' \
    | sed -E 's/^v//; s/-([0-9]+)-g/.r\1.g/; s/-/./g'
}

package() {
  cd "$srcdir/Subtitle-Downloader"

  install -d "$pkgdir/usr/lib/legenda" \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps" \
    "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 app.py "$pkgdir/usr/lib/legenda/app.py"
  cp -r legenda "$pkgdir/usr/lib/legenda/"
  printf '#!/bin/sh\nexec /usr/bin/python /usr/lib/legenda/app.py "$@"\n' \
    > "$pkgdir/usr/bin/Legenda"
  chmod 755 "$pkgdir/usr/bin/Legenda"

  install -m644 packaging/linux/legenda.desktop \
    "$pkgdir/usr/share/applications/legenda.desktop"
  install -m644 packaging/linux/legenda.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/legenda.svg"
  install -m644 packaging/linux/legenda.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/legenda.png"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
