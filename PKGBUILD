# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=gog-unreal-tournament-goty
pkgver=2.0.0.5
pkgrel=5
pkgdesc="Unreal Tournament (99): Game of the Year Edition. GOG Version."
arch=('x86_64')
url="https://www.gog.com/game/unreal_tournament_goty"
# https://github.com/OldUnreal/UnrealTournamentPatches/blob/v469a/LICENSE.md
license=('MIT' 'BSD' 'ZLIB' 'GPL2' 'LGPL2.1' 'ZLIB' 'OFL' 'Apache' 'custom')
depends=('lib32-sdl'
         'lib32-libgl')
makedepends=('innoextract')
source=("setup_ut_goty_$pkgver.exe::gogdownloader://unreal_tournament_goty/en1installer0"
        "https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469a/OldUnreal-UTPatch469a-Linux.tar.bz2"
        "gog-unreal-tournament-goty.desktop")
noextract=("OldUnreal-UTPatch469a-Linux.tar.bz2")
sha256sums=("4cc257d54d97659c5062f2bf186d0a8c6959561d11e42d8fcf2eac07f1926803"
            "d521a8339b80a4c86019c3648fb55cfc29edffeec73047ceb72784b159cc84f1"
            "60a0211a47a4d1b2c6b31da4ecd4848fcb3338dc06430599969c77dc6a5d87e0")

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('goggogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find setup_ut_goty_$pkgver.exe (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf.")

prepare() {
  # extract gog installer
  innoextract --extract --exclude-temp setup_ut_goty_$pkgver.exe

  # extract linux patches
  tar --extract --file OldUnreal-UTPatch469a-Linux.tar.bz2 --directory app

  # To put extra content (extra levels/mods) into the game
  #   create an "addons/" folder next to the PKGBUILD.
  # Whatever is in there will get copied to the root of the game's directory.
  cp -r $startdir/addons/* app/ 2>/dev/null || :
}

package() {
  # make destination directories
  mkdir -p "$pkgdir/opt/gog"
  mkdir -p "$pkgdir/usr/bin"

  # copy game files
  cp -r app "$pkgdir/opt/gog/${pkgname#gog-}"

  # fix permissions
  chmod 777 -R $pkgdir/opt/gog/${pkgname#gog-}

  # symlink ut binary which is located in /opt
  ln --symbolic "$pkgdir/opt/gog/${pkgname#gog-}/System/ut-bin" "$pkgdir/usr/bin/$pkgname"

  # install desktop and license
  install -D --mode 644 --target-directory "$pkgdir/usr/share/applications" $pkgname.desktop
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" app/LICENSE.md
}
