# Maintainer: insmtr <insmtr@insmtr.cn>
# Contributor: yjun <jerrysteve1101 at gmail dot com>

pkgbase=gowin-eda
pkgver=1.9.12.01
pkgrel=1
epoch=1
_desc="Gowin EDA, an easy to use integrated design environment provides design engineers one-stop solution from design entry to verification."
arch=('x86_64')
url="https://www.gowinsemi.com.cn/software/index"
license=('unknown')
source=("http://cdn.gowinsemi.com.cn/Gowin_V${pkgver/_/-}_linux.tar.gz"
        "gw_ide.sh"
        "gw_sh.sh"
        "programmer.sh"
        "programmer_cli.sh"
        "${pkgbase}.png"
        "${pkgbase}-ide-project.xml"
        "${pkgbase}-ide.desktop"
        "${pkgbase}-programmer.desktop")
sha256sums=('8f45641641549df915ebb8d0f20750251651388d9fc91f2eab44d1ecfa61760b'
            '2d0366a0f172cf1cf8a076d21085237919277c815920dc0ebf16f607eb439ffc'
            '21abbbb6f609eb8f5878386a61636de7ba35a42b03a56180e0bb4cc8ea424790'
            '9a87376bf3b204e7c83cfd7e4f242ee66b7f08d0662a897937ded74884c9348d'
            '54900d9c54d1862950e21275f3602c880e7b82c902da55f725165bf3cd022342'
            '346991b57db67aa4a8373ad09fd221e310c87ac7a6c90313cad7b48f7e6934ab'
            'a95d18239e9ecb6b3f712fa569601e964624ef4ccb39ca85e56dfafa74b573d2'
            '27894cfb7ab767fc9d4a1392e9d521fefbb819be7806512cbe44118934e16697'
            '664f20c092c8b6fd018327a8e60c2f31454bbd9a27950b8ea7e98b76895235b8')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/opt/${pkgname}/{} \;
}

_install_exec() {
  # executable script
  install -dm 755 ${pkgdir}/usr/bin/
  for _exec in $@
  do
    install -Dm755 ${srcdir}/${_exec}.sh ${pkgdir}/usr/bin/${_exec}
  done
}

_package-ide() {
  pkgdesc="Gowin EDA IDE - ${_desc}"
  depends=('fontconfig' 'freetype2')
  optdepends=('openfpgaloader: open source fpga programmer, as a replacement to Gowin Programmer')
  provides=("gowin-eda-ide" "gowin-ide")
  backup=("opt/${pkgname}/bin/gwlicense.ini")
  
  cd ${srcdir}/Gowin_V${pkgver/_/-}_linux/IDE
  
  _install 644 doc/
  _install 644 lib/
  _install 644 data/
  _install 644 share/
  _install 644 simlib/
  _install 644 ipcore/
  _install 644 plugins/
  _install 644 bin/vhdl_packages
  _install 644 bin/prim_syns
  _install 644 bin/eye_mon_task_gen.dist
  _install 644 bin/serdes_toml_to_csr.dist
  _install 644 bin/ssc_task_gen.dist
  _install 644 bin/resources
  _install 644 bin/translations
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

  # HACK: fix IDE hardcode path of Programmer
  sed -i  's|../../Programmer|..////Programmer|g' ${pkgdir}/opt/${pkgname}/bin/gao_{sh,analyzer}
  sed -i  's|../../Programmer|..////Programmer|g' ${pkgdir}/opt/${pkgname}/bin/gvio_{sh,analyzer}
  sed -i  's|../../Programmer|..////Programmer|g' ${pkgdir}/opt/${pkgname}/bin/gw_goeye
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

  cd ${srcdir}/Gowin_V${pkgver/_/-}_linux/Programmer

  _install 644 doc/
  _install 644 bin/PyQt5
  _install 644 bin/data
  _install 644 bin/Crypto -path '*/__pycache__' -prune -o
  _install 644 bin/tools
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
}

pkgname=("${pkgbase}-ide" "${pkgbase}-programmer")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#${pkgbase}}
  }"
done
# vim: set sw=2 ts=2 et:
