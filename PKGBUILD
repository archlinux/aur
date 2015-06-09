# $Id: 7d79bb74ac202ea9fcb2da4914790ab5e17056ba $
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 
# From the Solarflare Support website, http://support.solarflare.com/ :
#   ``SolarCapture is a set of tools for capturing, timestamping, processing
#   and injecting network traffic. SolarCapture is able to capture packets
#   received from the network at very high rates, apply filtering in hardware
#   and software, perform custom processing, and write packets to disk in PCAP
#   format.'' (06/24/2014)

pkgname='solar_capture'
pkgdesc="A set of tools for capturing, timestamping, processing, and injecting network traffic."
pkgver='1.3.1.11'
_kernelver="$(uname -r)"
_sfcrel='0'
pkgrel=1
arch=('x86_64')
url='http://www.solarflare.com/SolarCapture-Packet-Capture-Software'
license=('custom')
depends=('openonload' 'sfptpd' 'libpcap' 'python2' 'libaio')
makedepends=('rpmextract' 'openonload'
             'python2' 'libaio' 'libpcap' 'findutils')
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=('http://127.0.0.1/SF-111817-DH-9_(SF-112972-LS-2)_SolarCapture_SDK.zip'
        'http://127.0.0.1/SF-111817-DH-9_(SF-112974-LS-2)_SolarCapture_Live_Pro_RPMs.zip'
        'http://127.0.0.1/SF-111817-DH-9_(SF-108469-CD-9)_SolarCapture_User_Guide.pdf')
sha512sums=('SKIP'
            'SKIP'
            'SKIP')
#install=
_python_sitelib="$(python2 -c 'from distutils.sysconfig import get_python_lib; import sys; sys.stdout.write(get_python_lib())')"

pkgver() {
    cd "${srcdir}"
    ls solar_capture-pro-*.x86_64.rpm | sed 's/^solar_capture-pro-\([0-9\.]*\)\(-[0-9]*\)\?.x86_64.rpm$/\1/'
}

prepare() {
  # SDK
  rpmextract.sh ${srcdir}/${pkgname}-core-${pkgver}-${_sfcrel}.x86_64.rpm
  rpmextract.sh ${srcdir}/${pkgname}-python-${pkgver}-${_sfcrel}.src.rpm
  # Live
  rpmextract.sh ${srcdir}/${pkgname}-live-${pkgver}-${_sfcrel}.x86_64.rpm
  # Pro
  rpmextract.sh ${srcdir}/${pkgname}-pro-${pkgver}-${_sfcrel}.x86_64.rpm
  tar xvzf ${pkgname}-python-${pkgver}.tgz
  sed -i '1 s/\bpython\b/python2/' "${srcdir}/usr/bin/solar_capture"
  sed -i '1 s/\bpython\b/python2/' "${srcdir}/usr/bin/solar_replay"
  sed -i '1 s/\bpython\b/python2/' "${srcdir}/${pkgname}-python-${pkgver}/src/solar_capture_monitor"
  sed -i '1 s/\bpython\b/python2/' "${srcdir}/${pkgname}-python-${pkgver}/src/solar_capture_doc"
}

build() {
  case $CARCH in
    "x86_64")
      # x64 build
      pushd ${pkgname}-python-${pkgver}/src
        SC_LIBRARY=${srcdir}/usr/lib64 \
        SC_INCLUDE=${srcdir}/usr/include \
        SC_RPM_BUILD=1 \
        SC_PYTHON=python2 \
        SC_PYTHON_CONFIG=python2-config \
        make python/solar_capture_c.so
      popd
    ;;
    *)
      # unsupported
      echo "Unsupported architecture."
      exit 1
    ;;
  esac
}

package() {
  cd "${srcdir}"

  mv "${srcdir}/usr" "${pkgdir}/."

  cd "${srcdir}/${pkgname}-python-${pkgver}"

  # Binaries:
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "src/solar_capture_monitor" "${pkgdir}/usr/bin"
  install -m755 "src/solar_capture_doc" "${pkgdir}/usr/bin"

  # Python module:
  install -dm755 "${pkgdir}/${_python_sitelib}/${pkgname}"
  install -m644 "src/python/solar_capture_c.so" \
      "${pkgdir}/${_python_sitelib}/"
  for i in __init__.py cli.py shm.py stats.py tabulate.py
  do
    install -m644 "src/python/${pkgname}/${i}" \
        "${pkgdir}/${_python_sitelib}/${pkgname}"
  done

  # Documentation:
  docdir="${pkgdir}/usr/share/doc/${pkgname}"
  install -dm755                  "${docdir}"
  install -m644 docs/LICENSE.txt  "${docdir}"
  install -m644 docs/README       "${docdir}"
  install -m644 docs/ReleaseNotes "${docdir}"
  install -m644 docs/ChangeLog    "${docdir}"
  install -m644 \
    "${srcdir}/SF-111817-DH-9_(SF-108469-CD-9)_SolarCapture_User_Guide.pdf" \
    "${docdir}"
  install -dm755 "${docdir}/examples/c_api"
  install -m 644 src/examples/c_api/* \
      "${docdir}/examples/c_api"
  install -dm755 "${docdir}/examples/c_api_export"
  install -m 644 src/examples/c_api_export/* \
      "${docdir}/examples/c_api_export"
  install -dm755 "${docdir}/examples/extensions_api"
  install -m 644 src/examples/extensions_api/* \
      "${docdir}/examples/"
  install -dm755 "${docdir}/examples/unmanaged"
  install -m 644 src/examples/unmanaged/* \
      "${docdir}/examples/unmanaged"
  install -dm755 "${docdir}/examples/py_api"
  install -m 644 src/examples/py_api/* \
      "${docdir}/examples/py_api"

  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/LICENSE.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
