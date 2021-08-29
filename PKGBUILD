# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=stm32cubemonitor
_pkgname=STM32CubeMonitor
pkgver=1.2.0
pkgrel=2
pkgdesc="Graphical software for helping debug and diagnose STM32 applications while they are running by reading and displaying their variables in real-time"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemonitor.html"
license=('SLA0048')
# package stlink provides stlink udev files
depends=('gtk3' 'nss' 'libxss' 'libnotify' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'stlink')
options=('!strip')
_pkg_file_name=${_pkgname}_lin_v${pkgver//./-}
# https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-performance-and-debuggers/stm32cubemonitor/_jcr_content/get-software/get-software-table-body.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html
source=("en.${_pkg_file_name}.zip::https://www.st.com/content/ccc/resource/technical/software/sw_development_suite/group0/70/4c/e0/01/b2/df/4c/45/${_pkg_file_name}/files/${_pkg_file_name}.zip/jcr:content/translations/en.${_pkg_file_name}.zip")
sha256sums=('89ca4051cea2e0dd115f9e5e1cb1344560fd408471d7a5caae1ca15cb736aa35')

#    Extracted Files from ${_pkg_file_name}
#    ├── driver
#    │   └── st-stlink-udev-rules-1.0.2-3-linux-all.deb
#    ├── licenses
#    │   ├── Gnu Arm Embedded Toolchain EULA.txt
#    │   ├── LICENSES.chromium.html
#    │   ├── licenses_list_STM32CubeMonitor.txt
#    │   └── SLA0048 rev4.pdf
#    ├── snapshot_embedded_SW.zip
#    └── stm32cubemonitor_${pkgver}_amd64.deb

prepare() {
  install -dm755 build
  bsdtar -xf ${pkgname}_${pkgver}_amd64.deb -C build
}

package() {
  tar -xf build/data.tar.xz -C ${pkgdir}
  
  install -dm755 ${pkgdir}/opt
  mv ${pkgdir}/usr/lib/${pkgname} ${pkgdir}/opt
  rm -rf ${pkgdir}/usr/lib
  rm -rf ${pkgdir}/usr/share/lintian

  # soft link
  ln -fs /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # license
  for _license in ${srcdir}/licenses/*
  do
    install -Dm644 "${_license}" -t ${pkgdir}/usr/share/licenses/${pkgname}/
  done 
}

# vim: set sw=2 ts=2 et:
