# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

# These can be overridden on the makepkg command line
# Note that AUR helpers may not support overriding these, so they can also
# be modified here for convenience
[[ -z "$USE_SYSTEM_JRE" ]] && USE_SYSTEM_JRE=0
[[ -z "$BUNDLED_CMAKE"  ]] && BUNDLED_CMAKE=1
[[ -z "$BUNDLED_GDB"    ]] && BUNDLED_GDB=1
[[ -z "$BUNDLED_LLDB"   ]] && BUNDLED_LLDB=1

pkgname=clion-eap
_pkgname=clion
_dlname=CLion
pkgver=163.7743.32
_dlver=2016.3-RC2
pkgrel=1
pkgdesc="C/C++ IDE. 30-day evaluation."
arch=('i686' 'x86_64')
options=(!strip)
url="http://www.jetbrains.com/${_pkgname}"
license=('custom')
source=("https://download.jetbrains.com/cpp/${_dlname}-${_dlver}.tar.gz")
sha256sums=('9b9629c0d46bc3f23c5660a3e92d245e24a9982f8a9dc22e0b73cc32545b4de6')
noextract=("${_dlname}-${_dlver}.tar.gz")
depends=()
optdepends=()

if (( USE_SYSTEM_JRE )); then
  depends+=('java-runtime')
else
  optdepends+=('java-runtime: native JRE')
fi

if (( ! BUNDLED_CMAKE )); then
  depends+=('cmake')
else
  optdepends+=('cmake: native build system (Set BUNDLED_CMAKE=0 to remove the bundled one)')
fi

optdepends+=(
  'gdb: native debugger (Set BUNDLED_GDB=0 to remove the bundled one)'
  'lldb: native debugger (Set BUNDLED_LLDB=0 to remove the bundled one)'
  'gcc: GNU compiler'
  'clang: LLVM compiler'
  'biicode: C/C++ dependency manager'
  'gtest: C++ testing'
  'swift: Swift programming language support (Also requires the plugin)'
  'python: Python programming language support'
  'python2: Python 2 programming language support'
  'doxygen: Code documentation generation'
)

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${_dlname}-${_dlver}.tar.gz" \
         -C "${pkgdir}/opt/${pkgname}"

  (( USE_SYSTEM_JRE )) && rm -r "${pkgdir}/opt/${pkgname}/jre"
  (( ! BUNDLED_CMAKE )) && rm -r "${pkgdir}/opt/${pkgname}/bin/cmake"
  (( ! BUNDLED_GDB )) && rm -r "${pkgdir}/opt/${pkgname}/bin/gdb"
  (( ! BUNDLED_LLDB )) && rm -r "${pkgdir}/opt/${pkgname}/bin/lldb"

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
) > ${srcdir}/jetbrains-${pkgname}.desktop

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${srcdir}/jetbrains-${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/"

  ln -s "/opt/${pkgname}/bin/${_pkgname}.svg" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  ln -s "/opt/${pkgname}/license/CLion_Preview_License.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/bin/${_pkgname}.sh" \
            "${pkgdir}/usr/bin/${pkgname}"
}
