# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgbase=gowin-eda
pkgver=1.9.8.11
pkgrel=2
_desc="Gowin EDA, an easy to use integrated design environment provides design engineers one-stop solution from design entry to verification."
arch=('x86_64')
url="http://www.gowinsemi.com.cn/faq.aspx"
# url="https://www.gowinsemi.com/en/support/home/"
license=('unknown')
source=("http://cdn.gowinsemi.com.cn/Gowin_V${pkgver/_/-}_linux.tar.gz"
        "${pkgbase}.png"
        "${pkgbase}-ide-project.xml"
        "${pkgbase}-ide.desktop"
        "${pkgbase}-programmer.desktop")
sha256sums=('d27325f6419c32f3aa454c1fbd797f87a3f202b7ebd19817d1df9ef60e56a32b'
            '346991b57db67aa4a8373ad09fd221e310c87ac7a6c90313cad7b48f7e6934ab'
            'a95d18239e9ecb6b3f712fa569601e964624ef4ccb39ca85e56dfafa74b573d2'
            '5a066787cac9410c279ff67a2174abf49a7357eb7ff6a209346bf754ad5f684e'
            '13ada31589ca39eecf95dc3516f5db179ce53ac0ffbd140879f346d0d90a9829')

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
  backup=("opt/${pkgname}/bin/gwlicense.ini")
  
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
  chmod 666 ${pkgdir}/opt/${pkgname}/bin/gwlicense.ini

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

  # fix IDE hardcode path of Programmer
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

  _install 644 doc/
  _install 644 bin/PyQt5
  _install 644 bin/data
  _install 644 bin/ -maxdepth 1

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
  

  # suit for IDE hardcode path of Programmer
  # ln -s /opt/${pkgname} ${pkgdir}/opt/Programmer
}

pkgname=("${pkgbase}-ide" "${pkgbase}-programmer")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#${pkgbase}}
  }"
done
# vim: set sw=2 ts=2 et:
