# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgname=clion-eap
_pkgname=clion
pkgver=143.869.7
_pkgver=1.2.2
pkgrel=1
pkgdesc="C/C++ IDE. 30-day evaluation."
arch=('x86_64')
options=(!strip)
url="http://www.jetbrains.com/${_pkgname}"
license=('custom')
optdepends=(
  'gdb: native debugger'
  'cmake: native build system'
  'gcc: GNU compiler'
  'clang: LLVM compiler'
  'biicode: C/C++ dependency manager'
  'gtest: C++ testing'
  'java-environment: native JRE (Edit PKGBUILD to remove bundled JRE)'
)
source=("https://download.jetbrains.com/cpp/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('dfec8c47d01207800cb6ff6b04a611a647b01fff721504984ec1adefa5731965717433c0de082e7f540c60baa84794f43766a5c2e5a111be140ff9b80edb665d')
noextract=("${_pkgname}-${pkgver}.tar.gz")

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${_pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/${pkgname}"

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
) > ${startdir}/${pkgname}.desktop

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  ln -s "/opt/${pkgname}/bin/${_pkgname}.svg"                     "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  ln -s "/opt/${pkgname}/license/CLion_Preview_License.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/bin/${_pkgname}.sh"                 "${pkgdir}/usr/bin/${pkgname}"
}
