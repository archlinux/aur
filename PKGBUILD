pkgname=gog-darkest-dungeon
pkgver=21142
pkgrel=1
_gamename=${pkgname#gog-}
_gamename_=${_gamename//-/_}

pkgdesc="Darkest Dungeon is a challenging gothic roguelike turn-based RPG about the psychological stresses of adventuring."
arch=("i686" "x86_64")
url="https://www.gog.com/game/darkest-dungeon"
license=("custom")
groups=("games")
source=("gog_darkest_dungeon_${pkgver}.sh::gogdownloader://${_gamename_}/en3installer0"
        "${pkgname}"
        "${pkgname}.desktop")
md5sums=('4b43065624dbab74d794c56809170588'
         '23b66329f52fb4a9073ec7f1589625cc'
         '1fc48d384bc8e36749174ece86c6706e')
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
  # Hardcode the install destination.
  sed -i "/recommended_destinations/i destination = \"$pkgdir/opt/${pkgname}\"," \
    $srcdir/gog_darkest_dungeon_${pkgver}/scripts/config.lua
  # Skip the uninstallers.
  sed -i "s/support_uninstall = true,/support_uninstall = false,/g" \
    $srcdir/gog_darkest_dungeon_${pkgver}/scripts/config.lua
  # Prevent the installer from trying to install the desktop icon
  sed -i '/postinstall =/d' \
    $srcdir/gog_darkest_dungeon_${pkgver}/scripts/config.lua
  # Deactivate all but the two first options (Menu items and desktop icons)
  sed -i '85,${/^    Setup.Option/,/^    }/s/disabled = false/disabled = true/}' \
    $srcdir/gog_darkest_dungeon_${pkgver}/scripts/config.lua
  # Remove interaction by disabling EULAs (covered by custom license)
  sed -i '/Setup.Eula/ d' \
    $srcdir/gog_darkest_dungeon_${pkgver}/scripts/config.lua
}

package() {
  cd $srcdir/gog_darkest_dungeon_${pkgver}
  # Install using mojo and force stdio gui to prevent gtk windows from popping
  # up.
  ./startmojo.sh --ui stdio

  chmod +x $pkgdir/opt/$pkgname/start.sh
  chmod +x $pkgdir/opt/$pkgname/game/darkest.bin.x86
  chmod +x $pkgdir/opt/$pkgname/game/darkest.bin.x86_64

  install -Dm 755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 644 $srcdir/gog_darkest_dungeon_${pkgver}/data/noarch/support/icon.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm 644 $srcdir/gog_darkest_dungeon_${pkgver}/data/noarch/docs/End\ User\ License\ Agreement.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
