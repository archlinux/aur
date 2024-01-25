# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=gog-unreal-tournament-goty
pkgver=469d
pkgrel=2
pkgdesc="Unreal Tournament (99): Game of the Year Edition. GOG Version."
arch=('x86_64')
url="https://www.gog.com/forum/general/delisting_unreal_games_unreal_tournament_2004_ut_goty_unreal_2_the_awakening_special_edition/post1"

# The patch has a lot of licenses: (see https://github.com/OldUnreal/UnrealTournamentPatches/blob/master/LICENSE.md)
license=()
# - The Linux and Mac versions include code from musl libc by Rich Felker
license+=('MIT')
# - ALAudio includes code from libogg by the Xiph.org Foundation:
license+=('BSD-3-Clause')
# - The Linux and Mac clients include the Simple DirectMedia Layer (SDL2) and SDL2_ttf libraries by Sam Lantinga and others. Both are distributed as shared libraries:
license+=('Zlib')
# - ALAudio ships with OpenAL-Soft by kcat, distributed as a shared library:
license+=('LGPL-2.0-only')
# - ALAudio ships with the LGPL portion of libmpg, distributed as a shared library:
license+=('LGPL-2.1-only')
# - ALAudio ships with libalure 1.2 by Chris Robinson, distributed as a shared library:
#license+=('MIT')
# - ALAudio ships with libxmp by Claudio Matsuoka and Hipolito Carraro Jr, distributed as a shared library:
#license+=('LGPL-2.1-only')
# - ALAudio ships with libsndfile:
#license+=('LGPL-2.1-only')
# - The libsndfile we ship with ALAudio includes statically linked code from libopus:
#license+=('BSD-3-Clause')
# - ALAudio includes code from libvorbis by the Xiph.org Foundation:
#license+=('BSD-3-Clause')
# - The new texture compression/decompression code is based on KTexComp by Sebastian Kaufel. KTexComp itself is based on Intel's ispc_texcomp:
#license+=('MIT')
# - The screenshot code uses libpng and zlib:
#license+=('Zlib')
# - The UTGLR OpenGL and Direct3D 9 renderers were contributed by Chris Dohnal (smpdev@cwdohnal.com). Chris granted his written permission to include them in our patches.
# - The Mac and Linux versions of the patch use the OpenSans, Tinos, and Courier Prime fonts, distributed in TTF format:
license+=('OFL-1.1' 'Apache-2.0')
# - ALAudio contains code of Mark Borgerding's Kiss FFT:
#license+=('BSD-3-Clause')
# - ALAudio contains code of libFLAC:
#license+=('BSD-3-Clause')
# - The UZ compression code uses libdivsufsort-lite by Yuta Mori:
#license+=('MIT')
# - XOpenGLDrv contains code of the OpenGL Mathematics (GLM) library by G-Truc Creation:
license+=('LicenseRef-Happy-Bunny')
# - Our version of Unreal Editor uses AkelEdit, distributed as a shared library:
#license+=('BSD-3-Clause')

depends=('mpg123' 'openal' 'sdl2' 'libxmp')
optdepends=('wxwidgets-gtk3: wxWidgets-based launcher')
makedepends=('innoextract' 'imagemagick')
source=("setup_ut_goty.exe::gogdownloader://unreal_tournament_goty/en1installer0"
        "patch-${pkgver}.tar.bz2::https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-amd64.tar.bz2"
        "gog-unreal-tournament-goty.desktop"
        "fallback_dlagent.sh")
noextract=("patch-${pkgver}.tar.bz2")
sha256sums=("4cc257d54d97659c5062f2bf186d0a8c6959561d11e42d8fcf2eac07f1926803"
            "6a81b35ae6a4c0dfce2f8fb152af16129776735aeb34dfc391f7c8daf0d51a3b"
            "2d40b8b7ea8434e11e27db9c07c0c8fb3aab28013fd3d80a6425e506ef2433ed"
            "518a904603b3971eb516d0c5198031345dd2d3b5e6d87d12e02dccfe169a9505")

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::./fallback_dlagent.sh")

# see https://github.com/OldUnreal/UnrealTournamentPatches#linux-installation
prepare() {
  # Unpack [the] patch into an empty directory, which we will refer to as the game directory.
  tar --extract --file "patch-${pkgver}.tar.bz2" --one-top-level=unreal

  # Mount the UT (GOTY) cd/image or unpack the GOG distribution with the innoextract tool. We will refer to the root directory of your game cd/image or GOG distribution as the distribution directory.
  innoextract --extract --exclude-temp "setup_ut_goty.exe"

  # Copy the Music and Sounds directories from the distribution directory into the game directory.
  cp --recursive "app/Music" "app/Sounds" "unreal/"

  # Copy the contents of the Textures directory from the distribution directory into the existing Textures directory within your game directory WITHOUT REPLACING the existing files.
  cp --no-clobber app/Textures/* "unreal/Textures/" || true # existing files will give exit code 1

  # Create a Maps directory within the game directory and copy over the unpacked Maps (i.e., map files with a .unr extension) from the distribution directory.
  cp --recursive "app/Maps" "unreal/"

  # Copy the .u and .int files to the game's System directory.
  cp --no-clobber app/System/*.{u,int} "unreal/System/" || true # existing files will give exit code 1

  # Remove prebuilt libraries in favor of arch/AUR packages
  rm \
    "unreal/System64/libmpg123.so" \
    "unreal/System64/libopenal.so.1" \
    "unreal/System64/libSDL2-2.0.so.0" \
    "unreal/System64/libxmp.so.4"

  # To put extra content (extra levels/mods) into the game
  #   create an "addons/" folder next to the PKGBUILD.
  # Whatever is in there will get copied to the root of the game's directory.
  cp --archive ${startdir}/addons/* "unreal" 2>/dev/null || true # allow no `addons/` folder

  # Convert icon
  convert "app/gfw_high.ico" "icon.png"
}

package() {
  # make destination directories
  mkdir --parents \
    "${pkgdir}/opt/gog" \
    "${pkgdir}/usr/bin"

  # copy game files
  cp --archive "unreal" "${pkgdir}/opt/gog/${pkgname#gog-}"

  # symlink binaries which are located in /opt
  ln --symbolic \
    "/opt/gog/${pkgname#gog-}/System64/ut-bin-amd64" \
    "${pkgdir}/usr/bin/${pkgname}"
  ln --symbolic \
    "/opt/gog/${pkgname#gog-}/System64/ucc-bin-amd64" \
    "${pkgdir}/usr/bin/${pkgname}-ucc"
  ln --symbolic \
    "/opt/gog/${pkgname#gog-}/System64/wx-ut-bin-amd64" \
    "${pkgdir}/usr/bin/wx-${pkgname}"

  # install desktop entry, icon and license document
  install -D --mode 644 \
    "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D --mode 644 \
    "icon-5.png" \
    "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -D --mode 644 \
    "unreal/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove duplicates
  rm "${pkgdir}/opt/gog/${pkgname#gog-}/LICENSE.md"
}
