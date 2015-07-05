# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=clion
pkgbuild=1.0.4
pkgver=${pkgbuild}
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
source=("https://download.jetbrains.com/cpp/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9511c98e4eae7ae3830a859e59774e884d30b8708900c6ec3f5e7efb054ce5b3')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/opt/${pkgname} || return 1
  cp -R ${srcdir}/${pkgname}-${pkgbuild}/* ${pkgdir}/opt/${pkgname} || return 1

(
cat <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=${pkgname}
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

  mkdir -p ${pkgdir}/usr/bin/ || return 1
  mkdir -p ${pkgdir}/usr/share/applications/ || return 1
  mkdir -p ${pkgdir}/usr/share/pixmaps/ || return 1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -m 644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -m 644 ${pkgdir}/opt/${pkgname}/bin/${pkgname}.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
  install -m 644 ${srcdir}/${pkgname}-${pkgbuild}/license/CLion_Preview_License.txt ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /opt/${pkgname}/bin/${pkgname}.sh "$pkgdir/usr/bin/${pkgname}"
}
