# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=hotline-miami-gog
pkgver=1.0.0.2
pkgrel=1
pkgdesc="2D top-down action video game (gog.com version)"
url="http://gog.com"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('bash' 'libxrandr' 'fontconfig' 'libxi' 'glu' 'libvorbis' 'openal' 'nvidia-cg-toolkit')
if [ "$CARCH" == "x86_64" ]; then
  depends=('bash' 'lib32-libxrandr' 'lib32-fontconfig' 'lib32-libxi' 'lib32-glu' 'lib32-libvorbis' 'lib32-openal' 'lib32-nvidia-cg-toolkit')
fi
# You need to download the gog.com installer file manually or with lgogdownloader.
# Or you can configure DLAGENTS in makepkg.conf to auto-search through a directory
# containing gog.com downloads:
# DLAGENTS=('gog::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('gog::/usr/bin/echo "Could not find \"$(echo %u | cut -c 7-)\". Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT."; exit 1')
source=("gog://gog_hotline_miami_$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('57d468be7bf6dd2b779519ba7883ac8ef03a8b88a346e31e5050b5537cb75f19'
            'a306f962134e56702e3211724b51e9a4d4abc99d55bb369f9c7a41d77e561bb7')
PKGEXT=".pkg.tar"

package() {
  cd "Hotline Miami"
  install -d "$pkgdir"/opt/hotline-miami
  # data
  install -m644 game/{*.ogg,*.wad} "$pkgdir"/opt/hotline-miami
  # binaries
  install -m755 game/{Hotline,hotline_launcher} "$pkgdir"/opt/hotline-miami
  # doc + license
  install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
  install -m644 game/README support/support_notice.txt "$pkgdir"/usr/share/doc/$pkgname
  install -m644 docs/"End User License Agreement.txt" "$pkgdir"/usr/share/licenses/$pkgname
  # .desktop file and launcher
  install -Dm644 support/gog-hotline-miami-primary.desktop "$pkgdir"/usr/share/applications/hotline-miami.desktop
  install -Dm644 support/gog-hotline-miami.png "$pkgdir"/usr/share/pixmaps/hotline-miami.png
  sed "s|gog-||" -i "$pkgdir"/usr/share/applications/hotline-miami.desktop
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/hotline-miami
}
