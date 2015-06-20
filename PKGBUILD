# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-ddnet-git
_name=teeworlds-ddnet
pkgver=7.0.r5578.8ecd66f
pkgrel=1
pkgdesc="A customized version by DDRaceNetwork of this 2D shooting game (Git)"
arch=('i686' 'x86_64')
url="http://ddnet.tw"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2')
makedepends=('git' 'bam' 'gendesk' 'imagemagick')
optdepends=('teeworlds-ddnet-skins: extra skins')
provides=('teeworlds' 'teeworlds-ddnet')
conflicts=('teeworlds')
source=($pkgname::git+https://github.com/def-/ddnet)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  v=$(grep GAME_RELEASE_VERSION src/game/version.h | cut -d\" -f2)
  printf %s.r%s.%s $v $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  convert "$pkgname/other/icons/DDNet.ico" "$srcdir/$pkgname.png"
  gendesk -f -n --pkgname "$_name" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'
}

build() {
  cd $pkgname
  bam release
}

package() {
  cd $pkgname
  
    # install binaries
  install -Dm755 DDNet "$pkgdir"/usr/bin/teeworlds-ddnet
  install -Dm755 DDNet-Server "$pkgdir"/usr/bin/teeworlds-ddnet_srv
  install -Dm755 dilate "$pkgdir"/usr/bin/dilate

    # Install data files
  mkdir -p ${pkgdir}/usr/share/teeworlds/data
  cp -r data/* ${pkgdir}/usr/share/teeworlds/data

    # Remove skins provided by teeworlds-ddnet-skins
  for skin in \
   "Ablush NeoN.png" "Apish Coke.png" "BadAnqelMonster.png" "Blind r0xr.png" \
   "DuMoH.png" "Evil Puffi.png" "Flying Silex.png" "Hidden Assassin.png"     \
   "Irradiated Sunny.png" "Mobys Skull.png" "PaladiN.png" "Red Coke.png"     \
   "Shadow.png" "Sonic.png" "Straw Crytek.png" "Terrorist.png" "Volt.png"    \
   "antiantey.png" "aqua.png" "bauer.png" "beast.png" "blacktee.png"         \
   "bomb.png" "bunny.png" "caesar.png" "chera.png" "clefairy.png"            \
   "demonlimekitty.png" "dino.png" "dragon.png" "draw.png" "emo.png"         \
   "evil.png" "evilwolfe.png" "fuzzy_coala.png" "ghost.png" "ghostjtj.png"   \
   "giraffe.png" "greensward.png" "greyfox.png" "greyfox_2.png"              \
   "hammie-chew.png" "hedgehog.png" "jeet.png" "kintaro_2.png" "kirby.png"   \
   "lightbulb.png" "m&mred.png" "m&myellow.png" "masterchief.png"            \
   "mermydon-coala.png" "mermydon.png" "mike.png" "monstee.png" "mouse.png"  \
   "musmann.png" "nanami.png" "nanas.png" "napoleon.png" "nersif.png"        \
   "nosey.png" "oldman.png" "oldschool.png" "penguin.png" "pepsi.png"        \
   "pikminpurple.png" "pikminwhite.png" "pikminyellow.png" "random.png"      \
   "red_bird.png" "roman.png" "savage.png" "t2.png" "tails.png" "tank.png"   \
   "tauren.png" "teerasta.png" "teledipsy.png" "telelaalaa.png" "telepo.png" \
   "teletinkywinky.png" "troll.png" "ts2_contest_skin.png" "tweety.png"      \
   "veteran.png" "voodoo_tee.png" "wartee.png" "whis.png"
  do
        rm "$pkgdir/usr/share/teeworlds/data/skins/$skin"
  done  

    # Install desktop and icon files
  install -Dm644 "$srcdir/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
  install -Dm644 "$srcdir/$pkgname-0.png" "$pkgdir/usr/share/pixmaps/$_name.png"
  
    # Install license files
  install -Dm644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -Dm644 "license_DDRace.txt" "$pkgdir/usr/share/licenses/$pkgname/license_DDRace.txt"
}
