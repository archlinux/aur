# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

# Tested: x86_64, i686, ts140, Linux 4.6.2-1

# References
# http://hargrave.info/articles/afulnx.html
# https://github.com/romanhargrave/amifldrv

# 8e91d2018100c796929530474a0f0e49a6ea2ad0f121e3a959169167783bc7da https://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkservers/bios_ts140-240-440-540_fbkta8a_linux_x86.tgz
# c1b66c61b5eef5ce8e174e6dacf4f8ec5b9d4aa8d6bc14a2eb5d5407c4c04ca5 https://download.lenovo.com/pccbbs/thinkservers/bios_ts140-240-440-540_fbktb3a_linux_x86.tgz
# e30c705586dabfadf76f25e2bf9a4aef77e03b878749bd30fa6f33611811e7d6 https://download.lenovo.com/pccbbs/thinkservers/bios_ts140-240-440-540_fbktb7a_linux_x86.tgz

# a89c886893d08953fe27e612dd649dc8a76a9ed5f7ae265c0341139defeaa81e https://download.lenovo.com/pccbbs/thinkservers/bios_ts140-240-440-540_fbkt99a_linux_x64.tgz
# c8733bd0826a703b2ece42979159377cedc572ffece1352458f8833d83a6398c https://download.lenovo.com/pccbbs/thinkservers/bios_ts140-240-440-540_fbkta8a_linux_x64.tgz
# c2a38c6cdb40eb4d56403af3039736dcc59106dd7940f6033b61d0e715a8071a https://download.lenovo.com/pccbbs/thinkservers/bios_ts140-240-440-540_fbktb3a_linux_x64.tgz

set -u
pkgname='bios-lenovo-thinkserver-ts140'
#pkgver='20180221.CVA'
#pkgver='20180315.CWA'
#pkgver='20180711.CZA'
#pkgver='20181016.D0A'
#pkgver='20190329.D3A'
#pkgver='20190703.D7A'
#pkgver='20200114.D9A'
pkgver='20200526.DDA'
pkgrel='1'
pkgdesc='BIOS update for Lenovo ThinkServer ts140 ts440' # ts240 ts540 The website claims less models than the enclosed readme
arch=('i686' 'x86_64')
url='https://datacentersupport.lenovo.com/us/en/products/servers/thinkserver/ts140'
license=('custom')

# As distributed by Lenovo Thinkserver TS140 2016-06-07 BIOS version C3A (and B7A-x86, B3A-x86, A8A-x86, B3A-x64, A8A-x64, 99A-x64)
# amiwrap.c from afulnx_26_64 909384 ba291f471ffec33e8180abc7fbb95243eeab4fac635bee341c47409e4c491018
# //               AMI Firmware Update Utility(APTIO)  v3.04.03
# MODULE_LICENSE("Dual BSD/GPL");

# Another version downloaded from elsewhere
# amiwrap.c from afulnx_64 918080 54da6881cae4554e4c9b4dab3c862f7d7614d7c09bda81799be7f17355451de4
# //               AMI Firmware Update Utility(APTIO)  v5.05.04
# MODULE_LICENSE("Proprietary");

depends=('gcc' 'make' 'sudo' 'binutils' 'glibc' 'linux' 'linux-headers' 'dmidecode')
install="${pkgname}.install"
_ver="${pkgver##*.}"
_ver="${_ver,,}"
source=("https://download.lenovo.com/pccbbs/thinkservers/bios_me_ts140-240-440-540_fbkt${_ver}_bioslinux32.txt")
source_i686=("https://download.lenovo.com/pccbbs/thinkservers/bios_me_ts140-240-440-540_fbkt${_ver}_bioslinux32.tgz")
source_x86_64=("https://download.lenovo.com/pccbbs/thinkservers/bios_me_ts140-240-440-540_fbkt${_ver}_bioslinux64.tgz")
md5sums=('4a7722463ee24e8dd88414cf5d7dc313')
md5sums_i686=('01a1daec765ce258ce5eea68b25f40e6')
md5sums_x86_64=('c6367892e3e30b29834e37371a28dbed')
sha256sums=('a39731a2cff12e536e02edc3cdc60ffe7b1cebe0c8e20e2bdb70e7824055793f')
sha256sums_i686=('d12a5b6069881216ae480e1e0891ad8fda504ba7992a72bb6ab32e417859747d')
sha256sums_x86_64=('e9b5a76987e2a736418bfc6c5453eeac2b062cf9ff21738f83728793bbbff358')

declare -gA _srcdir=(['i686']='BIOSLinux32' ['x86_64']='BIOSLinux64')
declare -gA _exe=(['i686']='afulnx_26_32' ['x86_64']='afulnx_26_64')
declare -gA _sh=(['i686']='Linux32.sh' ['x86_64']='Linux64.sh')

prepare() {
  set -u
  cd "${_srcdir[${CARCH}]}"
  # Fix the compile by overwriting useless switches in the makefile. In this binary file the replace string must be exactly the same length
  local _f1='EXTRA_CFLAGS := -Wall -Wstrict-prototypes '
  local _f2='EXTRA_CFLAGS := -Wall @/tmp/ArchOpts      '
  local _g1=' SUBDIRS='
  local _g2='       M='
  #local _f2='EXTRA_CFLAGS := -include linux/module.h   '
  sed -e "s#${_f1}#${_f2}#g" -e "s#${_g1}#${_g2}#g" -i "${_exe[${CARCH}]}"
  # There are other ways to do this...
  cat >> 'ArchOpts' << EOF
-Wstrict-prototypes
-include linux/module.h
-include linux/uaccess.h
-DHAVE_UNLOCKED_IOCTL=1
EOF
  sed -e '1i #!/usr/bin/sh' \
      -e "1i cp -p '/usr/lib/${pkgname}/ArchOpts' '/tmp/'" \
      -e 's:^\(\s\+\)\./afulnx_26_64:\1sync\n&:g' \
      -e '# Prevent auto reboot. This stops the reboot but if you dont autoreboot the upgrade doesnt happen.' \
      -e '#s: /defans::g' \
    -i "${_sh[${CARCH}]}"
  set +u
}

build() {
  set -u
  cd "${_srcdir[${CARCH}]}"
  cp -p 'ArchOpts' '/tmp/'
  "./${_exe[${CARCH}]}" /MAKEDRV # amifldrv_mod.o
  rm 'amifldrv_mod.o' # All we want to know is if it builds.
  rm '/tmp/ArchOpts'
  set +u
}

package() {
  set -u
  cd "${_srcdir[${CARCH}]}"
  install -Dp "${srcdir}"/bios_*.txt *.txt *.[Rr][Oo][Mm] Linux*.sh afulnx_* 'ArchOpts' -t "${pkgdir}/usr/lib/${pkgname}/"
  cd "${pkgdir}/usr/lib/${pkgname}/"
  chmod 644 *.txt *.[Rr][Oo][Mm]
  chmod 744 *.sh afulnx*
  ln -s "${_sh[${CARCH}]}" 'Linux.sh'

  # Prebuilding the kernel module could work on distros with more consistent Linux kernel versions.
  # It runs dynamically just fine and all the fixups needed to detect kernel changes isn't worth it on Arch.
  if [ -s "${srcdir}/${_srcdir[${CARCH}]}/amifldrv_mod.o" ]; then
    cd "${srcdir}/${_srcdir[${CARCH}]}"
    install -pm644 'amifldrv_mod.o' -t "${pkgdir}/usr/lib/${pkgname}/"
    cd "${pkgdir}/usr/lib/${pkgname}/"
    local _arch="$(uname -r)"
    mv 'amifldrv_mod.o' "amifldrv_mod.o.${_arch}"
    ln -s "amifldrv_mod.o.${_arch}" 'amifldrv_mod.o'
    # To complete this we need to modify the shell scripts to recompile on kernel change and fix the installer to clean up afterwards.
  fi

  install -Dpm744 <(cat << EOF
#!/usr/bin/bash
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/

echo 'Please wait while AMI'
echo ' * compiles a kernel module with make & gcc'
echo ' * insmod'
echo 'runs AFULNX'
echo ' * rmmod'
echo ' * then finally deletes the kernel module file.'
rm -f 'OLDROM.ROM'
cp -p '/usr/lib/${pkgname}/ArchOpts' '/tmp/'
./${_exe[${CARCH}]} 'OLDROM.ROM' /O
if [ -s 'OLDROM.ROM' ]; then
  ls -l 'OLDROM.ROM'
  echo 'Arch Linux test passed!'
else
  echo 'Arch Linux test failed!'
fi
rm '/tmp/ArchOpts'
EOF
  ) "${pkgdir}/usr/lib/${pkgname}/romtest.sh"

  set +u
}
set +u

# vim:set ts=2 sw=2 et:
