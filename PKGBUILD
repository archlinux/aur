# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgname=clion
_pkgname=CLion
# Make sure to use vercmp to check version is seen as newer. Bump epoch if not.
pkgver=2016.1.3
pkgrel=1
# Bump when JetBrains uses silly letters in stable releases
epoch=1
pkgdesc="C/C++ IDE. Free 30-day trial."
arch=('x86_64')
options=(!strip)
url="http://www.jetbrains.com/${pkgname}"
license=('custom')
optdepends=(
  'java-runtime: native JRE (Edit PKGBUILD to remove bundled JRE)'
  'gdb: native debugger (You may want to edit PKGBUILD to remove the bundled one)'
  'cmake: native build system (You may want to edit PKGBUILD to remove the bundled one)'
  'gcc: GNU compiler'
  'clang: LLVM compiler'
  'biicode: C/C++ dependency manager'
  'gtest: C++ testing'
  'swift: Swift programming language support (Also requires the plugin)'
  'python: Python programming language support (Also requires the plugin)'
  'python2: Python 2 programming language support (Also requires the plugin)'
)
source=("https://download.jetbrains.com/cpp/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('470063f1bb65ba03c6e1aba354cb81e2c04bd280d9b8da98622be1ba6b0a9c88')
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
Name=${_pkgname}
GenericName=${pkgname}
Comment=${pkgdesc}
Icon=${pkgname}
Exec="/usr/bin/${pkgname}" %f
Terminal=false
Categories=Development;IDE;
StartupNotify=true
StartupWMClass=jetbrains-${pkgname}
EOF
) > ${startdir}/jetbrains-${pkgname}.desktop

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${startdir}/jetbrains-${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  ln -s "/opt/${pkgname}/bin/${pkgname}.svg"                "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  ln -s "/opt/${pkgname}/license/CLion_Preview_License.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/bin/${pkgname}.sh"                 "${pkgdir}/usr/bin/${pkgname}"
}
