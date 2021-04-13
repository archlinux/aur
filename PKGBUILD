# Maintainer: Karol Babioch <karol@babioch.de>
# Conributer: Laurenz Kamp <laurenz.kamp@gmx.de>

pkgname='brother-ql1100'
pkgver=2.1.4r0
pkgrel=2
pkgdesc='LPR and CUPS driver for Brother QL-1100 label printer'
url='http://solutions.brother.com/linux/en_us/'
arch=('i686' 'x86_64')
license=('custom')
depends='cups'
if [ "$CARCH" = 'x86_64' ]; then
  depends+=('lib32-glibc')
fi
install="$pkgname.install"
source=("http://download.brother.com/welcome/dlfp100574/ql1100pdrv-${pkgver/r/-}.i386.rpm"
        'LICENSE')
sha256sums=('4523ee178173b11f9a66bd31a1ef03ecf2d933a0900f3dfc2fc1ffab07fffd26'
            'cdd1955a9996bc246ba54e84f0a5ccbfdf6623962b668188762389aa79ef9811')

prepare()
{
  # Create necessary CUPS directories
  install -d "${srcdir}/usr/share/cups/model"
  install -d "${srcdir}/usr/lib/cups/filter"
  install -d "${srcdir}/usr/bin"

  # Locate cupswrapper script
  _cupswrapper=$(find "${srcdir}/opt/brother/PTouch/" -type f -name 'cupswrapper*')
  echo "cupswrapper: ${_cupswrapper}"

  # Locate lpdwrapper script / symlink
  _lpdwrapper=$(find "${srcdir}/opt/brother/PTouch/" -name "brother_lpdwrapper_*")
  echo "lpdwrapper: ${_lpdwrapper}"

  # Basename of lpdwrapper script
  _lpdwrapper_basename="$(basename "${_lpdwrapper}")"
  echo "lpdwrapper_basename: ${_lpdwrapper_basename}"

  # Get model name of driver based on name from lpdwrapper script (e.g. brother_lpdwrapper_ql720nw -> ql720nw)
  _model="${_lpdwrapper_basename##brother_lpdwrapper_}"
  echo "model: ${_model}"

  # Patch cupswrapper script
  sed -i '/^sleep/d' ${_cupswrapper}
  sed -i '/^echo lpadmin/d' ${_cupswrapper}
  sed -i '/^lpadmin/d' ${_cupswrapper}
  sed -i "s|/usr|${srcdir}/usr|g" ${_cupswrapper}
  sed -i "s|/opt|${srcdir}/opt|g" ${_cupswrapper}
  sed -i "s|/model/Brother|/model|g" ${_cupswrapper}
  sed -i 's|lpinfo|echo|g' ${_cupswrapper}

  # Remove potential symlink (from previous runs)
  rm -f "${srcdir}/usr/lib/cups/filter/${_lpdwrapper_basename}"

  # Invoke cupswrapper script
  export srcdir=${srcdir}
  ${_cupswrapper}

  # Patch resulting filter
  sed -i "s|${srcdir}||" "${_lpdwrapper}"

  # Remove unneeded script (i.e. /etc/printcap is managed by CUPS)
  rm $(find "${srcdir}" -type f -name 'setupPrintcap*')

  # Make symlink absolute
  rm "${srcdir}/usr/lib/cups/filter/${_lpdwrapper_basename}"
  ln -s "/opt/brother/PTouch/${_model}/cupswrapper/${_lpdwrapper_basename}" "${srcdir}/usr/lib/cups/filter/${_lpdwrapper_basename}"
}

package()
{
  # Install actual content
  cp -R "${srcdir}/usr" "${pkgdir}"
  cp -R "${srcdir}/opt" "${pkgdir}"

  # Set some file ownerships and permissions
  # infdir, e.g. /opt/brother/PTouch/ql720nw/inf/
  _infdir=$(find "${pkgdir}/opt/brother/PTouch/" -type d -name 'inf')
  chown root:lp ${_infdir}
  chmod 775 ${_infdir}
  # rcfile, e.g. /opt/brother/PTouch/ql720nw/inf/brql720nwrc
  _rcfile=$(find "${pkgdir}/opt/brother/PTouch/" -type f -name '*rc')
  chown daemon:lp ${_rcfile}
  chmod 664 ${_rcfile}

  # Handle licenses
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type f -name 'LICENSE*.txt' -exec mv -t "${pkgdir}/usr/share/licenses/${pkgname}" {} +
}
