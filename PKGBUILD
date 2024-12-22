# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# Parallel support is not installed.
# It seems to take the place of the built in parallel port which could be problematic.
# Their install doesn't install it so they don't seem too serious about it.

_opt_DKMS=1           # This can be toggled between installs
#export KERNELRELEASE="$(basename $(dirname /usr/lib/modules/4.19.*/modules.alias))"

# ls -l /dev/ttyF[0-9]*
# lsmod | grep -i ax99100
# lspci -v | grep -B7 -i ax99100

# dmesg | grep -A8 -i ax99100
#[    8.392019] ASIX AX99100 PCIe Bridg to Serial Port:v1.2.0 Arch Linux    http://www.asix.com.tw
#[    8.392096] 0000:03:00.0: ttyF0 at I/O 0xd010 (irq = 16, base_baud = 115200) is a ax99100
#[    8.424126] ASIX AX99100 PCIe Bridg to Serial Port:v1.2.0 Arch Linux    http://www.asix.com.tw
#[    8.424186] 0000:03:00.1: ttyF1 at I/O 0xd000 (irq = 17, base_baud = 115200) is a ax99100

set -u
pkgname='asix-ax99100'
#pkgver='1.6.0'; _dl='529'; _x=''
#pkgver='1.7.0'; _dl='1162'; _x=''
#pkgver='1.8.0'; _dl='1229'; _x=''
#pkgver='1.9.0'; _dl='1484'; _x=''
pkgver='2.1.0'; _dl='1726'; _x='x'
pkgrel='1'
pkgdesc='kernel module driver for Asix serial RS-232 port'
arch=('i686' 'x86_64')
#url='https://www.asix.com.tw/'
url='https://www.asix.com.tw/en/product/Interface/PCIe_Bridge/AX99100'
license=('GPL')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
#backup=("etc/modprobe.d/${_modulename}.conf")
install="${pkgname}-install.sh"
_srcdir="AX99100${_x}_SP_PP_SPI_Linux_Driver_v${pkgver}_Source"
source=("${_srcdir}.tar.bz2::https://www.asix.com.tw/en/support/download/file/${_dl}")
source+=(
  '0000-ax99100_sp.c-ch.patch'
  '0001-kernel.5.12.MODULE_SUPPORTED_DEVICE.patch'
  '0002-kernel-5.18-pci_free_consistent-pci_alloc_consistent.patch'
  '0003-kernel-6.0-set_termios-const-ktermios.patch'
  '0004-kernel-6.2-class-const-devnode.patch'
  '0005-kernel-6.4-DEFINE_SEMAPHORE-2arg.patch'
  '0006-kernel-5.4-compiler_attributes-fallthrough.patch'
)
md5sums=('df5774ea4877ed7c42ea62cd4e8238e2'
         'e992800dddd65a174ac531448e3f1498'
         'ab3d71682ad549eb51ae8a13aa90efc5'
         '8bf51364274f661b3f88fafb23b61f87'
         'e3ae65a199f4bdc7153fb73f60fd9ea0'
         '3827ba41339a6ad65089287df11a5726'
         '211906a3d015a4c16f6ec52d0e5f3b23'
         'd3b9cb56f5e919d230703233279f0d17')
sha256sums=('b00677b5663a529a163b10365fe8896917c77695b2a14865875b4127a7739fc5'
            '158c5a5118e9f7b109276c0639e507ad0471468cef18ebc0a1103bdf96cd2d36'
            '86b91328ed6b596aaa441aea448e6f7fb833a447483b44e869cfbf8286810e54'
            'be4b1bf9b404b6704002e6d6866af42bb69bda487f5ad063e575a374192969d5'
            '58cf6c6dee888be410ba208e694199548093632a5a7dc0feaec08b3ca3cffc1b'
            '5caab8b025c64e55e92c2ff0750ec8fa7bec5d3b80c4743f1c218bc90f933211'
            '9fbec377d027e64185a58d450e319956a4b26cb74ac8f971eb4c6dc61e4316a1'
            'd230eedb791d7f75ad1a90e1641f3a7abfbf4ea8745b87f3b8109b6a9966ba12')
#noextract=("${source[0]%%:*}") # 1.9.0

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

_modulename="ax99100${_x}"

# We can't modify .install but we can stop and force the user to fix it.
_install_check() {
  local _ckvar
  local _ckline
  local _pkgname="${pkgname}"
  for _ckvar in '_pkgname' '_modulename'; do
    _ckline="${_ckvar}='${!_ckvar}'"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      echo "${install} must be fixed"
      echo "${_ckline}"
      set +u
      false
    fi
  done
}

prepare() {
  set -u
  _install_check
  if [ ! -d "${_srcdir}" ]; then
    mkdir "${_srcdir}"
    bsdtar -C "${_srcdir}" -xf "${_srcdir}.tar.bz2"
  fi
  cd "${_srcdir}"
  rm -rf '.git'
  rm -f 'ax99100' # Current kernels automatically load the driver

  #sed -e 's:\r$::g' -i $(grep -l $'\r$' *)

  local _patches=()
  if [ "$(vercmp "${pkgver}" '1.7.0')" -ne 0 ] && [ "$(vercmp "${pkgver}" '1.8.0')" -lt 0 ]; then
    _patches+=('0000-ax99100_sp.c-ch.patch')
  fi

  if [ "$(vercmp "${pkgver}" '1.8.0')" -lt 0 ]; then
    _patches+=('0001-kernel.5.12.MODULE_SUPPORTED_DEVICE.patch')
  fi

  if [ "$(vercmp "${pkgver}" '1.9.0')" -lt 0 ]; then
    _patches+=('0002-kernel-5.18-pci_free_consistent-pci_alloc_consistent.patch')
  fi

  if [ "$(vercmp "${pkgver}" '1.9.0')" -lt 0 ]; then
    _patches+=('0003-kernel-6.0-set_termios-const-ktermios.patch') # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/
  fi

  if [ "$(vercmp "${pkgver}" '2.1.0')" -lt 0 ]; then
    _patches+=('0004-kernel-6.2-class-const-devnode.patch')
    _patches+=('0005-kernel-6.4-DEFINE_SEMAPHORE-2arg.patch')
  fi

  if [ "$(vercmp "${pkgver}" '2.1.0')" -ge 0 ]; then
    _patches+=('0006-kernel-5.4-compiler_attributes-fallthrough.patch')
  fi

  local _pt _ptf=() _pts=()
  for _pt in "${_patches[@]}"; do
    set +u; msg2 "Patch ${_pt}"; set -u
    if patch -Nufp1 -i "${srcdir}/${_pt}"; then
      _pts+=("${_pt}")
    else
      _ptf+=("${_pt}")
    fi
  done
  if [ "${#_ptf[@]}" -gt 0 ]; then
     if [ "${#_pts[@]}" -gt 0 ]; then
       printf 'Patch success %s\n' "${_pts[@]}"
       printf 'Warning: Some old patches may need to be removed even if they are successful\n'
     fi
     printf 'Patch failed %s\n' "${_ptf[@]}"
     set +x
     false
  fi
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

  # Make package and DKMS compatible
  #cp -p 'Makefile' 'Makefile.Arch'
  local _seds=(
    -e 's:\s\+$::g '
    -e 's:/lib/:/usr/lib/:g'
    -e '# Double space slop'
    -e 's:  : :g'
    -e '# Fix all MDIR'
    -e 's:^\(MDIR\)=.*$:\1=kernel/drivers/tty/serial:g'
    -e '# RM isnt set anywhere so why use it? This isnt appropriate for packaging'
    -e 's:^\t\$(RM):#&:g'
    -e 's:^RM_PATH:#&:g'
    -e '# Disable all clean items to use built in clean'
    -e '/^clean:/,/^$/ s:^\t:#&:g'
    -e 's@^clean:@&\n\t$(MAKE) -C $(KDIR) M=$(PWD) clean@g'
    -e '/spi_test/ s:^#\trm:\trm:g'
    -e '# Fix paths for package:g'
    -e '/^install:/,/^$/ s:/usr/:"$(DESTDIR)"&:g'
    -e '/^install:/,/^$/ s:/etc/:"$(DESTDIR)"&:g'
    -e '/ln -s/ s:"$(DESTDIR)"::'
    -e '# default does too much'
    -e '/^default:/,/^$/ s:^\s\+rm:#&:g'
    -e '# might as well remove all remaining install lines'
    -e '/^install:/,/^$/ s:^[\ta-z]:#&:g'
    -e 's|^#install:|install:|g'
    -e 's:^#\(\tcp ax99100.ko\):\1:g'
    -e '/\/kernel\// s:^\tcp :#&:g'
    -e '# Separate utils from module'
    -e '/select_BR\.c/ s|^|\nutils:\n|g'
    -e '# Change default to modules and provide all target'
    -e 's|^default:|all: modules utils\n\n&\n\nmodules:|g'
    -e '#Disable debian stuff'
    -e 's|\(^DEBIAN_VERSION_FILE:\)=.*$|\1=x|g'
    -e 's|\(^DEBIAN_DISTRO:\)=.*$|\1=y|g'
    -e '# CURRENT is not used'
    -e 's:^CURRENT=:#&:g'
    -e '# Should be using CFLAGS'
    -e 's:gcc :gcc $(CFLAGS) :g'
    -e '# $(PWD) is not calculated correctly'
    -e 's:\$(PWD):$(shell pwd):g'
    -e '# Fix version checking'
    -e '/cut -d/ s:shell uname -r:shell echo $$KERNELRELEASE:g'
    -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple'
    -e 's:shell uname -r:KERNELRELEASE:g'
    -e '# Get rid of parallel port'
    -e '#s:^obj-m +=parport_pc.o:#&:g'
    -e '1i KERNELRELEASE ?= $(shell uname -r)'
  )
  sed "${_seds[@]}" -i 'Makefile'
  test ! -s 'Makefile.Arch'

  # uppercase module name not matching lowercase filename is a problem
  #cp -p 'ax99100x_sp.c'{,.orig}
  sed -e '/"/ s:\bAX99100\b:ax99100:g' -i "ax99100${_x}_sp.c"

  # Branding
  if ! :; then
    # forgot to update the version
    sed -e 's:^\(#define DRV_VERSION\s\).*$:\1"'"${pkgver}"' Arch Linux":g' -i "ax99100${_x}_sp.h"
  else
    local _vers
    _vers="$(sed -n -e 's:^#define DRV_VERSION\s"\([^"]\+\)".*$:\1:p' "ax99100${_x}_sp.h")" # '
    _vers="${_vers#v}"
    if [ "${_vers}" != "${pkgver}" ]; then
      echo "Version mismatch ${_vers} ${pkgver}"
      set +u
      false
    fi
    sed -e '/^#define DRV_VERSION/ s:"\(.*\)":"\1 Arch Linux":g' -i "ax99100${_x}_sp.h"
  fi

  #make -s clean
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j1 # too small for parallel make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  local _KERNELRELEASE_PKG="${KERNELRELEASE:-$(uname -r)}"
  if [ "${_opt_DKMS}" -eq 0 ]; then
    # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
    local _kernelversionsmall="${_KERNELRELEASE_PKG}"
    _kernelversionsmall="${_kernelversionsmall%%-*}"
    _kernelversionsmall="${_kernelversionsmall%\.0}" # trim 4.0.0 -> 4.0, 4.1.0 -> 4.1
    # prevent the mksrcinfo bash emulator from getting these vars!
    eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  install -d "${pkgdir}/usr/lib/modules/${_KERNELRELEASE_PKG}/kernel/drivers/tty/serial"
  make -s -j1 DESTDIR="${pkgdir}" install

  # The module is in the same folder as DKMS. Compress to a different name to prevent conflict.
  # When future versions of DKMS compress we'll stop doing this.
  find "${pkgdir}/usr/lib/modules/" -type 'f' -name '*.ko' -exec 'gzip' '-9' '{}' ';'

  # Forgot to install the binaries. Install with prefix
  local _bin
  for _bin in 'advanced_BR' 'gpio_99100' 'select_BR' 'spi_test'; do
    install -Dpm755 "${_bin}" "${pkgdir}/usr/bin/asix-${_bin}"
  done

  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -r "${pkgdir}/usr/lib/modules/"
    rmdir --ignore-fail-on-non-empty -p "${pkgdir}/usr/lib"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="${_modulename}"
BUILT_MODULE_LOCATION[0]=""
# Using all processors doesn't compile this tiny module any faster.
MAKE[0]="make -j1 modules"
CLEAN[0]="make -j1 clean"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[0]="/kernel/drivers/tty/serial"
EOF
    ) "${_dkms}/dkms.conf"
    install -dm755 "${_dkms}/"
    cp -pr './' "${_dkms}/"
    pushd "${_dkms}" > /dev/null
    rm *BR* gpio* 'readme' spi* # parport*
    popd > /dev/null
    make -s -C "${_dkms}/" KERNELRELEASE="${_KERNELRELEASE_PKG}" clean
  fi
  set +u
}

set +u
