# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=papers-please-gog
pkgver=2.0.0.5
pkgrel=1
pkgdesc="A Dystopian Document Thriller (gog.com version)"
url="http://gog.com/game/papers_please"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh')
depends_i686=('libgl' 'gcc-libs')
depends_x86_64=('lib32-libgl' 'lib32-gcc-libs')
makedepends=('coreutils' 'unzip')
source=("gog_papers_please_$pkgver.sh"::"gogdownloader://papers_please/installer_linux_en"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('dd92bfa6e5583bfeb3a9dc8af84cb51bd44b9183508296e0c8021d71218dd464'
            '9227f364836b975d05609481c0d67e7b6fd8e52f7bb931b39af98d864b296d2e'
            '3273cd3c3f35495d00debbd0d10ad2d188b8cf1b40bc9a754c7e4c6fe82173f6')
PKGEXT=".pkg.tar"

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
  # getting the zip archive out of the installer
  tail -c+955279 gog_papers_please_$pkgver.sh > papers_please.zip
  unzip -q papers_please.zip
}

package() {
  cd data/noarch
  install -d "$pkgdir"/opt/papers-please
  # data - binaries
  cp -rup game/* "$pkgdir"/opt/papers-please
  # doc + license
  install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
  install -m644 docs/README support/support_notice.txt "$pkgdir"/usr/share/doc/$pkgname
  install -m644 docs/"End User License Agreement.txt" game/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
  # .desktop file and launcher
  install -Dm644 support/icon.png "$pkgdir"/usr/share/pixmaps/papers-please.png
  cd "$srcdir"
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/papers-please.desktop
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/papers-please
}
