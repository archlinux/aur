# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=brother-ql710w
pkgver=3.1.5r0
pkgrel=1
pkgdesc='LPR and CUPS driver for Brother QL-710W label printer'
url='https://support.brother.com'
arch=('i686' 'x86_64')
license=('custom')
depends=('cups')
install="${pkgname}.install"
source=("https://download.brother.com/welcome/dlfp002197/ql710wpdrv-${pkgver/r/-}.i386.rpm")
sha256sums=('00b881cea1668553fe40887375d72188f42e03893b73619e231893564b609721')

prepare()
{
  # Create CUPS directories
  install -d "${srcdir}/usr/share/cups/model"
  install -d "${srcdir}/usr/share/ppd"
  install -d "${srcdir}/usr/lib/cups/filter"

  # Locate cupswrapper script
  cd $(find -type d -name 'cupswrapper')
  _cupswrapper=$(ls cupswrapper*)

  # Patch cupswrapper script
  sed -i '/^sleep/d' ${_cupswrapper}
  sed -i '/^echo lpadmin/d' ${_cupswrapper}
  sed -i '/^lpadmin/d' ${_cupswrapper}
  sed -i "s|/usr|${srcdir}/usr|g" ${_cupswrapper}
  sed -i "s|/opt|${srcdir}/opt|g" ${_cupswrapper}
  sed -i "s|/model/Brother|/model|g" ${_cupswrapper}
  sed -i 's|lpinfo|echo|g' ${_cupswrapper}

  # Invoke cupswrapper script
  export srcdir=${srcdir}
  ./${_cupswrapper}

  # Patch resulting filter
  sed -i "s|${srcdir}||" ${srcdir}/usr/lib/cups/filter/*lpdwrapper*

  # Remove cupswrapper script and templates
  find "${srcdir}" -type d -name 'cupswrapper' -exec rm -rf {} +

  # Remove unneeded script (i.e. /etc/printcap is managed by CUPS)
  rm $(find "${srcdir}" -type f -name 'setupPrintcap*')

  # Remove binaries for different architectures
  if [ "${CARCH}" = 'x86_64' ]; then
    find "${srcdir}" -type d -name 'i686' -exec rm -rf {} +
  elif [ "${CARCH}" = 'i686' ]; then
    find "${srcdir}" -type d -name 'x86_64' -exec rm -rf {} +
  fi
}

package()
{
  # Install actual content
  cp -R "${srcdir}/usr" "${pkgdir}"
  cp -R "${srcdir}/opt" "${pkgdir}"

  # Handle license
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type f -name 'LICENSE*.txt' -exec mv -t "${pkgdir}/usr/share/licenses/${pkgname}" {} +
}
