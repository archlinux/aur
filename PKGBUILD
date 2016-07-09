# Maintainer: basxto <archlinux basxto de>
# based on theme-hospital-gog

pkgname=rct2-data-gog
pkgver=2.0.0.6
pkgrel=2
pkgdesc="RoallerCoaster Tycoon 2 is a theme park simulation game (gog.com version)"
url="https://www.gog.com/game/rollercoaster_tycoon_2"
license=('custom: commercial')
arch=('any')
makedepends=('innoextract')
optdepends=('openrct2: to play it natively')
install=$pkgname.install
source=("setup_rollercoaster_tycoon2_$pkgver.exe"::"gogdownloader://rollercoaster_tycoon_2/en1installer0")
sha256sums=('0587ec988c637497b63110e302b91c1d2dbd2d418ee1b5983c872b0c0a410b53')
PKGEXT=".pkg.tar"

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
  # extract installer
  innoextract -e -L -d "$srcdir" setup_rollercoaster_tycoon2_$pkgver.exe
  
}

package() {
  # data
  install -d "$pkgdir"/usr/share/$pkgname
  cd app
  # see https://github.com/OpenRCT2/OpenRCT2/wiki/Required-RCT2-files
  cp -r objdata "$pkgdir"/usr/share/$pkgname/ObjData
  cp -r scenarios "$pkgdir"/usr/share/$pkgname/Scenarios
  install -d "$pkgdir"/usr/share/$pkgname/Data
  cp data/{g1,css{{1..9},{11..15},{17..46}}}.dat "$pkgdir"/usr/share/$pkgname/Data
  # doc + licenses
  install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
  install -m644 {readme.txt,manual.pdf} "$pkgdir"/usr/share/doc/$pkgname
  install -m644 ../tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
  
}
