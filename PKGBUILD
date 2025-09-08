# Maintainer: insmtr <insmtr@insmtr.cn>
# Contributor: yjun <jerrysteve1101 at gmail dot com>

pkgbase=gowin-eda-edu
pkgver=1.9.11.03
pkgrel=1
_desc="Gowin EDA, an easy to use integrated design environment provides design engineers one-stop solution from design entry to verification. (education version)"
arch=('x86_64')
url="https://www.gowinsemi.com.cn/software/index"
license=('unknown')
source=("https://cdn.gowinsemi.com.cn/Gowin_V${pkgver/_/-}_Education_Linux.tar.gz"
        "${pkgbase}.png"
        "${pkgbase}-ide-project.xml"
        "${pkgbase}-ide.desktop"
        "${pkgbase}-programmer.desktop")
sha256sums=('6fd392f7473b24d847b6f8ebdc7a185c591826ba35d8d0e517961030d446f9f7'
            '346991b57db67aa4a8373ad09fd221e310c87ac7a6c90313cad7b48f7e6934ab'
            'a95d18239e9ecb6b3f712fa569601e964624ef4ccb39ca85e56dfafa74b573d2'
            '899042b398f530e30cd566feda5920002422b1face170928c272bf5ebe4be70b'
            '58dc15480b793fbde86a0fcfb644239077b07e34345d7753f6c34f32d24b080a')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/opt/${pkgname}/{} \;
}

_install_exec() {
  # executable softlink
  install -dm 755 ${pkgdir}/usr/bin/
  for _exec in $@
  do
    ln -sf /opt/${pkgname}/bin/${_exec} ${pkgdir}/usr/bin/${_exec}
  done
}

_package-ide() {
  pkgdesc="Gowin EDA IDE - ${_desc}"
  depends=('fontconfig' 'freetype2')
  optdepends=('openfpgaloader: open source fpga programmer, as a replacement to Gowin Programmer')
  provides=("gowin-eda-ide" "gowin-ide")
  
  cd ${srcdir}/IDE
  
  _install 644 doc/
  _install 644 lib/
  _install 644 data/
  _install 644 share/
  _install 644 simlib/
  _install 644 ipcore/
  _install 644 plugins/
  _install 644 bin/vhdl_packages
  _install 755 bin/ -maxdepth 1

  chmod 644 ${pkgdir}/opt/${pkgname}/bin/prim{itive.xml,_syn.vhd,_syn.v}
  chmod 644 ${pkgdir}/opt/${pkgname}/bin/qt.conf
  chmod 644 ${pkgdir}/opt/${pkgname}/bin/programmer.json

  # desktop entry
  install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications

  #icon
  install -Dm644 ${srcdir}/${pkgbase}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  _install_exec gw_sh gw_ide

  # fix ide launch error
  # libfreetype.so.6 from Gowin EDA ide could cause error when launch the IDE:
  # /opt/gowin-eda-edu-ide/bin/gw_ide: symbol lookup error: /usr/lib/libfontconfig.so.1: undefined symbol: FT_Done_MM_Var
  #
  # https://bbs.archlinux.org/viewtopic.php?id=251445
  # https://mathematica.stackexchange.com/questions/189306/cant-launch-mathematica-11-on-fedora-29
  rm -f ${pkgdir}/opt/${pkgname}/lib/libfreetype.so.6

  # HACK: fix IDE hardcode path of Programmer
  sed -i  's|../../Programmer|..////Programmer|g' ${pkgdir}/opt/${pkgname}/bin/gao_{sh,analyzer}
  sed -i  's|../../Programmer|..////Programmer|g' ${pkgdir}/opt/${pkgname}/plugins/ide/lib{StartPage,FpgaPrj}.so
  ln -s /opt/${pkgbase}-programmer ${pkgdir}/opt/${pkgname}/Programmer

  # MimeType association
  install -Dm644 ${srcdir}/${pkgbase}-ide-project.xml -t ${pkgdir}/usr/share/mime/packages/
}

_package-programmer() {
  pkgdesc="Gowin EDA Programmer - ${_desc}"
  # depends=('fontconfig' 'freetype2')
  provides=("gowin-eda-programmer" "gowin-programmer")
  options=('emptydirs')

  cd ${srcdir}/Programmer

#   _install 644 doc/
  _install 644 bin/PyQt5
  _install 644 bin/data
  _install 644 bin/Crypto -path '*/__pycache__' -prune -o
  _install 644 bin/tools
  _install 644 bin/ -maxdepth 1 -not -name 'python34.zip'

  _install_exec programmer programmer_cli

  # empty dir
  install -dm755 ${pkgdir}/opt/${pkgname}/bin/data/output
  install -dm755 ${pkgdir}/opt/${pkgname}/bin/data/lang
  install -dm755 ${pkgdir}/opt/${pkgname}/bin/data/devices
  
  # desktop entry
  install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications

  #icon
  install -Dm644 ${srcdir}/${pkgbase}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  chmod 755 ${pkgdir}/opt/${pkgname}/bin/programmer{,_cli}
}

pkgname=("${pkgbase}-ide" "${pkgbase}-programmer")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#${pkgbase}}
  }"
done
# vim: set sw=2 ts=2 et:
