# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgname=clion-eap
_pkgname=clion
_archname=CLion
pkgver=144.2151.8
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
sha512sums=('990d84ec3db7982d130e5c96f01448741d890c3197b26d5390e25cad368041d211bbca5c7311ef41b52c3a346fcef1dc302b5bc8aac49cb1f6217b073ce7e880')
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
