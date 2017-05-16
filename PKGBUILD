# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Paul Hunnisett <phunnilemur@gmail.com>

# TODO: Does the v305w have the same USB PID?
# Scanner doesn't work on v305. Maybe it does for the Lexmark.
# Many of the same drivers are in lexmark_pro700 as 64-bit

set -u
pkgname='lexmark-08z' # sometimes called lexmark-inkjet-08z
pkgver='1.0.4'
pkgrel='1'
pkgdesc='printer driver for Lexmark Z2400 3600 4600 X4650 4900 5000 5600 6600 7600 and Dell v305 v305w'
arch=('i686' 'x86_64')
url='http://www.lexmark.com/'
license=('custom')
depends=('cups')
depends_i686=('glibc' 'libcups' 'ncurses5-compat-libs' 'gnutls' 'zlib' 'p11-kit' 'libidn' 'libtasn1' 'nettle' 'gmp' 'libffi')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
optdepends=(
  'libusb-compat: Scanner support'
  'sane: Scanner support' # don't know if scanning works
  'xsane: Scanner support'
)
makedepends=('libarchive' 'sed')
options=('!strip') # not working on 32 bit ELF
install="${pkgname}.install"
# Both work the same. The RPM is a lot smaller due to better compression.
source=('http://downloads.lexmark.com/downloads/cpd/lexmark-08z-series-driver-1.0-1.i386.rpm.sh.tar.gz')
#source=('http://downloads.lexmark.com/downloads/cpd/lexmark-08z-series-driver-1.0-1.i386.deb.sh.tar.gz')
sha256sums=('4c39ab39c8848868d49489cdaaa57b3f04e99437807fe2e9db506ef0373c2ecb')

prepare() {
  set -u
  if [ "${source[0]//deb/}" != "${source[0]}" ]; then
    sh -e 'lexmark-08z-series-driver-1.0-1.i386.deb.sh' --noexec --keep --target 'tmp'
    mkdir 'instarchive_all'
    cd 'instarchive_all'
    bsdtar -xf '../tmp/instarchive_all'
    bsdtar -xf 'lexmark-08z-series-driver-1.0-1.i386.deb'
    mkdir '../lexmark'
    cd '../lexmark'
    bsdtar -xf '../instarchive_all/data.tar.gz'
    bsdtar -xf '../instarchive_all/control.tar.gz'
  else
    sh -e 'lexmark-08z-series-driver-1.0-1.i386.rpm.sh' --noexec --keep --target 'tmp'
    mkdir 'instarchive_all'
    cd 'instarchive_all'
    bsdtar -xf '../tmp/instarchive_all'
    mkdir '../lexmark'
    cd '../lexmark'
    bsdtar -xf '../instarchive_all/lexmark-08z-series-driver-1.0-1.i386.rpm'
  fi
  # Rampage through and fix permissions
  cd 'usr/local/lexmark'
  chmod 644 *link
  cd '08zero'
  chmod 644 docs/* etc/*
  set +u
}

package() {
  set -u
  cd "${pkgdir}"
  install -d "${pkgdir}/usr/lexinkjet/"
  cp -dprx "${srcdir}/lexmark/usr/local/lexmark"/* "${pkgdir}/usr/lexinkjet/"
  cd "${pkgdir}/usr/lexinkjet/"

  # Make included link generator package compatible
  sed -e '# Fix quoting' \
      -e 's:$RPM_INSTALL_PREFIX:"${RPM_INSTALL_PREFIX}":g' \
      -e '# Add pkgdir' \
      -e '/^mklink / s: /: "${pkgdir}"/:g' \
      -e '# no need for their complicated code' \
      -e '/^mklink / s:mklink :ln -s :g' \
    '08z-series-driver.link' > '08z-series-driver.link.Arch'
  # Can't place these in /usr/lib32. printdriver only looks in /usr/lib then seg faults
  #if [ "${CARCH}" = 'x86_64' ]; then
  #  sed -e 's:/usr/lib/lib:/usr/lib32/lib:g' -i '08z-series-driver.link.Arch'
  #  install -d "${pkgdir}/usr/lib32/"
  #fi
  install -d "${pkgdir}/etc/sane.d/"
  install -d "${pkgdir}/etc/udev/rules.d/"
  install -d "${pkgdir}/usr/lib/cups/backend/"
  install -d "${pkgdir}/usr/lib/sane/"
  local RPM_INSTALL_PREFIX='/usr/lexinkjet' # hard coded in the binaries
  pkgdir="${pkgdir}" \
  sh -e -u '08z-series-driver.link.Arch' "${RPM_INSTALL_PREFIX}"
  rm '08z-series-driver.link.Arch' *link '08zero/08zero'

  # replicate POSTIN. The Debian scripts are easy to unpack. View the rpm scripts in mc on any RPM distro.
  local XSANE_CUSTOM_LOGO='Lexmark-logo.xpm'
  local XSANE_LOGO_DIR='/usr/share/sane/xsane'
  install -d "${pkgdir}${XSANE_LOGO_DIR}/"
  (cd "${pkgdir}${XSANE_LOGO_DIR}/"; ln -s "${RPM_INSTALL_PREFIX}/08zero/etc/${XSANE_CUSTOM_LOGO}")

  local LIB_NAME='Lexmark08_1_0_0'
  install -Dpm644 <(echo "${LIB_NAME}") "${pkgdir}/etc/sane.d/dll.d/lexmark-08z"

  # Dell v305 patch without breaking the Lexmark
  # Google Search: Dell 413C 5305
  # https://david.dw-perspective.org.uk/da/index.php/computer-resources/getting-a-dell-v305-and-others-printer-to-work-with-linux-fedora/
  # https://oper.io/?p=Dell_V305_Printer_on_Linux
  cd "${pkgdir}${RPM_INSTALL_PREFIX}/08zero/etc/"
  sed -e '2iATTRS{idVendor}=="413c", ATTRS{idProduct}=="5305", MODE="666"' -i '99-lexmark-08z.rules'
  (
    #declare -A _arch=([i686]='lib' [x86_64]='lib32')
    declare -A _arch=([i686]='lib' [x86_64]='lib')
    cd ../lib
    for _file in liblxdx*; do
      ln -s "${RPM_INSTALL_PREFIX}/08zero/lib/${_file}" "${pkgdir}/usr/${_arch[${CARCH}]}/${_file//lxdx/lxdX}"
      _file="${_file%\.so}"
      ln -s "${RPM_INSTALL_PREFIX}/08zero/lib/${_file}.so" "${pkgdir}/usr/${_arch[${CARCH}]}/${_file//lxdx/lxdX}"
    done
  )
  local _file
  for _file in lxdx*; do
    ln -s "${_file}" "${_file//lxdx/lxdX}"
  done
  rm 'lxdX.conf'
  cp -dp 'lxdx.conf' 'lxdX.conf'
  cp -dp 'lx36-46.ppd' 'lx36-46-Dellv305.ppd'
  sed -e '# Change company and name for user' \
      -e 's@Lexmark 3600-4600 Series@Dell v305 (Lexmark X4650)@g' \
      -e 's:"Lexmark":"Dell":g' \
      -e '# produce new ppd and lxdx file' \
      -e 's:lx36-46.ppd:lx36-46-Dellv305.ppd:g' \
      -e 's:lxdx:lxdX:g' \
      -e '# Set values for automatic printer selection' \
      -e 's:0x0142:0x5305:g' \
      -e 's:0x043D:0x413C:g' \
    -i 'lx36-46-Dellv305.ppd'
  # Fix: A wrong printer is detected. Any printjobs are canceled.
  sed -e 's:^DEVICE_PID=0x0142.*$:DEVICE_PID=0x5305:g' \
      -e 's:^DEVICE_VID=0x043D.*$:DEVICE_VID=0x413C:g' \
     -i 'lxdX.conf'

  local PPD_OEM='Lexmark'
  local CUPS_PPD_ROOT1='/usr/share/ppd/'
  local CUPS_PPD_ROOT2='/usr/share/cups/model/'
  #install -Dpm644 *.ppd -t "${pkgdir}${CUPS_PPD_ROOT1}/${PPD_OEM}/" # This makes each printer show double.
  # For some reason the installer does not add lx5000.ppd. Maybe it doesn't work.
  install -Dpm644 *.ppd -t "${pkgdir}${CUPS_PPD_ROOT2}/${PPD_OEM}/"

  install -Dm644 '../docs/license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
