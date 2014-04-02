# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=ghostpp
pkgver=17.1_r602
pkgrel=1
pkgdesc="GHost++ is a Warcraft III hosting bot"
url="https://www.ghostpp.com/"
arch=('i686' 'x86_64')
license=('Apache')
depends=('boost-libs'
         'gmp'
         'libmysqlclient')
#optdepends=()
makedepends=('boost')
install=ghostpp.install
source=("svn+http://ghostplusplus.googlecode.com/svn/trunk@602"
        "ghostpp.install"
        "ghostpp.service"
        "http://bhfiles.com/files/Battle.net/Bots/Hashes/WAR3.zip"
        "common.j.orig::http://wiki.thehelper.net/w/index.php?title=Template:import/wc3/jass/common.j&action=raw"
        "Blizzard.j.orig::http://wiki.thehelper.net/w/index.php?title=Template:import/wc3/jass/Blizzard.j&action=raw"
        "config.patch"
        "libboost.patch"
        "common.j.patch"
        "Blizzard.j.patch")
sha256sums=('SKIP'
            '5d933d698513800f19dcefe47e3640cb37df7d5330908e7424cb891381c6d812'
            '2f67fbb67bf19621c112bc41503627aadc995a9414312274956dadbacb520826'
            '94d0cf497aacd413f31ac512e8ebb3a71ace6c5646d55a1c77f78d56a11719a9'
            'e580248f186886a2633d96b2c538e036ff2021a21b97d775d1da5095852f8476'
            '066b48dc4966b9a367ebb76efb969248ad49dca8b188d5c79c1465a4d3605891'
            '67a388943cd00158e669a982caa5f5d4b2768b91341a3ed916700c10983ab59d'
            '69b4b5bbfc49bbf6863ab8ab0c5e253b33953ea61e8c45472159493270d3391f'
            '0e9f8c76879f5cee9a1edca1907bda190da124ccdee924de6cc0a965dbec0e76'
            '8e6dca297cf261ae33ad8428b233e2619a6ffdd3dc32b65743d74789c9802d16')

GHOSTDIR="trunk@602"

patch_once() {
  PATCHFILE="$(mktemp)"
  cat > "$PATCHFILE"

  if ! patch --silent --force --reverse --dry-run $@ < "$PATCHFILE"; then
    patch --silent --force --forward $@ < "$PATCHFILE"
    return
  fi
}

prepare() {
  cd "$srcdir"/
  cp common.j.orig common.j
  cp Blizzard.j.orig Blizzard.j

  patch -p0 --force --forward common.j common.j.patch
  patch -p0 --force --forward Blizzard.j Blizzard.j.patch

  cd "$srcdir"/"$GHOSTDIR"/
  patch_once -p0 < "$srcdir"/libboost.patch
  patch_once -p0 < "$srcdir"/config.patch
}

build() {
  cd "$srcdir"/"$GHOSTDIR"/

  (cd bncsutil/src/bncsutil/; make) # bncsutil
  (cd StormLib/stormlib/; make)     # stormlib
  (cd ghost/; make)                 # ghost++ itself
}

package() {
  cd "$srcdir"/"$GHOSTDIR"/

  install -d "$pkgdir"/etc/ghostpp/
  install -d "$pkgdir"/etc/ghostpp/languages/
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/lib/
  install -d "$pkgdir"/usr/lib/systemd/system/
  install -d "$pkgdir"/usr/share/doc/ghostpp/
  install -d "$pkgdir"/usr/share/ghostpp/
  install -d "$pkgdir"/var/lib/ghostpp/maps/
  install -d "$pkgdir"/var/lib/ghostpp/mapcfgs/
  install -d "$pkgdir"/var/lib/ghostpp/replays/
  install -d "$pkgdir"/var/lib/ghostpp/savegames/

  install -m755 ghost/ghost++ "$pkgdir"/usr/bin/
  install -m644 ../ghostpp.service "$pkgdir"/usr/lib/systemd/system/

  install -m644 bncsutil/src/bncsutil/libbncsutil.so StormLib/stormlib/libStorm.so "$pkgdir"/usr/lib/
  install -m644 readme.txt "$pkgdir"/usr/share/doc/ghostpp/
  install -m644 ../game.dll ../Storm.dll ../war3.exe "$pkgdir"/usr/share/ghostpp/
  install -m644 ../common.j ../Blizzard.j "$pkgdir"/var/lib/ghostpp/mapcfgs/
  install -m644 mapcfgs/wormwar.cfg "$pkgdir"/var/lib/ghostpp/mapcfgs/
  install -m644 ip-to-country.csv "$pkgdir"/var/lib/ghostpp/

  # configs
  install -m644 default.cfg "$pkgdir"/etc/ghostpp/ghost.cfg
  install -m644 ipblacklist.txt "$pkgdir"/etc/ghostpp/ipblacklist
  install -m644 gameloaded.txt "$pkgdir"/etc/ghostpp/gameloaded
  install -m644 gameover.txt "$pkgdir"/etc/ghostpp/gameover
  touch "$pkgdir"/etc/ghostpp/motd

  # languages
  install -m644 language.cfg "$pkgdir"/etc/ghostpp/languages/english.cfg
  install -m644 language_german.cfg "$pkgdir"/etc/ghostpp/languages/german.cfg
  install -m644 language_russian.cfg "$pkgdir"/etc/ghostpp/languages/russian.cfg
  install -m644 language_spanish.cfg "$pkgdir"/etc/ghostpp/languages/spanish.cfg
  install -m644 language_turkish.cfg "$pkgdir"/etc/ghostpp/languages/turkish.cfg
  ln --relative --symbolic "$pkgdir"/etc/ghostpp/languages/english.cfg "$pkgdir"/etc/ghostpp/language.cfg
}

# vim:set ts=2 sw=2 et:
