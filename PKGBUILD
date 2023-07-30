# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=aml-flash-tool
pkgver=4.9
pkgrel=2
pkgdesc="Linux version of Amlogic USB Burning Tool."
arch=('x86_64')
url="https://github.com/khadas/utils/tree/master/aml-flash-tool"
license=('unknown')
depends=('libusb'
         'libusb-compat')
source=("${pkgname}-${pkgver}::git+https://github.com/khadas/utils#"
        "${pkgname}.sh"
        "0001-BTW_I-use-Arch.patch")
provides=('aml-flash')
options=('!strip')
sha256sums=('SKIP'
            'a31b6e5633e81eeb3e447a0077ca5abc2bd7bb22e38910693681776a315151fc'
            'd9a1e81742452298b4181470a3791910c781fdbfaba55c301cb9578a165c61f6')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/0001-BTW_I-use-Arch.patch"
}

package() {
  cd ${pkgname}-${pkgver}/${pkgname}

  _executable=flash-tool
  # executable
  install -Dm755 ${_executable} -t ${pkgdir}/usr/lib/${pkgname}/

  # tools
  _not_executable_files=(decompressPara_4M.dump
              usbbl2runpara_ddrinit.bin
              usbbl2runpara_runfipimg.bin)

  for _ne in "${_not_executable_files[@]}";
  do
    install -Dm644 tools/datas/${_ne} -t ${pkgdir}/usr/lib/${pkgname}/tools/datas
  done

  _executable_files=(update
              aml_image_v2_packer
              aml_update.app)
              
  for _e in "${_executable_files[@]}";
  do
    install -Dm755 tools/linux-x86/${_e} -t ${pkgdir}/usr/lib/${pkgname}/tools/linux-x86
  done

  # wrapper
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  
  # udev rules
  install -Dm644 tools/_install_/70-persistent-usb-ubuntu14.rules ${pkgdir}/usr/lib/udev/rules.d/70-persistent-usb-amlogic.rules

  # doc
  install -Dm644 docs/Amlogic_update_usb_tool_user_guide.pdf -t ${pkgdir}/usr/share/doc/${pkgname}
}

# vim: set sw=2 ts=2 et:
