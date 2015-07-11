# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgname=clion
pkgbuild=1.0.5
pkgver=${pkgbuild}
pkgrel=2
pkgdesc="C/C++ IDE. Free 30-day trial."
arch=('x86_64')
options=(!strip)
url="http://www.jetbrains.com/${pkgname}"
license=('custom')
optdepends=(
  'gdb: native debugger'
  'cmake: native build system'
  'gcc: GNU compiler'
  'clang: LLVM compiler'
  'biicode: C/C++ dependency manager'
)
source=("https://download.jetbrains.com/cpp/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ca042146f68af6efbc5f2241c8b78b50a1844dd5f106e06809d8acb391f56c0f')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/${pkgname}"

  # Uncomment to use system JRE, CMake and/or GDB instead of the bundled one(s)
  #rm -r "${pkgdir}/opt/${pkgname}/jre"
  #rm -r "${pkgdir}/opt/${pkgname}/bin/cmake"
  #rm -r "${pkgdir}/opt/${pkgname}/bin/gdb"

(
cat <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=Clion
Exec="/usr/bin/${pkgname}" %f
Icon=${pkgname}
Comment=${pkgdesc}
GenericName=${pkgname}
Categories=Development;IDE;
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-${pkgname}
EOF
) > ${startdir}/${pkgname}.desktop

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  ln -s "/opt/${pkgname}/bin/clion.svg"                     "${pkgdir}/usr/share/pixmaps/clion.svg"
  ln -s "/opt/${pkgname}/license/CLion_Preview_License.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/bin/${pkgname}.sh"                 "${pkgdir}/usr/bin/${pkgname}"
}
