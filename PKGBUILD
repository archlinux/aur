# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=hotline-miami-gog
pkgver=2.0.0.3
pkgrel=1
pkgdesc="2D top-down action video game (gog.com version)"
url="http://gog.com"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh')
depends_i686=('libxrandr' 'fontconfig' 'libxi' 'glu' 'libvorbis' 'openal' 'nvidia-cg-toolkit')
depends_x86_64=('lib32-libxrandr' 'lib32-fontconfig' 'lib32-libxi' 'lib32-glu' 'lib32-libvorbis' 'lib32-openal' 'lib32-nvidia-cg-toolkit')
source=("gog_hotline_miami_$pkgver.sh::gogdownloader://hotline_miami/installer_linux_en"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('c8f181abcff33ee3c3ac5d7de8d40c477c83bb0dca974b0d523084d7c414e88f'
            'a306f962134e56702e3211724b51e9a4d4abc99d55bb369f9c7a41d77e561bb7'
            '4080c3e3e129360152736c24e5019057d8dbbd08a62a3f6d77796ab6cd91e762')
PKGEXT=".pkg.tar"

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,28)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

package() {
  cd data/noarch
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
  install -Dm644 support/icon.png "$pkgdir"/usr/share/pixmaps/hotline-miami.png
  cd "$srcdir"
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/hotline-miami.desktop
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/hotline-miami
}
