# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=Shipwright
pkgbase=soh-git
pkgname=(soh-git soh-otr-exporter-git)
pkgver=4.0.0.r0.g8888fb2e
pkgrel=1
arch=("x86_64" "i686")
url="https://github.com/HarbourMasters/${_reponame}"
makedepends=("cmake" "ninja" "curl" "lsb-release")
source=("git+${url}.git"
        "soh.desktop"
        "soh-install-paths.patch"
        "otrgui-wrapper.sh")
sha256sums=('SKIP'
            '64fa7775b6a9e24cc783fedadf1ad4cb13b294f011e37392c748fee5b287a7ce'
            'bd082ed8579ffb400f5225e200ce96900879837b8f01abc09a41416fa8fdaefa'
            '6e735877e7bba81f9f308f6eabbdfe5354f2c331a9acf9a16ab02a5681f2c25f')

SHIP_PREFIX=/opt/soh

pkgver() {
  cd "${srcdir}/${_reponame}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_reponame}"

  # check for any roms in the directory where PKGBUILD resides
  # and copy them to Shipwright/OTRExporter. It doesn't matter
  # which rom will be used, let extract_assets.py do the guessing.
  roms=( "${startdir}/"*.*64 )
  if (( "${#roms[@]}" )); then
    cp "${roms[@]}" OTRExporter
  else
    echo "NO ROMS FOUND! Please place them in \"${startdir}\"."
    exit 1
  fi

  patch -Np1 -i "${srcdir}/soh-install-paths.patch"
}

build() {
  cd "${srcdir}/${_reponame}"

  CFLAGS="${CFLAGS/-Werror=format-security/}" \
  CXXFLAGS="${CXXFLAGS/-Werror=format-security/}" \
    cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$SHIP_PREFIX .

  cd build
  ninja ZAPD

  ( cd ../OTRExporter; ./extract_assets.py -z ../build/ZAPD/ZAPD.out; )
  ninja soh

  ninja OTRGui
}

package_soh-git() {
  pkgdesc="A port of The Legend of Zelda Ocarina of Time for PC, Wii U, and Switch"
  provides=("soh")
  conflicts=("soh")
  license=("unknown")
  depends=("sdl2")

  cd "${srcdir}/${_reponame}"
  cd build
  DESTDIR="${pkgdir}" ninja soh/install

  install -dm755 "${pkgdir}/usr/bin/"

  ln -s /opt/soh/soh.elf "${pkgdir}/usr/bin/soh"
  install -Dm644 "${srcdir}/soh.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 ../soh/macosx/sohIcon.png "${pkgdir}/usr/share/pixmaps/soh.png"
}

package_soh-otr-exporter-git() {
  pkgdesc="OTR generation tools for SoH"
  provides=("soh-otr-exporter")
  conflicts=("soh-otr-exporter")
  license=("MIT")
  depends=("sdl2" "libpng")

  cd "${srcdir}/${_reponame}"
  cd build

  DESTDIR="${pkgdir}" ninja OTRGui/install

  install -dm755 "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/otrgui-wrapper.sh" "${pkgdir}/usr/bin/OTRGui"
  ln -s /opt/soh/assets/extractor/ZAPD.out "${pkgdir}/usr/bin/ZAPD"
}
