# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=Shipwright
pkgbase=soh-git
pkgname=(soh-git soh-otr-exporter-git)
pkgver=7.0.1.r4.g7dff8b6ef
pkgrel=2
arch=("x86_64" "i686")
url="https://shipofharkinian.com/"
_depends_soh=("sdl2" "sdl2_net" "libpulse" "glew" "zenity")
_depends_soh_otr_exporter=("libpng")
depends=("${_depends_soh[@]}" "${_depends_soh_otr_exporter[@]}")
makedepends=("cmake" "ninja" "python" "curl" "lsb-release" "libxrandr" "libxinerama" "libxi" "glu" "boost")
source=("git+https://github.com/HarbourMasters/${_reponame}.git"
        "git+https://github.com/Kenix3/libultraship.git"
        "soh.desktop"
        "soh-misc-otr-patches.patch"
        "lus-install-paths.patch")
sha256sums=('SKIP'
            'SKIP'
            '25aebd34f6ad49073d8a5ce6915b6fa290470fc6d62a8143abe07a25707ff4a2'
            'b7e06174915f8dc6bd8927c248fec32c1d15c943b6aaaed1c6fb7c37dcb55510'
            '81541684e21435ff1aa9fc49435c853bfec2c45115a572ff5184415035413745')

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

  # Init libultraship submodule
  git submodule init
  git config submodule.libultraship.url "$srcdir/libultraship"
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

  patch -Np1 -i "${srcdir}/soh-misc-otr-patches.patch"
  (cd libultraship && patch -Np1 -i "${srcdir}/lus-install-paths.patch")
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
    cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DSHIP_BIN_DIR=$SHIP_PREFIX .

  cmake --build build --target ZAPD --config $BUILD_TYPE

  if [ "$__generate_headers" = 1 ]; then
    cmake --build build --target ExtractAssetsHeaders
  else
    rm -f soh.otr || true
    rm -rf Extract || true
    mkdir Extract
    cp -r OTRExporter/assets Extract/assets

    build/ZAPD/ZAPD.out botr -se OTR --norom
  fi

  cmake --build build --target soh --config $BUILD_TYPE
  cmake --build build --target Assets
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

  install -Dm755 -t "${pkgdir}/${SHIP_PREFIX}" soh.otr build/soh/soh.elf build/gamecontrollerdb.txt
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s /opt/soh/soh.elf "${pkgdir}/usr/bin/soh"

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
  install=soh-otr-exporter.install

  cd "${srcdir}/${_reponame}"

  install -dm755 "${pkgdir}/${SHIP_PREFIX}/assets"
  cp -r OTRGui/assets/extractor "${pkgdir}/${SHIP_PREFIX}/assets/extractor"
  cp -r soh/assets/xml          "${pkgdir}/${SHIP_PREFIX}/assets/extractor/xmls"
  cp -r OTRExporter/assets      "${pkgdir}/${SHIP_PREFIX}/assets/game"

  install -Dm755 build/ZAPD/ZAPD.out  "${pkgdir}/${SHIP_PREFIX}/assets/extractor/ZAPD.out"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s ${SHIP_PREFIX}/assets/extractor/ZAPD.out "${pkgdir}/usr/bin/ZAPD"

  # Change the external xml folder path so that it always points to this package's install path
  find "${pkgdir}/${SHIP_PREFIX}/assets/extractor" -maxdepth 1 -name Config_\*.xml -exec \
    sed -i "/ExternalXMLFolder/s,assets/extractor,${SHIP_PREFIX}/&," {} +

  install -dm755 "${pkgdir}/usr/share/licenses/soh-otr-exporter"
  install -Dm644 "OTRExporter/LICENSE" "${pkgdir}/usr/share/licenses/soh"
}
