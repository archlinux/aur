# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Paul Hunnisett <phunnilemur@gmail.com>

# Driver source: Lexmark X4650, Fedora 15

# TODO: Does the V305w have a different Nickname for autodetect?
# Scanner doesn't work on v305. Maybe it does for the Lexmark X4650.
# Many of the same drivers are in lexmark_pro700 as 64-bit

# Inkjet AIO
# X3650 X4630 X4650 X4690 X4950 X4975 X4975ve X5070 X5075 X5630 X5650 X5650ES X5690 X6650 X6675 X6690 X7675

# Inkjet Consumer
# z2420

_opt_Scanner=0 # 1 if you want to try getting the scanner working. See lexmark-inkjet-legacy for a valid .conf file.

set -u
pkgname='lexmark-08z' # sometimes called lexmark-inkjet-08z
pkgver='1.0_1'
pkgrel='1'
pkgdesc='printer driver for Lexmark Z2420 X3650 X4630 X4650 X4690 X4950 X4975 X5070 X5075 X5630 X5650 X5690 X6650 X6675 X6690 X7675 and Dell v305 v305w'
arch=('i686' 'x86_64')
url='http://www.lexmark.com/'
license=('custom')
depends=('cups')
depends_i686=('glibc' 'libcups' 'ncurses5-compat-libs' 'gnutls' 'zlib' 'p11-kit' 'libidn' 'libtasn1' 'nettle' 'gmp' 'libffi')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
if [ "${_opt_Scanner}" -ne 0 ]; then
optdepends=(
  'libusb-compat: Scanner support'
  'sane: Scanner support' # don't know if scanning works
  'xsane: Scanner support'
)
fi
makedepends=('libarchive' 'sed')
options=('!strip') # not working on 32 bit ELF
install="${pkgname}.install"
# Both work the same. The RPM is a lot smaller due to better compression.
source=("http://downloads.lexmark.com/downloads/cpd/${pkgname}-series-driver-${pkgver//_/-}.i386.rpm.sh.tar.gz")
#source=("http://downloads.lexmark.com/downloads/cpd/${pkgname}-series-driver-${pkgver//_/-}.i386.deb.sh.tar.gz")
source+=('Lexmark08_1_0_0.conf') # experimental
sha256sums=('4c39ab39c8848868d49489cdaaa57b3f04e99437807fe2e9db506ef0373c2ecb'
            'e555b2bbf93a148414cebd79563bc74dfbda90eaf802fa54f6ea003638dad2ba')

prepare() {
  set -u
  local _f="${pkgname}-series-driver-${pkgver//_/-}.i386"
  if [ "${source[0]//deb/}" != "${source[0]}" ]; then
    sh -e "${_f}.deb.sh" --noexec --keep --target 'lexmark-1'
    mkdir 'lexmark-2'
    cd 'lexmark-2'
    bsdtar -xf '../lexmark-1/instarchive_all'
    bsdtar -xf "${_f}.deb"
    mkdir '../lexmark-3'
    cd '../lexmark-3'
    bsdtar -xf '../lexmark-2/data.tar.gz'
    bsdtar -xf '../lexmark-2/control.tar.gz'
    mv 'postinst' 'POSTIN'
  else
    sh -e "${_f}.rpm.sh" --noexec --keep --target 'lexmark-1'
    mkdir 'lexmark-2'
    cd 'lexmark-2'
    bsdtar -xf '../lexmark-1/instarchive_all'
    mkdir '../lexmark-3'
    cd '../lexmark-3'
    bsdtar -xf "../lexmark-2/${_f}.rpm"
    #rpm -qp "../lexmark-2/${_f}.rpm" --queryformat "%{POSTIN}" > 'POSTIN'; echo "" >> 'POSTIN'
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
  cp -dprx "${srcdir}/lexmark-3/usr/local/lexmark"/* "${pkgdir}/usr/lexinkjet/"
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

  if [ "${_opt_Scanner}" -eq 0 ]; then
    rm -r "${pkgdir}/etc/sane.d/" "${pkgdir}/usr/lib/sane/"
    # replicate POSTIN. The Debian scripts are easy to unpack. View the rpm scripts in mc after installing 'rpm-org'.
  else
    local XSANE_CUSTOM_LOGO='Lexmark-logo.xpm'
    local XSANE_LOGO_DIR='/usr/share/sane/xsane'
    install -d "${pkgdir}${XSANE_LOGO_DIR}/"
    (cd "${pkgdir}${XSANE_LOGO_DIR}/"; ln -s "${RPM_INSTALL_PREFIX}/08zero/etc/${XSANE_CUSTOM_LOGO}")

    install -Dpm644 <(echo 'Lexmark08_1_0_0') "${pkgdir}/etc/sane.d/dll.d/${pkgname}"
  fi

  # Dell v305 patch without breaking the Lexmark
  # Google Search: Dell 413C 5305
  # https://david.dw-perspective.org.uk/da/index.php/computer-resources/getting-a-dell-v305-and-others-printer-to-work-with-linux-fedora/
  # https://oper.io/?p=Dell_V305_Printer_on_Linux
  cd "${pkgdir}${RPM_INSTALL_PREFIX}/08zero/etc/"
  # Install the helper script that debugged the lib32 problem. I'm ready to test libraries even though it turned out not to be a lib problem.
  if ! :; then
    (
      cd '../bin'
      mv 'printdriver' 'printdriver.arch'
      install -m755 <(cat << EOF
#!/bin/bash

LD_LIBRARY_PATH='/usr/lexinkjet/08zero/bin/' strace -o '/tmp/strace.txt' '/usr/lexinkjet/08zero/bin/printdriver.arch' "\$@"
EOF
      ) 'printdriver'
    )
  fi
  sed -e '2iATTRS{idVendor}=="413c", ATTRS{idProduct}=="5305", MODE="666"' -i "99-${pkgname}.rules"
  (
    #declare -A _arch=([i686]='lib' [x86_64]='lib32')
    declare -A _arch=([i686]='lib' [x86_64]='lib')
    cd '../lib'
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

  # The configuration file doesn't look like the others.
  # We copy and update the one from lexmark-inkjet-08
  if false && [ "${_opt_Scanner}" -ne 0 ]; then
    local _saneppd VID PID
    local _txt=''
    for _saneppd in *.ppd; do
      if [ "${_saneppd#lxZ}" = "${_saneppd}" ]; then # z printers don't have a scanner
        PID="$(sed -n -e 's/^\*PID: "\([^"]\+\)"/\1/p' "${_saneppd}")" # '
        VID="$(sed -n -e 's/^\*VID: "\([^"]\+\)"/\1/p' "${_saneppd}")" # '
        _txt+="# ${_saneppd%\.ppd}\\nusb ${PID} ${VID}\n"
      fi
    done
    #echo -e "${_txt}"
    sed -e 's:^usb 0x.*$:'"${_txt}:g" "${srcdir}/Lexmark08_1_0_0.conf" > 'Lexmark08_1_0_0.conf'
  fi

  local PPD_OEM='Lexmark'
  local CUPS_PPD_ROOT1='/usr/share/ppd/'
  local CUPS_PPD_ROOT2='/usr/share/cups/model/'
  #install -Dpm644 *.ppd -t "${pkgdir}${CUPS_PPD_ROOT1}/${PPD_OEM}/" # This makes each printer show double.
  # For some reason the installer does not add lx5000.ppd. This is the driver provided for the X5070 so it should work.
  install -Dpm644 *.ppd -t "${pkgdir}${CUPS_PPD_ROOT2}/${PPD_OEM}/"

  install -Dm644 '../docs/license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
