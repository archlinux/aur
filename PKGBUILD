# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=daggerfall
pkgver=1.07.213
pkgrel=12
pkgdesc="The Elder Scrolls II: Daggerfall"
arch=('any')
url="http://www.elderscrolls.com/daggerfall/"
license=('custom:daggerfall')
depends=("dosbox")
makedepends=("python" "unzip" "bsdiff")
options=(emptydirs)
install="dagger.install"
source=(http://cms.elderscrolls.com/sites/default/files/tes/extras/DFInstall.zip
        http://www.uesp.net/dagger/files/addquest.zip
        http://www.uesp.net/dagger/files/fixsa175.zip
        http://download.narechk.net/dos32a-912-bin.zip
        license daggerfall-launcher.pl RUN.BAT Z.CFG HMISET.CFG unpk.py maps.patch
        dagger.conf)
noextract=(addquest.zip fixsa175.zip)
md5sums=('3cdd09a5696c2b94c58b85488be7cba2'
         '1074c3e593375542e8e45256c6f9ada4'
         'e5647c7acba32973eb6b2fba621ae536'
         'f37ae16b8eab499edb6b0de0099827ca'
         '2923e8e848462a4a05aa6b5473cd82b5'
         '0e54a1e6032573d6b6ca60637dc43202'
         'dd4b858a32c6e80aaa025c57496958fe'
         'eae2f2244cc23bc1f266438ca4d9b2ce'
         'bd94604036a62217617fd28092c9d956'
         '309788ccffa8adf3085255bb137be95c'
         '4e773bc05d54c36a53c7aec2c2d2f538'
         '36e4de3a8b1030bbf12c6badd23da2ec')

package() {
  cd "$srcdir"
  _target="${pkgdir}"/usr/share/games/daggerfall
  install -d -m775 "$_target"
  cp -rf "$srcdir/DFCD/DAGGER" "$_target"
  chmod 775 "$_target/DAGGER"
  chmod 775 "$_target/DAGGER/ARENA2"
  cp -rf "$srcdir/DFCD/DATA" "$_target/DAGGER"
  install "$srcdir/DFCD/INSTALL.EXE" "$_target/DAGGER/INSTALL.EXE"
  install "$srcdir/DFCD/INSTALL.PIF" "$_target/DAGGER/INSTALL.PIF"
  for i in {0..5}; do install -d "$_target/DAGGER/SAVE$i"; done
  mv "$_target/DAGGER/ARENA2/faction.txt" "$_target/DAGGER/ARENA2/FACTION.TXT"
  install "$srcdir/RUN.BAT" "$_target/DAGGER/RUN.BAT"
  install "$srcdir/Z.CFG" "$_target/DAGGER/Z.CFG"
  install "$srcdir/HMISET.CFG" "$_target/DAGGER/HMISET.CFG"
  python unpk.py "$srcdir/DFCD/DAGGER/ARENA2/PACKED.DAT" "$_target/DAGGER"
  rm "$_target/DAGGER/ARENA2/PACKED.DAT"
  unzip -o "$srcdir/addquest.zip" -d "$_target/DAGGER/ARENA2"
  rm "$_target/DAGGER/ARENA2/readme.txt"
  _offset=$((`grep -Ubo --binary-files=text 'start of data' "$srcdir/DAGGER/DAG213.EXE" | head -1 | sed 's/:.*//g'`+13))
  python unpk.py "$srcdir/DAGGER/DAG213.EXE" "$_target/DAGGER" ${_offset}
  unzip -o "$srcdir/fixsa175.zip" -d "$_target/DAGGER"
  bspatch "$_target/DAGGER/ARENA2/MAPS.BSA" "$_target/MAPS.BSA" "$srcdir/maps.patch"
  mv "$_target/MAPS.BSA" "$_target/DAGGER/ARENA2/MAPS.BSA"
  install "$srcdir/binw/dos32a.exe" "$_target/DAGGER/DOS32A.EXE"
  install "$srcdir/dagger.conf" "$_target/dagger.conf"
  install -D -m644 "$srcdir/license" "$pkgdir/usr/share/licenses/daggerfall/license"
  install -D -m754 "$srcdir/daggerfall-launcher.pl" "$pkgdir/usr/bin/daggerfall"
}

