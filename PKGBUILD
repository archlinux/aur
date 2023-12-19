# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

# Todo: Is modules.conf needed?
# Todo: Will multiple boards enumerate in a different order on each boot?

# Digi bug: change literal "dgnc" to DRVSTR or PROCSTR
# Digi bug: viewing /proc/dgnc/0/[0-9]/sniff hangs terminal
# Digi bug: multiple PCI cards not fully supported. Some cards may be non functional. Boot over and over to get them all to work.
# Digi bug: Non functional in 5.15 even with just one card

# Stopped working after kernel version 5.14.0: /dev/ttyn1a: No such device or address
# also works not well in 5.10. rmmod modprobe doesn't fix it. Must reboot over and over until it's fixed.
# Pretty much dead

_opt_DKMS=1              # This can be toggled between installs
_opt_defaultmode="0660"  # default: 0600
_opt_defaultgroup="uucp" # default: root

#export KERNELRELEASE="$(basename $(dirname /usr/lib/modules/5.10.*/modules.alias))"

# ls -l /dev | grep ',' | sort -n -k 5.1 | less

set -u
pkgname='digi-dgnc'
#_pkgver='1.3-28'; _dl='40002369_G.tgz'
_pkgver='1.3-29'; _dl='40002369_H.src.rpm'
pkgver="${_pkgver//-/.}"
pkgrel='8'
pkgdesc='tty driver for Digi Neo and legacy ClassicBoard PCI PCIe RS-232 serial port'
arch=('i686' 'x86_64')
url='https://www.digi.com/'
# https://hub.digi.com/support/products/infrastructure-management/
license=('GPL')
options=('!strip' '!buildflags')
install="${pkgname}-install.sh"
_srcdir="${pkgname##*-}-${pkgver%.*}"
source=(
  "${pkgname##*-}-${pkgver}-${_dl}::http://ftp1.digi.com/support/driver/${_dl}"
  '0000-Kernel-4-14-DRIVER-ATTR.patch' # https://patchwork.kernel.org/patch/9851919/ Available since 3.11-rc2
  '0001-Kernel-4-15-timers.patch'
  '0002-kernel-5.0.0-do_gettimeofday.patch'
  '0003-kernel-5.6--proc_dir_entry-proc_ops.patch'
  '0004-kernel-5.12-MODULE_SUPPORTED_DEVICE.patch'
  '0005-kernel-5.13-dropped-tty_check_change.patch'
  '0006-kernel-5.14-task_struct.state-unsigned-tty.patch'
  '0007-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  '0008-kernel-6.1-remove-TTY_MAGIC.patch'
  '0009-kernel-5.17-change-PDE_DATA.patch'
  '0010-kernel-6.1-INIT_C_CC-termios_internal.patch'
  '0011-kernel-6.0-set_termios-const-ktermios.patch'
  '0012-kernel-6.4-class_create-1arg.patch'
  '0013-kernel-6.4-DEFINE_SEMAPHORE-2arg.patch'
  '0014-kernel-6.6-struct-tty_operations-write-size_t.patch'
)
md5sums=('6171349852f6d02228d6e30c79b7a434'
         'a171e9ea1a4ff8340c3c58b303632edf'
         '6c16c3c24c79fb558bcf27f780829c75'
         '8e46a778c648ab4f0ca63a337d36df60'
         '394d24a150676d8123300d6715b81fb8'
         '44b0a7b0ab4dbe661b822fcba9423121'
         '98f1684623d45f66e42f78e5ab8fd8c2'
         '89de6a694ecf827a3358bcd8aea03a6a'
         '58d75d8f86830d09ba8754d4e03a6a9d'
         '7ceda3eaa776322b2042de8d159535ea'
         '9371ea6968666c58413a463fcf341d1f'
         '53bcd11e5e4acbd0466b3ffdda3b263b'
         '6475487a9415d3dc7ece9dd888cec92c'
         '7824cfd37ca3c7dd27e911c679f8256c'
         'bbae50830fad8e9e2b674078c2770aee'
         'b1584c28e0e1d6741ff4e7cca25761d8')
sha256sums=('e121a31569e3e1f156caeed70742971ec32fef598429ef647bde98f56aa048f5'
            '625bb794d31690b45ad7469f811e7422dac938cf8e9b777aba4d97b60b3c6eae'
            '88d5a8589dca55ca98089dfa4570aa1fbde1095957d0788ad710a27b348c2f4f'
            '737df02a12fc76841325d1059d90451467637eab2df016efc20d84976eb5de7d'
            '3496e90914e1fa2f209dd85c336e7b1c0b784dbbf67cc45e0f0f55f0b1ef5a0e'
            'f215451df4a01f0875a53425b6d8452c344f19b61b59b821f8c949b1b276c022'
            'f5eebe58f625b493cf8cb4c7fb8630fd4d0f9fa278ce4400b011fd702bd2db90'
            'dcedb22e0f3fb0c8197630b38217f86c5468d065ab2d67708c16c17351d6944e'
            '0693e13442749c40a338320cca72dd8aad23678ea7cae035e6bab01a40640c44'
            '718e5104ff4caf153757dd2f8c143402d2c175fd838cfc5db3f47618efd40230'
            'b5000b9bb68ae8ddc173b666ead6d60fa329aa4d5d96636af4717a131827748c'
            'c0786d12440da829f0a57ca9e7f2c3114edbd88213bb66687ac84730ee7c8ed1'
            'ab4921079d2a4ee3316bbea3bcb3ff7844d8ced73b6b4327d3c580088bc511b1'
            '021745fab94745eaea1abc503a1f7ec94dfa6132f841d5ce2bb969dcb049eda6'
            '40ee1fb8e261008d810c7251de5612029fa9c8b83a58bdd3279dd64467cb1bed'
            '414f1115e195616945ac8d597bfd59a9ae3b8ec392c8f06f15213efa662e6433')

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

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0000}; false
  #diff -pNaru5 dgnc-1.3{.orig-0000,} > '0000-Kernel-4-14-DRIVER-ATTR.patch'
  patch -Nup1 -i "${srcdir}/0000-Kernel-4-14-DRIVER-ATTR.patch"
  test ! -d "${srcdir}/${_srcdir}.orig-0000" || echo "${}"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0001}; false
  #diff -pNaru5 dgnc-1.3{.orig-0001,} > '0001-Kernel-4-15-timers.patch'
  patch -Nup1 -i "${srcdir}/0001-Kernel-4-15-timers.patch"
  test ! -d "${srcdir}/${_srcdir}.orig-0001" || echo "${}"

  #cp -p driver/2.6.27/dgnc_tty.c{,.orig}; false
  #diff -pNau5 driver/2.6.27/dgnc_tty.c{.orig,} > '0002-kernel-5.0.0-do_gettimeofday.patch'
  patch -Nup0 -i "${srcdir}/0002-kernel-5.0.0-do_gettimeofday.patch"

  #cp -pr driver/2.6.27{,.orig}; false
  #diff -pNaru5 driver/2.6.27{.orig,} > '0003-kernel-5.6--proc_dir_entry-proc_ops.patch'
  patch -Nup0 -i "${srcdir}/0003-kernel-5.6--proc_dir_entry-proc_ops.patch"

  #rm -f driver/2.6.27/*.orig; cp -pr driver/2.6.27{,.orig}; false
  #diff -pNaru5 driver/2.6.27{.orig,} > '0004-kernel-5.12-MODULE_SUPPORTED_DEVICE.patch'
  patch -Nup0 -i "${srcdir}/0004-kernel-5.12-MODULE_SUPPORTED_DEVICE.patch"

  #rm -f driver/2.6.27/*.orig; cp -pr driver/2.6.27{,.orig}; false
  #diff -pNaru5 driver/2.6.27{.orig,} > '0005-kernel-5.13-dropped-tty_check_change.patch'
  patch -Nup0 -i "${srcdir}/0005-kernel-5.13-dropped-tty_check_change.patch"

  #rm -f driver/2.6.27/*.orig; cp -pr driver/2.6.27{,.orig}; false
  #diff -pNaru5 driver/2.6.27{.orig,} > '0006-kernel-5.14-task_struct.state-unsigned-tty.patch'
  patch -Nup0 -i "${srcdir}/0006-kernel-5.14-task_struct.state-unsigned-tty.patch"

  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08799.html [PATCH 5/8] tty: drop alloc_tty_driver
  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08801.html [PATCH 7/8] tty: drop put_tty_driver
  #rm -f driver/2.6.27/*.orig; cp -pr driver/2.6.27{,.orig}; false
  #diff -pNaru5 driver/2.6.27{.orig,} > '0007-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  patch -Nup0 -i "${srcdir}/0007-kernel-5.15-alloc_tty_driver-put_tty_driver.patch"

  # https://lore.kernel.org/lkml/723478a270a3858f27843cbec621df4d5d44efcc.1663288066.git.nabijaczleweli@nabijaczleweli.xyz/T/
  # cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0008-kernel-6.1-remove-TTY_MAGIC.patch'
  patch -Nup1 -i "${srcdir}/0008-kernel-6.1-remove-TTY_MAGIC.patch"

  # https://www.spinics.net/lists/linux-fsdevel/msg207433.html
  # cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0009-kernel-5.17-change-PDE_DATA.patch'
  patch -Nup1 -i "${srcdir}/0009-kernel-5.17-change-PDE_DATA.patch"

  # https://www.uwsg.indiana.edu/hypermail/linux/kernel/1809.1/00449.html
  #cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0010-kernel-6.1-INIT_C_CC-termios_internal.patch'
  patch -Nup1 -i "${srcdir}/0010-kernel-6.1-INIT_C_CC-termios_internal.patch"

  # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/
  # cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0011-kernel-6.0-set_termios-const-ktermios.patch'
  patch -Nup1 -i "${srcdir}/0011-kernel-6.0-set_termios-const-ktermios.patch"

  #cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0012-kernel-6.4-class_create-1arg.patch'
  patch -Nup1 -i "${srcdir}/0012-kernel-6.4-class_create-1arg.patch"

  #cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0013-kernel-6.4-DEFINE_SEMAPHORE-2arg.patch'
  patch -Nup1 -i "${srcdir}/0013-kernel-6.4-DEFINE_SEMAPHORE-2arg.patch"

  #cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0014-kernel-6.6-struct-tty_operations-write-size_t.patch'
  patch -Nup1 -i "${srcdir}/0014-kernel-6.6-struct-tty_operations-write-size_t.patch"

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
  #cp -p 'driver/2.6.27/Makefile26'{,.Arch}
  sed -e 's/^clean:$/&\n\trm -f .cache.mk/g' \
      -e '# Use built in clean' \
      -e 's:clean:clean_local:g' \
      -e 's~^clean_local:~clean:\n\tmake -C @KERNEL_HEADERS@ SUBDIRS=$$PWD clean\n\n&~g' \
      -e '# Kernel 5.4 compatible' \
      -e 's: SUBDIRS=\([^ ]\+\) : M=\1&:g ' \
      -e 's:@MODDIR@:/usr/lib/modules/$(KERNELRELEASE):g' \
      -e 's:@KERNEL_HEADERS@:/usr/lib/modules/$(KERNELRELEASE)/build:g' \
      -e '# Not a good way to sub variables' \
      -e '/^MODDIR =/ s:\$(shell echo \(.*\))$:\1:g' \
      -e '# Anything using these must fail' \
      -e '/MOD = \// s:^:#:g' \
      -e '1i KERNELRELEASE?=$(shell uname -r)' \
    -i 'driver/2.6.27/Makefile26'
    test ! -s 'driver/2.6.27/Makefile26.Arch'

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
  set +u; msg2 'Build config'; set -u
  #CPPFLAGS="${CPPFLAGS//-D_FORTIFY_SOURCE=2/}" \ 
  make -C 'config' -j1
  set +u; msg2 'Build'; set -u
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
    make -C "${_dkms}/driver/build/" clean KERNELRELEASE="$(uname -r)" MYPWD="${_dkms}/driver/build/"
  fi
  set +u
}

set +u
