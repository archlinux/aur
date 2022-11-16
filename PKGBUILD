# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=gog-unreal-tournament-goty
pkgver=469c
pkgrel=2
pkgdesc="Unreal Tournament (99): Game of the Year Edition. GOG Version."
arch=('x86_64')
url="https://www.gog.com/game/unreal_tournament_goty"
# https://github.com/OldUnreal/UnrealTournamentPatches/blob/master/LICENSE.md
license=('MIT' 'BSD' 'ZLIB' 'GPL2' 'LGPL2.1' 'ZLIB' 'OFL' 'Apache' 'custom')
depends=('mpg123' 'openal' 'sdl2' 'libxmp')
makedepends=('innoextract')
source=("setup_ut_goty.exe::gogdownloader://unreal_tournament_goty/en1installer0"
        "patch-${pkgver}.tar.bz2::https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469c/OldUnreal-UTPatch469c-Linux-amd64.tar.bz2"
        "gog-unreal-tournament-goty.desktop"
        "fallback_dlagent.sh")
noextract=("patch-${pkgver}.tar.bz2")
sha256sums=("4cc257d54d97659c5062f2bf186d0a8c6959561d11e42d8fcf2eac07f1926803"
            "4c99bde06d26b724f14471d374d4d6105dbdc98c56ec2a40af3fa541956eeed9"
            "4c507f98e74b3f6aa87cc1d8e48750afd4f0b33078337d5406efd0e46d256600"
            "518a904603b3971eb516d0c5198031345dd2d3b5e6d87d12e02dccfe169a9505")

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('goggogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::./fallback_dlagent.sh")

# see
# https://github.com/OldUnreal/UnrealTournamentPatches#linux-installation
prepare() {
  innoextract --extract --exclude-temp "setup_ut_goty.exe"

  tar --extract --file "patch-${pkgver}.tar.bz2" --one-top-level=unreal

  cp --recursive "app/Music" "app/Sounds" "app/Maps" "unreal/"
  cp --no-clobber app/Textures/* "unreal/Textures/"

  # Remove prebuilt libraries in favor of arch/AUR packages
  rm \
    "unreal/System64/libmpg123.so" \
    "unreal/System64/libopenal.so.1" \
    "unreal/System64/libSDL2-2.0.so.0" \
    "unreal/System64/libxmp.so.4"

  # To put extra content (extra levels/mods) into the game
  #   create an "addons/" folder next to the PKGBUILD.
  # Whatever is in there will get copied to the root of the game's directory.
  cp --archive ${startdir}/addons/* "unreal" 2>/dev/null || :
}

package() {
  # make destination directories
  mkdir --parents \
    "${pkgdir}/opt/gog" \
    "${pkgdir}/usr/bin"

  # copy game files
  cp --archive "unreal" "${pkgdir}/opt/gog/${pkgname#gog-}"

  # fix permissions (too extreme? what files actually need this?)
  chmod 777 -R "${pkgdir}/opt/gog/${pkgname#gog-}"

  # symlink game binary which is located in /opt
  ln --symbolic \
    "/opt/gog/${pkgname#gog-}/System64/ut-bin-amd64" \
    "${pkgdir}/usr/bin/${pkgname}"

  # install desktop entry and license document
  install -D --mode 644 \
    "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D --mode 644 \
    "unreal/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
