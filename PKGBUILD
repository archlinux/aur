# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

# Todo: Is modules.conf needed?
# Todo: Will multiple boards enumerate in a different order on each boot?

# Digi bug: change literal "dgnc" to DRVSTR or PROCSTR
# Digi bug: viewing /proc/dgnc/0/[0-9]/sniff hangs terminal

_opt_DKMS=1              # This can be toggled between installs
_opt_defaultmode="0660"  # default: 0600
_opt_defaultgroup="uucp" # default: root

# ls -l /dev | grep ',' | sort -n -k 5.1 | less

set -u
pkgname='digi-dgnc'
#_pkgver='1.3-28'; _dl='40002369_G.tgz'
_pkgver='1.3-29'; _dl='40002369_H.src.rpm'
pkgver="${_pkgver//-/.}"
pkgrel='3'
pkgdesc='tty driver for Digi Neo and legacy ClassicBoard PCI PCIe RS-232 serial port'
arch=('i686' 'x86_64')
url='https://www.digi.com/'
license=('GPL')
options=('!strip')
install="${pkgname}-install.sh"
_srcdir="${pkgname##*-}-${pkgver%.*}"
source=(
  "${pkgname##*-}-${pkgver}-${_dl}::http://ftp1.digi.com/support/driver/${_dl}"
  '0000-Kernel-4-14-DRIVER-ATTR.patch' # https://patchwork.kernel.org/patch/9851919/ Available since 3.11-rc2
  '0001-Kernel-4-15-timers.patch'
  '0002-kernel-5.0.0-do_gettimeofday.patch'
)
sha256sums=('e121a31569e3e1f156caeed70742971ec32fef598429ef647bde98f56aa048f5'
            '625bb794d31690b45ad7469f811e7422dac938cf8e9b777aba4d97b60b3c6eae'
            '88d5a8589dca55ca98089dfa4570aa1fbde1095957d0788ad710a27b348c2f4f'
            '737df02a12fc76841325d1059d90451467637eab2df016efc20d84976eb5de7d')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

_modulename='dgnc_digi'
_origmodname='dgnc'

# We can't modify .install but we can stop and force the user to fix it.
_install_check() {
  local _ckvar
  local _ckline
  local _pkgname="${pkgname}"
  for _ckvar in '_pkgname' '_modulename'; do
    _ckline="${_ckvar}='${!_ckvar}'"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      msg "${install} must be fixed"
      echo "${_ckline}"
      set +u
      false
    fi
  done
}

prepare() {
  set -u
  _install_check

  # Extract from src RPM
  if [ ! -d "${_srcdir}" ]; then
    set +u; msg2 "Extracting ${_srcdir}.tgz with bsdtar"; set -u
    bsdtar -xf "${_srcdir}.tgz"
  fi
  cd "${_srcdir}"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0000}
  #diff -pNaru5 dgnc-1.3{.orig-0000,} > '0000-Kernel-4-14-DRIVER-ATTR.patch'
  patch -Nup1 -i "${srcdir}/0000-Kernel-4-14-DRIVER-ATTR.patch"
  test ! -d "${srcdir}/${_srcdir}.orig-0000" || echo "${}"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0001}
  #diff -pNaru5 dgnc-1.3{.orig-0001,} > '0001-Kernel-4-15-timers.patch'
  patch -Nup1 -i "${srcdir}/0001-Kernel-4-15-timers.patch"
  test ! -d "${srcdir}/${_srcdir}.orig-0001" || echo "${}"

  #cp -p driver/2.6.27/dgnc_tty.c{,.orig}; false
  #diff -pNau5 driver/2.6.27/dgnc_tty.c{.orig,} > '0002-kernel-5.0.0-do_gettimeofday.patch'
  patch -Nbup0 -i "${srcdir}/0002-kernel-5.0.0-do_gettimeofday.patch"

  # Version check
  local _ver
  _ver="$(grep -e 'TRUE_VERSION=' ./Makefile.inc | cut -d'"' -f2)"
  if [ "${_pkgver}" != "${_ver}" ]; then
    echo "Version mismatch ${_pkgver} != ${_ver}"
    set +u
    false
  fi
  unset _ver

  # Fix configure
  sed -e '# Cosmetic fix for newer gcc compilers' \
      -e 's:\(3.9\*|4.\*\))$:\1|5.*|6.*|7.*|8.*):g' \
      -e "# I can't find any other way to fix the modules dir" \
      -e 's:/lib/modules/:/usr&:g' \
      -e '# Kill a harmless mkdir error. They mkdir the folder then dont use it.' \
      -e 's@^\(\s\+\)\(mkdir -p /usr/lib/modules/${osrel}/misc\)$@\1: #\2@g' \
    -i 'configure'

  # Some files ignore configure --sbindir
  sed -e 's:/sbin:/bin:g' -i 'config/Makefile.in' 'config/10-dgnc.rules'

  # make postinstall package compatible
  # cp -p 'scripts/postinstall'{,.Arch} # DEBUG for comparison
  sed -e '# fix sbin' \
      -e 's:/usr/sbin/:/usr/bin/:g' \
      -e 's:/sbin/:/usr/bin/:g' \
      -e '# Make package compatible' \
      -e 's:/usr:"${DESTDIR}"&:g' \
      -e 's:/etc:"${DESTDIR}"&:g' \
      -e '# Remove package from symlinks' \
      -e 's:ln -s "${DESTDIR}":ln -s :g' \
      -e '# Remove package from module.conf' \
      -e 's:\(post-install dgnc \)"${DESTDIR}":\1:g' \
      -e '# Kill the noise' \
      -e '/^printf /,$ s:printf:true &:' \
    -i 'scripts/postinstall'
  test ! -s 'scripts/postinstall.Arch' || echo "${}"

  # new folder in gcc 8
  sed -e 's/^clean:$/&\n\trm -f .cache.mk/g' \
      -e '# Use built in clean' \
      -e 's:clean:clean_local:g' \
      -e 's~^clean_local:~clean:\n\tmake -C @KERNEL_HEADERS@ SUBDIRS=$$PWD clean\n\n&~g' \
      -e '# Kernel 5.4 compatible' \
      -e 's: SUBDIRS=\([^ ]\+\) : M=\1&:g ' \
    -i driver/*/Makefile*

  # Branding in dmesg
  sed -e '/^static int dgnc_start/,/^}$/ s@^\(\s\+\)APR(("For@'"\1APR((DRVSTR\": Arch Linux https://aur.archlinux.org/packages/${pkgname}/\"));\n&@g" \
    -i driver/*/dgnc_driver.c

  # Fix module text "dgnc" to DRVSTR
  sed -e '/^MODULE_SUPPORTED_DEVICE/ s:"dgnc":DRVSTR:g' \
      -e '/^static struct pci_driver dgnc_driver/,/^$/ s:"dgnc":DRVSTR:g' \
    -i driver/*/dgnc_driver.c
  sed -e '# printk("dgnc: Any text here' \
      -e 's|\(printk([^"]*\)"dgnc:|\1 DRVSTR":|g' \
      -e '# printk("Any text here dgnc' \
      -e 's:\(printk("[^"]\+\)\bdgnc\b:\1"DRVSTR":g' \
    -i $(grep -lre "printk.*dgnc" 'driver')
  # Fix text for /proc/dgnc to PROCSTR
  sed -e '/register_chrdev/ s:"dgnc":PROCSTR:g' \
    -i driver/*/dgnc_driver.c
  sed -e '/proc_create/ s:"dgnc":PROCSTR:g' \
      -e '/proc_mkdir/ s:"dgnc":PROCSTR:g' \
      -e 's:/dev/dg/dgnc/:/dev/dg/"PROCSTR"/:g' \
    -i driver/*/dgnc_proc.c

  # Change module name to prevent conflict with built in module and staging module
  if [ "${_modulename}" != "${_origmodname}" ]; then
    # Change Makefile. Should this be done as a Make variable?
    sed -e "s:${_origmodname}\([-.]\):${_modulename}\1:g " \
        -e '/^unload:/,/^$/'" s:${_origmodname}:${_modulename}:g" \
      -i driver/*/Makefile*
    # Change driver header
    sed -e "/^#define\sDRVSTR/ s:${_origmodname}:${_modulename}:g" \
        -e '# Just a test to see if our PROCSTR subs work right' \
        -e '#/^#define\sPROCSTR/ s:dgnc:ArchLinuxTest:g' \
      -i driver/*/include/dgnc_driver.h
  fi
  set +u
}

_configure() {
  if [ ! -s 'Makefile' ]; then
    ./configure --sbindir='/usr/bin' --prefix='/usr' --mandir='/usr/share/man' TAR='/usr/bin/bsdtar'
  fi
}

build() {
  set -u
  cd "${_srcdir}"
  _configure
  CPPFLAGS="${CPPFLAGS//-D_FORTIFY_SOURCE=2/}" \
  make -C 'config' -j1
  make -j1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  if [ "${_opt_DKMS}" -eq 0 ]; then
    # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
    local _kernelversionsmall="$(uname -r)"
    _kernelversionsmall="${_kernelversionsmall%%-*}"
    _kernelversionsmall="${_kernelversionsmall%\.0}" # trim 4.0.0 -> 4.0, 4.1.0 -> 4.1
    # prevent the mksrcinfo bash emulator from getting these vars!
    #eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  make -s BUILDROOT="${pkgdir}" install

  # Correct group and chmod for serial
  if [ ! -z "${_opt_defaultmode:-}" ]; then
    sed -e 's:^\(KERNEL=="tty_dgnc\)\(.*\)$:\1\2, MODE="'"${_opt_defaultmode}"'", GROUP="'"${_opt_defaultgroup}"'":g' -i "${pkgdir}/etc/dgnc/10-dgnc.rules"
  fi

  # Postinstall
  install -d "${pkgdir}/etc/udev/rules.d"
  #install -Dm644 /dev/null "${pkgdir}/etc/modules.conf" # seems not needed
  DESTDIR="${pkgdir}" \
  sh -e -u "${pkgdir}/etc/dgnc/postinstall"
  rm "${pkgdir}/etc/dgnc"/{postinstall,preuninstall}

  # dgrp and dgnc both provide dinc and ditty. That's why they do it in postinstall.
  local _exes=('dinc' 'ditty')
  local _exe
  for _exe in "${_exes[@]}"; do
    mv "${pkgdir}/usr/bin/${_exe}"{,-dgnc}
  done

  # move init.d. Turns out it's not needed
  # mv "${pkgdir}/etc/init.d/dgnc" "${pkgdir}/etc/dgnc/dgnc"
  # rmdir "${pkgdir}/etc/init.d"
  rm -r "${pkgdir}/etc/init.d"

  # The module is in the same folder as DKMS. Compress to a different name to prevent conflict.
  # When future versions of DKMS compress we'll stop doing this.
  find "${pkgdir}/usr/lib/modules/" -type 'f' -name '*.ko' -exec 'gzip' '-9' '{}' ';'

  # Blacklist built in modules
  local _blor=''
  if [ "${_modulename}" != "${_origmodname}" ]; then
    _blor='#'
  fi
  install -Dpm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# IBM branded Digi Neo
blacklist jsm
# Staging driver
${_blor}blacklist ${_origmodname}
EOF
  ) "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
  unset _blor

  # DKMS
  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -r "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="${_modulename}"
BUILT_MODULE_LOCATION[0]="driver/build"
# Using all processors doesn't compile this tiny module any faster.
MAKE[0]="make -j1 -C 'driver/build'"
CLEAN[0]="make -j1 -C 'driver/build' clean"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[0]="/kernel/drivers/char"
EOF
    ) "${_dkms}/dkms.conf"
    install -dm755 "${_dkms}/driver/build/"
    cp -pr 'driver/build/' "${_dkms}/driver/"
    rm "${_dkms}/driver/build/"/Makefile?*
    install -Dpm644 'dpa/dpacompat.h' -t "${_dkms}/dpa"
    install -pm644 'Makefile.inc' -t "${_dkms}/"
    sed -e 's:/usr/lib/modules/[^/]\+/:/usr/lib/modules/$(KERNELRELEASE)/:g' \
        -e '# Not a good way to sub variables' \
        -e '/^MODDIR =/ s:\$(shell echo \(.*\))$:\1:g' \
        -e '# Anything using these must fail' \
        -e '/MOD = \// s:^:#:g' \
       -i "${_dkms}/driver/build/Makefile"
    make -C "${_dkms}/driver/build/" clean KERNELRELEASE="$(uname -r)" MYPWD="${_dkms}/driver/build/"
  fi
  set +u
}

set +u
