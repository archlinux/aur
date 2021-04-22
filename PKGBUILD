# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=brother-dcp-l8450cdw
pkgver=1.1.2
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP-L8450CDW"
arch=('i686' 'x86_64')
url="https://solutions.brother.com/linux"
license=('GPL2' 'custom:Brother EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=("https://download.brother.com/welcome/dlf101082/dcpl8450cdwlpr-1.1.2-1.i386.rpm"
        "https://download.brother.com/welcome/dlf101083/dcpl8450cdwcupswrapper-1.1.3-1.i386.rpm"
        wrapper.patch)
sha512sums=('3669f81f0624da3ca0bde93c79dd6350b27fd311052babc5db5e8c6968299da5cbc38f4833ef284e39e66aa895e0213ef99990c3d7cde9d04e5cb5f5513c19a3'
            '9648a92e69ecf2086cf766ff67717f7e030d1613517f23304490bd4560431ecdeceeb11af99be47c306990559464b3bc99cfd4da2b61d5fcfeb0a752d3552455'
            '56f0a77158294641cba9540fc01ea40569eaec13b19986ab12babd99860ad20beeabefd8b8e405112427a1c6cc664a2d8c34fe2212143d31a48a8b2edc10aec9')

prepare() {
  cd ${srcdir}/opt/brother/Printers/dcpl8450cdw/cupswrapper
  patch < ${srcdir}/wrapper.patch
}

package() {
  install -Dm755 ${srcdir}/usr/bin/brprintconf_dcpl8450cdw ${pkgdir}/usr/bin/brprintconf_dcpl8450cdw
  cp -r ${srcdir}/opt ${pkgdir}/opt

  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter

  sh ${srcdir}/opt/brother/Printers/dcpl8450cdw/cupswrapper/cupswrapperdcpl8450cdw > ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_dcpl8450cdw
  chmod 755 ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_dcpl8450cdw

   ln -s \
     /opt/brother/Printers/dcpl8450cdw/cupswrapper/brother_dcpl8450cdw_printer_en.ppd \
     ${pkgdir}/usr/share/cups/model/Brother/
}
