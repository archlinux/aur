# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5200-complete/
# Only tested with x86_64 architecture

pkgname=canon-pixma-mg2500-complete
pkgver=4.00
pkgrel=2
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MG2500 series (MG2500, MG2540S etc.)"
url='http://www.usa.canon.com/cusa/support/consumer/printers_multifunction/pixma_mg_series/pixma_mg2520_w_pp_201'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
depends=('popt' 'libpng12' 'libusb-compat' 'libtiff' 'libxml2' 'gtk2')
makedepends=('sed')
source=('http://gdlp01.c-wss.com/gds/2/0100005502/01/cnijfilter-mg2500series-4.00-1-deb.tar.gz'
        'http://gdlp01.c-wss.com/gds/9/0100005519/01/scangearmp-mg2500series-2.20-1-deb.tar.gz')
md5sums=('133593894b4dd9553b0891f92966e9de'
         'e553eadc540b18a6782a3f7d0b7eab80')

build() {
  if [[ ${CARCH} == 'x86_64' ]]; then
    deb_arch='amd64'
  elif [[ ${CARCH} == 'i686' ]]; then
    deb_arch='i386'
  fi

  for deb_pkg in "${srcdir}"/*/packages/*_${deb_arch}.deb
  do
    deb_name="$(basename -s .deb "${deb_pkg}")"
    mkdir -p "${srcdir}/extracted/${deb_name}"
    pushd "${srcdir}/extracted/${deb_name}"
      ar x "${deb_pkg}" data.tar.gz
    popd
  done
}

package() {
  cd "${pkgdir}"

  for data_tar_gz in "${srcdir}"/extracted/*/data.tar.gz
  do
    tar xvf "${data_tar_gz}"
  done

  # Move ppd file to where cups expects
  mkdir -p "${pkgdir}/usr/share/cups/model"
  for ppd in usr/share/ppd/*
  do
    mv "${ppd}" "${pkgdir}/usr/share/cups/model/$(basename "${ppd}")"
  done

  rmdir "${pkgdir}/usr/share/ppd"

  # Fix udev rules
  sed -i -e "s/SYSFS/ATTR/g" "${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules"

  # Install custom license file
  install -vDm 644 "$pkgdir/usr/share/doc/cnijfilter-mg2500series/LICENSE-cnijfilter-4.00EN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
