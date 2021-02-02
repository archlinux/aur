# Maintainer: basxto <archlinux basxto de>
# based on theme-hospital-gog

pkgname=rct2-data-gog
pkgver=2.01.043
pkgrel=1
pkgdesc="RoallerCoaster Tycoon 2 is a theme park simulation game (gog.com version)"
url="https://www.gog.com/game/rollercoaster_tycoon_2"
license=('custom: commercial')
arch=('any')
makedepends=('innoextract' 'dos2unix')
optdepends=('openrct2: to play it natively')
install=$pkgname.install
source=("setup_rollercoaster_tycoon2_$pkgver.exe"::"gogdownloader://rollercoaster_tycoon_2/en1installer0")
sha256sums=('251ae92e73cb3786f3251d867b928cff7691da5d4f3df41b884957272e0682b6')
PKGEXT=".pkg.tar"

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
  # extract installer
  innoextract -e -d "$srcdir" setup_rollercoaster_tycoon2_$pkgver.exe
  dos2unix "${srcdir}/tmp/"EULA{_en-US,}.txt
  dos2unix "${srcdir}/app/readme.txt"
}

package() {
  # data
  install -d "$pkgdir"/usr/share/$pkgname/{{,Obj}Data,Scenarios,Tracks}/
  install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
  cd app
  # see https://github.com/OpenRCT2/OpenRCT2/wiki/Required-RCT2-files
  # required
  install -Dm644 Data/g1.dat "$pkgdir"/usr/share/$pkgname/Data/
  install -Dm644 "Scenarios/Six Flags Magic Mountain.SC6" "$pkgdir"/usr/share/$pkgname/Scenarios/
  cp -r ObjData "$pkgdir"/usr/share/$pkgname/
  # optionial
  cp -r Scenarios "$pkgdir"/usr/share/$pkgname/
  cp -r Tracks "$pkgdir"/usr/share/$pkgname/
  install -Dm644 Data/css{{1..9},{11..15},{17..46}}.dat "$pkgdir"/usr/share/$pkgname/Data
  # doc + licenses
  # readme also contains an eula
  install -Dm644 {readme.txt,manual.pdf} "$pkgdir"/usr/share/doc/$pkgname
  # eula of inno and gog
  install -Dm644 ../tmp/EULA{_en-US,}.txt "$pkgdir"/usr/share/licenses/$pkgname/
  
}
