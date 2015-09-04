# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgname=clion
pkgver=1.1.1
_pkgver=1.1.1
pkgrel=1
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
source=("https://download.jetbrains.com/cpp/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('3a8d3dc2859460d24c7caf941a9acab18fcf0a05bb7fe1b73f8ba70393c6a3ea')
noextract=("${pkgname}-${_pkgver}.tar.gz")

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${pkgname}-${_pkgver}.tar.gz" -C "${pkgdir}/opt/${pkgname}"

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
Name=CLion
GenericName=${pkgname}
Comment=${pkgdesc}
Icon=${pkgname}
Exec="/usr/bin/${pkgname}" %f
Terminal=false
Categories=Development;IDE;
StartupNotify=true
StartupWMClass=jetbrains-${pkgname}
EOF
) > ${startdir}/${pkgname}.desktop

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  ln -s "/opt/${pkgname}/bin/${pkgname}.svg"                     "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  ln -s "/opt/${pkgname}/license/CLion_Preview_License.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/bin/${pkgname}.sh"                 "${pkgdir}/usr/bin/${pkgname}"
}
