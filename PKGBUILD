# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgname=clion-eap
_pkgname=clion
_archname=CLion
pkgver=144.2608.6
_pkgver=${pkgver}
pkgrel=1
pkgdesc="C/C++ IDE. 30-day evaluation."
arch=('x86_64')
options=(!strip)
url="http://www.jetbrains.com/${_pkgname}"
license=('custom')
optdepends=(
  'java-runtime: native JRE (Edit PKGBUILD to remove bundled JRE)'
  'gdb: native debugger (You may want to edit PKGBUILD to remove the bundled one)'
  'cmake: native build system (You may want to edit PKGBUILD to remove the bundled one)'
  'gcc: GNU compiler'
  'clang: LLVM compiler'
  'biicode: C/C++ dependency manager'
  'gtest: C++ testing'
  'swift-bin: Swift programming language support (Also requires the plugin)'
)
source=("https://download.jetbrains.com/cpp/${_archname}-${_pkgver}.tar.gz")
sha512sums=('7e002279f4d061f46250a223648818a62f10efaf3b55aec20a64e355f16eccd623c4940d3c939a668ff6ca2d158ac6ebd2b0cff6129670efc4d1a3495ab33d67')
noextract=("${_archname}-${_pkgver}.tar.gz")

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${_archname}-${_pkgver}.tar.gz" -C "${pkgdir}/opt/${pkgname}"

  # Uncomment to use system JRE, CMake and/or GDB instead of the bundled one(s)
  #rm -r "${pkgdir}/opt/${pkgname}/jre"
  #rm -r "${pkgdir}/opt/${pkgname}/bin/cmake"
  #rm -r "${pkgdir}/opt/${pkgname}/bin/gdb"

  if [[ $CARCH = 'i686' ]]; then
    rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
    rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
  fi
  if [[ $CARCH = 'x86_64' ]]; then
    rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux.so"
    rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier"
  fi

(
cat <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=CLion EAP
GenericName=${_pkgname}
Comment=${pkgdesc}
Icon=${pkgname}
Exec="/usr/bin/${pkgname}" %f
Terminal=false
Categories=Development;IDE;
StartupNotify=true
StartupWMClass=jetbrains-${_pkgname}
EOF
) > ${startdir}/jetbrains-${pkgname}.desktop

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${startdir}/jetbrains-${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  ln -s "/opt/${pkgname}/bin/${_pkgname}.svg"                     "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  ln -s "/opt/${pkgname}/license/CLion_Preview_License.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/bin/${_pkgname}.sh"                 "${pkgdir}/usr/bin/${pkgname}"
}
