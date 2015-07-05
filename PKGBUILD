# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=clion-eap
_pkgname=clion
pkgbuild=141.352.13
# This is a 1.0 release candidate
_pkgbuild=1.0
pkgver=${pkgbuild}
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
)
source=("http://download.jetbrains.com/cpp/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('29bfd56e0ab5e97a0fffec6c521259d262cd4798226bdb2059c5cc8474717fe741ae029ab41b60c5ff9dbc6f790b36bc4d2874dea8a85b93b039ca37ec80283a')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/opt/${pkgname} || return 1
  cp -R ${srcdir}/${_pkgname}-${_pkgbuild}/* ${pkgdir}/opt/${pkgname} || return 1
  if [[ $CARCH = 'i686' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier64
  fi
  if [[ $CARCH = 'x86_64' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier
  fi

(
cat <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=${pkgname}
Exec="/usr/bin/${pkgname}" %f
Icon=${pkgname}
Comment=${pkgdesc}
GenericName=${_pkgname}
Categories=Development;IDE;
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-${_pkgname}
EOF
) > ${startdir}/${pkgname}.desktop

  mkdir -p ${pkgdir}/usr/bin/ || return 1
  mkdir -p ${pkgdir}/usr/share/applications/ || return 1
  mkdir -p ${pkgdir}/usr/share/pixmaps/ || return 1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -m 644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -m 644 ${pkgdir}/opt/${pkgname}/bin/${_pkgname}.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
  install -m 644 ${srcdir}/${_pkgname}-${_pkgbuild}/license/CLion_Preview_License.txt ${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt
  ln -s /opt/${pkgname}/bin/${_pkgname}.sh "$pkgdir/usr/bin/${pkgname}"
}
