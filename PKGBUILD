# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgbase=gowin-eda
pkgver=1.9.8.10
pkgrel=1
_desc="Gowin EDA, an easy to use integrated design environment provides design engineers one-stop solution from design entry to verification."
arch=('x86_64')
url="http://www.gowinsemi.com.cn/faq.aspx"
# url="https://www.gowinsemi.com/en/support/home/"
license=('unknown')
source=("http://cdn.gowinsemi.com.cn/Gowin_V${pkgver/_/-}_linux.tar.gz"
        "${pkgbase}-ide.desktop"
        "${pkgbase}-programmer.desktop")
sha256sums=('eb11013c4b6a440c16caff8f785b5a93532898a7ecdfef6dbeddea46edeb9bc3'
            'b508c7f10382a3ada34ee1797163c448559b1993898422f096c5381fd4abc7a6'
            '8f0a73964ae79785a5d79983887e436f6fce5626abc5ced5c7a300f67d90f2bc')

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

  _install_exec gw_sh gw_ide

  # fix ide launch error
  # libfreetype.so.6 from Gowin EDA ide could cause error when launch the IDE:
  # /opt/gowin-eda-edu-ide/bin/gw_ide: symbol lookup error: /usr/lib/libfontconfig.so.1: undefined symbol: FT_Done_MM_Var
  #
  # https://bbs.archlinux.org/viewtopic.php?id=251445
  # https://mathematica.stackexchange.com/questions/189306/cant-launch-mathematica-11-on-fedora-29
  rm -f ${pkgdir}/opt/${pkgname}/lib/libfreetype.so.6
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

  chmod 755 ${pkgdir}/opt/${pkgname}/bin/programmer{,_cli}

  # suit for IDE hardcode path of Programmer
  ln -s /opt/${pkgname} ${pkgdir}/opt/Programmer
}

pkgname=("${pkgbase}-ide" "${pkgbase}-programmer")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#${pkgbase}}
  }"
done
# vim: set sw=2 ts=2 et:
