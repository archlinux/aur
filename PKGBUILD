# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=Shipwright
#_lus_commit=c75ff3653f699cb1a8c017b10e4b3986259d8cf0
_lus_tag=1.3.1
_ZAPDTR_commit=eff29036118349e142ee8efca80fd975a2a2b6ff
_OTRExporter_commit=0d8f5570a8e57f302ec6633d65615ee21ab39454

pkgbase=soh
pkgname=(soh soh-otr-exporter)
pkgver=8.0.0
pkgrel=1
arch=("x86_64" "i686")
url="https://shipofharkinian.com/"
_depends_soh=("sdl2" "sdl2_net" "libpulse" "glew" "zenity")
_depends_soh_otr_exporter=("libpng")
depends=("${_depends_soh[@]}" "${_depends_soh_otr_exporter[@]}")
makedepends=("cmake" "ninja" "python" "curl" "lsb-release" "libxrandr" "libxinerama" "libxi" "glu" "boost")
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        #"libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "libultraship-${_lus_tag}.tar.gz::https://github.com/Kenix3/libultraship/archive/refs/tags/${_lus_tag}.tar.gz"
        "ZAPDTR-${_ZAPDTR_commit}.tar.gz::https://github.com/HarbourMasters/ZAPDTR/archive/${_ZAPDTR_commit}.tar.gz"
        "OTRExporter-${_OTRExporter_commit}.tar.gz::https://github.com/HarbourMasters/OTRExporter/archive/${_OTRExporter_commit}.tar.gz"
        "soh.desktop"
        "OTRExporter-fix-paths-period-split.patch::https://github.com/HarbourMasters/OTRExporter/pull/12.patch")
sha256sums=('f4c7d8ee191174e4cc54d54b44d117f11d6e425da8e1f695a190bc911eb879ac'
            '9cd9bb014d0feef889e440df1b636853c62cc097b6b61c370fc195fe082e2ae0'
            '6438cd1c7abad6ea9b65326892a1b220384bdce78e9d1a324c132d68c982111c'
            '1628262dfdce10b8584b671ea6a4cb0483c35876cf9f4dd279fc3a7d60a1379f'
            '25aebd34f6ad49073d8a5ce6915b6fa290470fc6d62a8143abe07a25707ff4a2'
            '388738f3d48f4bdbe144a55cba91fd77383dcb066f190d2c6f221f3bc4a69903')

# NOTE: If compiling complains about missing headers, set __generate_headers below to 1
# Changable options for debugging:
__debug=0             # Build with debug flag
__generate_headers=0  # Generate OTR (unnecessary) and asset headers. **requires rom**

if [ "$__debug" = 1 ]; then
  options=(debug strip)
fi

SHIP_PREFIX=/opt/soh

prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  rm -r libultraship ZAPDTR OTRExporter
  #cp -r ../libultraship-${_lus_commit:0:8} libultraship
  cp -r ../libultraship-${_lus_tag} libultraship
  cp -r ../ZAPDTR-${_ZAPDTR_commit} ZAPDTR
  cp -r ../OTRExporter-${_OTRExporter_commit} OTRExporter

  cd OTRExporter
  patch -Np1 -i ../../OTRExporter-fix-paths-period-split.patch
  cd ..

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
  cd "${srcdir}/${_reponame}-${pkgver}"

  if [ "$__debug" = 1 ]; then
    BUILD_TYPE=Debug
  else
    BUILD_TYPE=Release
  fi

  CFLAGS="${CFLAGS/-Werror=format-security/}" \
  CXXFLAGS="${CXXFLAGS/-Werror=format-security/}" \
    cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
        -DNON_PORTABLE=On -DCMAKE_INSTALL_PREFIX=$SHIP_PREFIX .

  cmake --build build --target ZAPD --config $BUILD_TYPE

  if [ "$__generate_headers" = 1 ]; then
    cmake --build build --target ExtractAssetsHeaders
  else
    cmake --build build --target GenerateSohOtr
  fi

  cmake --build build --target soh --config $BUILD_TYPE
}

package_soh() {
  pkgdesc="An unofficial port of The Legend of Zelda Ocarina of Time for PC, Wii U, and Switch"
  depends=("${_depends_soh[@]}")
  license=("unknown")
  install=soh.install
  optdepends=("soh-otr: OTR asset file in order to run"
              "soh-otr-mq: OTR asset file in order to run (Master Quest)")

  cd "${srcdir}/${_reponame}-${pkgver}"

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

package_soh-otr-exporter() {
  pkgdesc="OTR generation tools for SoH. Includes asset XML files needed for generation."
  license=("MIT")
  depends=("${_depends_soh_otr_exporter[@]}")

  cd "${srcdir}/${_reponame}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build --component extractor

  install -dm755 "${pkgdir}/usr/bin"
  ln -s ${SHIP_PREFIX}/assets/extractor/ZAPD.out "${pkgdir}/usr/bin/ZAPD"

  install -dm755 "${pkgdir}/usr/share/licenses/soh-otr-exporter"
  install -Dm644 "OTRExporter/LICENSE" "${pkgdir}/usr/share/licenses/soh-otr-exporter/LICENSE"
}
