# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=Shipwright
pkgbase=soh-git
pkgname=(soh-git soh-otr-exporter-git)
pkgver=8.0.3.r26.g19cede44c
pkgrel=1
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://shipofharkinian.com/"
_depends_soh=("sdl2" "sdl2_net" "libpulse" "glew" "zenity")
_depends_soh_otr_exporter=("libpng")
depends=("${_depends_soh[@]}" "${_depends_soh_otr_exporter[@]}")
makedepends=("cmake" "ninja" "python" "curl" "lsb-release" "libxrandr" "libxinerama" "libxi" "glu" "boost")
source=("git+https://github.com/HarbourMasters/${_reponame}.git"
        "git+https://github.com/Kenix3/libultraship.git"
        "git+https://github.com/HarbourMasters/OTRExporter.git"
        "git+https://github.com/HarbourMasters/ZAPDTR.git"
        "soh.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '25aebd34f6ad49073d8a5ce6915b6fa290470fc6d62a8143abe07a25707ff4a2')

# NOTE: If compiling complains about missing headers, set __generate_headers below to 1
# Changable options for debugging:
__debug=0             # Build with debug flag
__generate_headers=0  # Generate OTR (unnecessary) and asset headers. **requires rom**

if [ "$__debug" = 1 ]; then
  options=(debug strip)
fi

SHIP_PREFIX=/opt/soh

pkgver() {
  cd "${srcdir}/${_reponame}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_reponame}"

  # Init all submodules
  git submodule init
  git config submodule.libultraship.url "$srcdir/libultraship"
  git config submodule.OTRExporter.url "$srcdir/OTRExporter"
  git config submodule.ZAPDTR.url "$srcdir/ZAPDTR"
  git -c protocol.file.allow=always submodule update

  if [ "$__generate_headers" = 1 ]; then
    # check for any roms in the directory where PKGBUILD resides
    # and copy them to Shipwright/OTRExporter. It doesn't matter
    # which rom we'll be using, let extract_assets.py do the guessing.
    roms=( "${startdir}/"*.*64 )
    if (( "${#roms[@]}" )); then
      cp "${roms[@]}" OTRExporter
    else
      echo "NO ROMS FOUND! Please place them in \"${startdir}\"."
      return 1
    fi
  fi
}

build() {
  cd "${srcdir}/${_reponame}"

  if [ "$__debug" = 1 ]; then
    BUILD_TYPE=Debug
  else
    BUILD_TYPE=Release
  fi

  CFLAGS="${CFLAGS/-Werror=format-security/}" \
  CXXFLAGS="${CXXFLAGS/-Werror=format-security/}" \
    cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
        -DNON_PORTABLE=On -DCMAKE_INSTALL_PREFIX=$SHIP_PREFIX .

  cmake --build build --target ZAPD --config $BUILD_TYPE $NINJAFLAGS

  if [ "$__generate_headers" = 1 ]; then
    cmake --build build --target ExtractAssetsHeaders $NINJAFLAGS
  else
    cmake --build build --target GenerateSohOtr $NINJAFLAGS
  fi

  cmake --build build --target soh --config $BUILD_TYPE $NINJAFLAGS
}

package_soh-git() {
  pkgdesc="An unofficial port of The Legend of Zelda Ocarina of Time for PC, Wii U, and Switch (git)"
  provides=("soh")
  conflicts=("soh")
  depends=("${_depends_soh[@]}")
  license=("unknown")
  install=soh.install
  optdepends=("soh-otr: OTR asset file in order to run"
              "soh-otr-mq: OTR asset file in order to run (Master Quest)")

  cd "${srcdir}/${_reponame}"

  DESTDIR="${pkgdir}" cmake --install build --component ship

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "${SHIP_PREFIX}/soh.elf" "${pkgdir}/usr/bin/soh"
  install -Dm644 "${srcdir}/soh.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 soh/macosx/sohIcon.png "${pkgdir}/usr/share/pixmaps/soh.png"

  # Copy game documentation
  install -dm755 "${pkgdir}/usr/share/doc/soh"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/soh"
  cp -r docs "${pkgdir}/usr/share/doc/soh/docs"
}

package_soh-otr-exporter-git() {
  pkgdesc="OTR generation tools for SoH. Includes asset XML files needed for generation. (git)"
  provides=("soh-otr-exporter")
  conflicts=("soh-otr-exporter")
  license=("MIT")
  depends=("${_depends_soh_otr_exporter[@]}")

  cd "${srcdir}/${_reponame}"

  DESTDIR="${pkgdir}" cmake --install build --component extractor

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/licenses/soh-otr-exporter"
  install -Dm644 "OTRExporter/LICENSE" "${pkgdir}/usr/share/licenses/soh-otr-exporter/LICENSE"
}
