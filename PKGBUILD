# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=gog-unreal-tournament-goty
pkgver=2.0.0.6
pkgrel=10
pkgdesc="Unreal Tournament (99): Game of the Year Edition. GOG Version."
arch=('x86_64')
url="https://www.gog.com/game/unreal_tournament_goty"
# https://github.com/OldUnreal/UnrealTournamentPatches/blob/master/LICENSE.md
license=('MIT' 'BSD' 'ZLIB' 'GPL2' 'LGPL2.1' 'ZLIB' 'OFL' 'Apache' 'custom')
depends=('lib32-libgl'
         'lib32-libpulse'
         'lib32-sdl')
makedepends=('innoextract')
source=("setup_ut_goty_${pkgver}.exe::gogdownloader://unreal_tournament_goty/en1installer0"
        "https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469b/OldUnreal-UTPatch469b-Linux.tar.bz2"
        "gog-unreal-tournament-goty.desktop")
noextract=("OldUnreal-UTPatch469b-Linux.tar.bz2")
sha256sums=("4cc257d54d97659c5062f2bf186d0a8c6959561d11e42d8fcf2eac07f1926803"
            "99b0832dfa5e8122b79c05b0d3cd22a277e36b865a1079941ee62c986cd92c1f"
            "60a0211a47a4d1b2c6b31da4ecd4848fcb3338dc06430599969c77dc6a5d87e0")

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('goggogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find setup_ut_goty_${pkgver}.exe (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf.")

prepare() {
  # extract gog installer
  innoextract --extract --exclude-temp "setup_ut_goty_${pkgver}.exe"

  # extract linux patches
  tar --extract --file "OldUnreal-UTPatch469b-Linux.tar.bz2" --directory "app"

  # To put extra content (extra levels/mods) into the game
  #   create an "addons/" folder next to the PKGBUILD.
  # Whatever is in there will get copied to the root of the game's directory.
  cp --archive ${startdir}/addons/* "app" 2>/dev/null || :
}

package() {
  # make destination directories
  mkdir --parents \
    "${pkgdir}/opt/gog" \
    "${pkgdir}/usr/bin"

  # copy game files
  cp --archive "app" "${pkgdir}/opt/gog/${pkgname#gog-}"

  # fix permissions (too extreme? what files actually need this?)
  chmod 777 -R "${pkgdir}/opt/gog/${pkgname#gog-}"

  # symlink game binary which is located in /opt
  ln --symbolic \
    "/opt/gog/${pkgname#gog-}/System/ut-bin" \
    "${pkgdir}/usr/bin/${pkgname}"

  # install desktop entry and license document
  install -D --mode 644 \
    "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D --mode 644 \
    "app/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
