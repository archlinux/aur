# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=papers-please-gog
pkgver=1.0.0.4
pkgrel=1
pkgdesc="A Dystopian Document Thriller (gog.com version)"
url="http://gog.com/game/papers_please"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('bash' 'libgl' 'gcc-libs')
if [ "$CARCH" == "x86_64" ]; then
  depends=('bash' 'lib32-libgl' 'lib32-gcc-libs')
fi
# You need to download the gog.com installer file manually or with lgogdownloader.
# Or you can configure DLAGENTS in makepkg.conf to auto-search through a directory
# containing gog.com downloads:
# DLAGENTS=('gog::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('gog::/usr/bin/echo "Could not find \"$(echo %u | cut -c 7-)\". Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT."; exit 1')
source=("gog://gog_papers_please_$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('a6929625cc8d6a87464cf8b099824e03990e1bef6e33f61cec24cb867cf6e387'
            '9227f364836b975d05609481c0d67e7b6fd8e52f7bb931b39af98d864b296d2e')
PKGEXT=".pkg.tar"

package() {
  cd "Papers, Please"
  install -d "$pkgdir"/opt/papers-please
  # data - binaries
  cp -rup game/* "$pkgdir"/opt/papers-please
  # doc + license
  install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
  install -m644 docs/README support/support_notice.txt "$pkgdir"/usr/share/doc/$pkgname
  install -m644 docs/"End User License Agreement.txt" game/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
  # .desktop file and launcher
  install -Dm644 support/gog-papers-please-primary.desktop "$pkgdir"/usr/share/applications/papers-please.desktop
  install -Dm644 support/gog-papers-please.png "$pkgdir"/usr/share/pixmaps/papers-please.png
  sed "s|gog-||" -i "$pkgdir"/usr/share/applications/papers-please.desktop
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/papers-please
}
