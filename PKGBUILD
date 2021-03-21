pkgname=gog-darkest-dungeon
pkgver=24839
pkgrel=1
_gamename=${pkgname#gog-}
_gamename_=${_gamename//-/_}

pkgdesc="Darkest Dungeon is a challenging gothic roguelike turn-based RPG about the psychological stresses of adventuring."
arch=("i686" "x86_64")
url="https://www.gog.com/game/darkest-dungeon"
license=("custom")
groups=("games")
source=("gog_darkest_dungeon_${pkgver}.sh::gogdownloader://${_gamename_}/en3installer0")
md5sums=('2a04beb04b3129b4bd68b4dd9023e82d')
noextract=("gog_darkest_dungeon_${pkgver}.sh")
# Register lgogdownloader as a download agent
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

makedepends=("lgogdownloader>=2.25")

prepare() {
  # Extract two tars from the shell script.
  offset=`head -n 519 $srcdir/gog_darkest_dungeon_${pkgver}.sh | wc -c | tr -d " "`
  mkdir -p $srcdir/gog_darkest_dungeon_${pkgver}
  bsdtar -C $srcdir/gog_darkest_dungeon_${pkgver} -xf $srcdir/gog_darkest_dungeon_${pkgver}.sh
  dd if=$srcdir/gog_darkest_dungeon_${pkgver}.sh \
     skip=1 obs=1024 conv=sync ibs=$offset | \
     bsdtar -C $srcdir/gog_darkest_dungeon_${pkgver} -xf -

  # Skip the uninstallers.
  sed -i "s/support_uninstall = true,/support_uninstall = false,/g" \
    $srcdir/gog_darkest_dungeon_${pkgver}/scripts/config.lua

  # Prevent the installer from trying to install the desktop icon
  sed -i '/MojoSetup.platform.installdesktopmenuitem/,+2d' \
    $srcdir/gog_darkest_dungeon_${pkgver}/scripts/mojosetup_mainline.lua

  # Remove interaction by setting optional opions to required
  # Set all option for the last two options (desktp + menu item) to be required
  sed -i '129,${/^    Setup.Option/,/^    }/s/required = false/required = true/}' \
    $srcdir/gog_darkest_dungeon_${pkgver}/scripts/config.lua

  # Remove interaction by disabling EULAs (covered by custom license)
  sed -i '/Setup.Eula/ d' \
    $srcdir/gog_darkest_dungeon_${pkgver}/scripts/config.lua
}

package() {
  cd $srcdir/gog_darkest_dungeon_${pkgver}
  # Install using mojo and force stdio gui to prevent gtk windows from popping
  # up.
  ./startmojo.sh --destination $pkgdir/opt/gog/$_gamename --ui stdio

  chmod +x $pkgdir/opt/gog/$_gamename/start.sh
  chmod +x $pkgdir/opt/gog/$_gamename/game/darkest.bin.x86
  chmod +x $pkgdir/opt/gog/$_gamename/game/darkest.bin.x86_64

  # Remove makepkg paths from desktop file and move to share
  sed -i "s,$pkgdir,,g" $pkgdir/opt/gog/$_gamename/.mojosetup/gog_com-Darkest_Dungeon_1.desktop
  install -Dm 644 $pkgdir/opt/gog/$_gamename/.mojosetup/gog_com-Darkest_Dungeon_1.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Install EULA
  install -Dm 644 $srcdir/gog_darkest_dungeon_${pkgver}/data/noarch/docs/End\ User\ License\ Agreement.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Remove metafiles
  rm -r $pkgdir/opt/gog/$_gamename/.mojosetup
}

# vim:set ts=2 sw=2 et:
