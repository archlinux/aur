# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Allen Choong <allencch at hotmail dot com>
# Contributor: Indeed <fengjared at gmail dot com>

# Note: Many a4 eu LIPSLX CARPS2 models are left out of the -bin version.

# TODO: Add /usr/share/{doc,licenses}

_opt_RPM=1 # Default 1
# 0 = deb, the deb has hardcoded references to /usr/local/lib
# 1 = rpm, the RPM has hardcoded references to /usr/local/lib64
# Not sure which is worse. Neither until someone reports a printer not working, fixed by switching to the other one.

# https://askubuntu.com/questions/314833/diagnosing-the-problem-when-canon-printer-fails-to-print-under-ubuntu
# https://www.reddit.com/r/linux4noobs/comments/7tiemc/canon_mf4320_printer_does_not_print_and_cpu_hangs/
_opt_altver=0 # Default 3 until cnpkmoduleufr2 bug is fixed in version>3.40, then 0
# 0 all files from latest version only
# 1-3 to mix in some files from an old version to squash bugs
#   1 Mix from original tar. These tar are large and Canon makes old versions unavailable in less than 2 years. Noone wants to supply these.
#   2 same as 1, also generate bsdiff file
#   3 Mix from bspatch files generated in 2, no tar needed

_opt_use_other=0 # Default 0
# 0 = use this package complete
# 1 = install only cndrvcups-lb files for use with cndrvcups-common-lb
# 2 = install only cndrvcups-common-lb files for use with cndrvcups-lb or cndrvcups-lt

_opt_32bitonly=0 # Required 0
# 0 = 64 bit files which have many 32 bit files mixed in
# 1 = Use all 32 bit files on 64 bit platform.
#   This doesn't work because 64 bit ghostscript can't load 32-bit .so for -sDEVICE=opvp -sDriver=libcanonc3pl.so

_opt_debug_cnpkmoduleufr2=0
# 0 = normal
# 1 = add old lib32-glibc to cnpkmoduleufr2. This is a hassle to make work because LD_ functions can't work on suid executables. get rid of suid and it just segfaults on old libs.
# dmesg
# cnpkmoduleufr2[1531]: segfault at 0 ip 00000000f7607cc3 sp 00000000ff9a34f0 error 4 in libc-2.26.so[f758a000+1c8000]

_opt_debug_pstoufr2cpca=0
# 0 = normal
# 1 = add strace debug code to filter. See /tmp for output. See /usr/lib/cups/filter/pstoufr2cpca.inst.sh for installer if using with cndrvcups-lb
# grep -Fe $'execv\n.so\nENOENT' /tmp/pstoufr2cpca.*.strace | less -S
# /libca

# lib/libcanonc3pl.so", O       Canon

# exec c3pldrv -i 12 -o 15
# lib32/libdl.so.2
# lib32/libcaepcm.so.1
# lib32/libc.so.6
# lib32/libm.so.6
# lib32/libpthread.so.0
# lib32/librt.so.1
# lib/libc3pl.so

# exec c3pldrv -i 11 -o 16
# lib32/libdl.so.2              core/glibc
# lib32/libcaepcm.so.1          Canon EPCM
# lib32/libc.so.6               core/glibc
# lib32/libm.so.6               core/glibc
# lib32/libpthread.so.0         core/glibc
# lib32/librt.so.1              core/glibc
# lib/libc3pl.so                Canon

# lib32/libufr2filter.so        Canon UFR II Filter
# lib32/libcanonufr2.so         Canon UFR II
# lib32/libEnoJBIG.so.1.0.0     Canon JBIG
# lib32/libcanon_slim.so.1.0.0  Canon Slim
# lib32/libxml2.so.2            libxml2
# lib32/libEnoJPEG.so.1.0.0     Canon JPEG
# lib32/libicuuc.so.60          icu
# lib32/libz.so.1               core/zlib
# lib32/libicudata.so.60        Canon icu
# lib32/libstdc++.so.6          core/gcc-libs
# lib32/libgcc_s.so.1           core/gcc-libs

set -u
# The conditionals were getting way too complicated. Translate options to simple install flags.
_inst_common=0
_inst_lb=0
_inst_mix=0        # Mixing from any source, alternate tar.gz or bspatch files
_inst_bsdiff=0     # Need bsdiff and bspatch utilities
_inst_alternate=0  # Need alternate version of tar.gz
_inst_patch=0      # Mixing from bspatch files, not tar.gz
if [ "${_opt_use_other}" -ne 1 ]; then
  _inst_common=1
fi
if [ "${_opt_use_other}" -ne 2 ]; then
  _inst_lb=1
  if [ "${_opt_altver}" -ne 0 ]; then
    _inst_mix=1
    if [ "${_opt_altver}" -ge 1 ] && [ "${_opt_altver}" -le 2 ]; then
      _inst_alternate=1
    fi
    if [ "${_opt_altver}" -ge 2 ]; then
      _inst_bsdiff=1
    fi
    if [ "${_opt_altver}" -eq 3 ]; then
      _inst_patch=1
    fi
  fi
fi

pkgname='cndrvcups-lb-bin'
# http://files.canon-europe.com/files/soft44160/Software/01371en_linuxufrII_0207.zip
# http://files.canon-europe.com/files/soft45378/Software/o157e1en_linux_UFRII_v290.zip
# http://files.canon-europe.com/files/soft46530/Software/o1581en_linux_UFRII_v300.zip
#pkgver='3.00'; _commonver='3.10'; _dl='0/0100003440/09'; _co='us' # http://gdlp01.c-wss.com/gds/0/0100003440/09/Linux_UFRII_PrinterDriver_V300_us_EN.tar.gz
#pkgver='3.00'; _commonver='3.10'; _dl='8/0100002708/12'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/12/Linux_UFRII_PrinterDriver_V300_uk_EN.tar.gz 3d4210670e5844d118c5350643b046e9126726eadca4d0f5d2b9c904133e956d
# http://files.canon-europe.com/files/soft46710/Software/o151en_linux_UFRII_v310.zip
#pkgver='3.10'; _commonver='3.40'; _dl='0/0100003440/10'; _co='us' # http://gdlp01.c-wss.com/gds/0/0100003440/10/Linux_UFRII_PrinterDriver_V310_us_EN.tar.gz
#pkgver='3.10'; _commonver='3.40'; _dl='0/0100003440/10'; _co='uk' # bbb4d87eec24278246eecd85860f7b2b5f854d035ed8b9a2980ea10b0e995eff
#pkgver='3.20'; _commonver='3.60'; _dl='8/0100002708/14'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/14/Linux_UFRII_PrinterDriver_V320_uk_EN.tar.gz b28bc2b460aeddcb7800983d2fad8c29ea6efcc95ad767a78fe6c25d0956f242
#pkgver='3.30'; _commonver='3.70'; _dl='8/0100002708/15'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/15/Linux_UFRII_PrinterDriver_V330_uk_EN.tar.gz df669767927a8e17faefe72b4a2c259cd944162b5ed046d44dedbbdb943cf756
#pkgver='3.31'; _commonver='3.71'; _dl='8/0100007658/03'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/16/linux-UFRII-drv-v331-uken.tar.gz c1211cbe27034847284541fcc613b86ccfe99418a6a2cbb4589b99ffe1af4645
#pkgver='3.40'; _commonver='3.80'; _dl='8/0100002708/17'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/17/linux-UFRII-drv-v340-uken.tar.gz fb3701f564f987126a9a3d03a163951f3182d6f7d626530a6767cb1f996fa203
#pkgver='3.40_02'; _commonver='3.80'; _dl='0/0100003440/14'; _co='us' # http://gdlp01.c-wss.com/gds/0/0100003440/14/linux-UFRII-drv-v340-02-usen.tar.gz ef5421f98ae428ad8ad11ed5d9fb0e53bdc03b2693e79d590cf778fbe68250b5
# http://gdlp01.c-wss.com/gds/8/0100007658/04/linux-UFRII-drv-v340-uken.tar.gz
# http://gdlp01.c-wss.com/gds/8/0100002708/17/linux-UFRII-drv-v340-uken.tar.gz
#pkgver='3.50'; _commonver='3.90'; _dl='0/0100009240/01'; _co='uk' # http://gdlp01.c-wss.com/gds/0/0100009240/01/linux-UFRII-drv-v350-uken.tar.gz c00324177a6f77f0a6deb4ecc6bee8150607dd4029bad3dfc1a521f84f811e7f
#pkgver='3.50'; _commonver='3.90'; _dl='8/0100007658/05'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100007658/05/linux-UFRII-drv-v350-uken.tar.gz c00324177a6f77f0a6deb4ecc6bee8150607dd4029bad3dfc1a521f84f811e7f
#pkgver='3.60'; _commonver='4.00'; _dl='0/0100009240/02'; _co='uk' # http://gdlp01.c-wss.com/gds/0/0100009240/02/linux-UFRII-drv-v360-uken.tar.gz a5bf2c2d53049ad64acf2ed8b6dc954ff261c4b996ce1cc81471e5baaf5e40cd
#pkgver='3.60'; _commonver='4.00'; _dl='0/0100009240/02'; _co='uk' # http://gdlp01.c-wss.com/gds/0/0100009240/02/linux-UFRII-drv-v360-uken.tar.gz a5bf2c2d53049ad64acf2ed8b6dc954ff261c4b996ce1cc81471e5baaf5e40cd
#pkgver='3.70'; _commonver='4.10'; _dl='8/0100007658/08'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100007658/08/linux-UFRII-drv-v370-uken-05.tar.gz
pkgver='3.70'; _commonver='4.10'; _dl='4/0100010264/01'; _co='uk' # https://gdlp01.c-wss.com/gds/4/0100010264/01/linux-UFRII-drv-v370-uken-07.tar.gz

_pkgver="${pkgver}"
pkgrel='2'
pkgdesc='CUPS Canon UFR II LT LIPSLX CARPS2 printer driver for imageCLASS D Laser Shot LBP i-SENSYS MF imagePRESS iPR imageRUNNER iR ADVANCE iR-ADV FAX color printers and copiers, does not require PCL/PXL or PS dealer LMS license'
# Not UFR II: PRO PC-D
arch=('i686' 'x86_64')
# Direct links to the download reference go bad on the next version. We want something that will persist for a while.
url='https://www.canon-europe.com/support/products/imagerunner/imagerunner-1730i.aspx'
#url='https://www.usa.canon.com/internet/portal/us/home/support/details/printers/black-and-white-laser/mf212w'
license=('GPL' 'MIT' 'custom')
_depsdual=('glibc' 'gcc-libs') # 'libpng12'
depends=('bzip2' 'gnutls' 'icu' 'lz4' 'pcre' 'xz' 'avahi' 'gtk2' 'libglade' 'libpng' 'ghostscript' 'cups' 'libcups')
case "${_opt_use_other}" in
0)
  conflicts=('cndrvcups-common-lb' 'cndrvcups-lb')
  provides=("cndrvcups-lb=${_pkgver}")
  provides+=("cndrvcups-common-lb=${_commonver}")
  ;;
1)
  depends+=("cndrvcups-common-lb=${_commonver}")
  conflicts=('cndrvcups-lb')
  provides=("cndrvcups-lb=${_pkgver}")
  ;;
2)
  conflicts=('cndrvcups-common-lb')
  provides=("cndrvcups-common-lb=${_commonver}")
  ;;
esac
if [ "${_inst_lb}" -ne 0 ]; then
  _depsdual+=('icu' 'libxml2' 'zlib')
  optdepends_i686=('libjpeg6-turbo: improves printing results for color imageRUNNER/i-SENSYS LBP devices')
  optdepends_x86_64=("${optdepends_i686[@]/#/lib32-}")
fi
depends_i686+=("${_depsdual[@]}")
depends_x86_64+=("${_depsdual[@]/#/lib32-}")
unset _depsdual
replaces=('canon-ufr')
if [ "${_inst_bsdiff}" -ne 0 ]; then
  makedepends+=('bsdiff')
fi
options=('!emptydirs' '!strip')
_pkgverV="${_pkgver//_/-}"
_pkgverS="${_pkgver%%_*}"
if [ "$(vercmp "${_pkgver}" '3.30')" -le 0 ]; then
  _srcdir=("Linux_UFRII_PrinterDriver_V${_pkgverV//./}_${_co}_EN")
else
  _srcdir=("linux-UFRII-drv-v${_pkgverV//./}-${_co}en")
fi
unset _pkgverV
source=("https://gdlp01.c-wss.com/gds/${_dl}/${_srcdir}-07.tar.gz")
unset _dl
if [ "${_inst_mix}" -ne 0 ]; then
  _pkgverA='3.20'
  pkgver="${_pkgver}.r${_pkgverA}"
  if [ "${_inst_alternate}" -ne 0 ]; then
    _coA='uk'
    _altversrc="Linux_UFRII_PrinterDriver_V${_pkgverA//./}_${_coA}_EN"
    source+=("file://${_altversrc}.tar.gz")
  fi
  if [ "${_inst_patch}" -ne 0 ]; then
    source+=("patch.RPM.cnpkmoduleufr2.${_pkgverS}-${_pkgverA}.bspatch" "patch.Debian.cnpkmoduleufr2.${_pkgverS}-${_pkgverA}.bspatch")
  fi
fi
if [ "${_inst_lb}" -ne 0 ] && [ "${_opt_debug_cnpkmoduleufr2}" -ne 0 ]; then
  source+=(
    #'https://archive.archlinux.org/packages/l/lib32-glibc/lib32-glibc-2.25-1-x86_64.pkg.tar.xz'
    #'https://archive.archlinux.org/packages/l/lib32-glibc/lib32-glibc-2.24-2-x86_64.pkg.tar.xz'
    'https://archive.archlinux.org/packages/l/lib32-glibc/lib32-glibc-2.23-5-x86_64.pkg.tar.xz'
  )
fi
md5sums=('35d69e337c7043d1adc4f5a496126d88')
sha256sums=('ff16438de55c982d649cdb20e262a54b13569e2320ed3e75b9c4b000c7bbdd06')
#PKGEXT='.tar.gz'

package() {
  set -u
  cd "${pkgdir}"
  if [ "${_opt_32bitonly}" -ne 0 ]; then
    local CARCH='i686'
  fi
  declare -A _archd=([i686]='32-bit_Driver' [x86_64]='64-bit_Driver')
  local _archrpme=('deb' 'rpm')
  local _archrpmf=('Debian' 'RPM')
  install -d "usr/share/licenses/${pkgname}"
  if [ "${_opt_RPM}" -ne 0 ]; then
    declare -A _archf=([i686]='i386' [x86_64]='x86_64')
    local _p1='-'
    local _p2='.'
  else
    declare -A _archf=([i686]='i386' [x86_64]='amd64')
    local _p1='_'
    local _p2='_'
  fi
  if [ "${_inst_common}" -ne 0 ]; then
    local _cncom="cndrvcups-common${_p1}${_commonver}-1${_p2}${_archf[${CARCH}]}"
  fi
  if [ "${_inst_lb}" -ne 0 ]; then
    local _cnufr="cndrvcups-ufr2-${_co}${_p1}${_pkgverS}-1${_p2}${_archf[${CARCH}]}"
  fi
  if [ "${_inst_bsdiff}" -ne 0 ]; then
    local _arpat="patch.${_archrpmf[${_opt_RPM}]}.cnpkmoduleufr2.${_pkgverS}-${_pkgverA}.bspatch"
  fi
  if [ "${_opt_RPM}" -ne 0 ]; then
    if [ "${_inst_common}" -ne 0 ]; then
      set +u; msg2 "Packaging ${_archrpmf[${_opt_RPM}]} common"; set -u
      bsdtar -xf "${srcdir}/${_srcdir}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cncom}.${_archrpme[${_opt_RPM}]}"
      if [ "$(vercmp "${_commonver}" '3.90')" -lt 0 ]; then
        mv "usr/share/doc/cndrvcups-common-${_commonver}"/*.txt "usr/share/licenses/${pkgname}/"
        rmdir "usr/share/doc/cndrvcups-common-${_commonver}"
      fi
    fi
    if [ "${_inst_lb}" -ne 0 ]; then
      set +u; msg2 "Packaging ${_archrpmf[${_opt_RPM}]} lb"; set -u
      bsdtar -xf "${srcdir}/${_srcdir}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cnufr}.${_archrpme[${_opt_RPM}]}"
      if [ "$(vercmp "${_commonver}" '3.90')" -lt 0 ]; then
        mv "usr/share/doc/cndrvcups-ufr2-${_co}-${_pkgverS}"/*.txt "usr/share/licenses/${pkgname}/"
      fi

      if [ "${_inst_alternate}" -ne 0 ]; then
        if [ "${_inst_bsdiff}" -ne 0 ] && [ "${_opt_altver}" -eq 2 ]; then
          mv 'usr/bin/cnpkmoduleufr2'{,.old}
        fi
        set +u; msg2 "Mixing from alternate ${_altversrc}"; set -u
        local _cnufrA="cndrvcups-ufr2-${_coA}${_p1}${_pkgverA}-1${_p2}${_archf[${CARCH}]}"
        bsdtar -xf "${srcdir}/${_altversrc}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cnufrA}.${_archrpme[${_opt_RPM}]}" 'usr/bin/cnpkmoduleufr2'
        if [ "${_inst_bsdiff}" -ne 0 ] && [ "${_opt_altver}" -eq 2 ]; then
          set +u; msg2 "bsdiff to \${startdir}/${_arpat}"; set -u
          bsdiff 'usr/bin/cnpkmoduleufr2'{.old,} "${startdir}/${_arpat}"
          rm 'usr/bin/cnpkmoduleufr2.old'
        fi
      fi
    fi

    cp -dprx 'usr/local/.' 'usr/'
    rm -r 'usr/local'

    if [ "${CARCH}" = 'x86_64' ]; then
      if [ "${_opt_32bitonly}" -eq 0 ]; then
        mv 'usr/lib' 'usr/lib32'
        mv 'usr/lib64' 'usr/lib'
       # This 32 bit lib is only searched for in /usr/lib. postinst puts it in both places.
        if [ "${_inst_common}" -ne 0 ]; then
          ln -s '../lib32/libc3pl.so' -t 'usr/lib'
        fi
        if [ "${_inst_lb}" -ne 0 ]; then
          ln -s '../lib32/libcnlbcm.so' -t 'usr/lib'
        fi
      else
        mkdir 'usr/lib32'
        mv 'usr/lib'/*.so* 'usr/lib'/*.a 'usr/lib32'
      fi
    fi
  else # Debian
    if [ "${_inst_common}" -ne 0 ]; then
      set +u; msg2 "Packaging ${_archrpmf[${_opt_RPM}]} common"; set -u
      bsdtar -xvf "${srcdir}/${_srcdir}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cncom}.${_archrpme[${_opt_RPM}]}"
      bsdtar -xf 'data.tar.gz'
      if [ "$(vercmp "${_commonver}" '3.90')" -lt 0 ]; then
        mv 'usr/share/doc/cndrvcups-common'/*.txt.gz "usr/share/licenses/${pkgname}/"
      fi
      chmod 777 'etc/cngplp'/*/
    fi
    if [ "${_inst_lb}" -ne 0 ]; then
      set +u; msg2 "Packaging ${_archrpmf[${_opt_RPM}]} lb"; set -u
      bsdtar -xvf "${srcdir}/${_srcdir}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cnufr}.${_archrpme[${_opt_RPM}]}"
      bsdtar -xf 'data.tar.gz'
      if [ "$(vercmp "${_commonver}" '3.90')" -lt 0 ]; then
        mv "usr/share/doc/cndrvcups-ufr2-${_co}"/*.txt.gz "usr/share/licenses/${pkgname}/"
      fi

      if [ "${_inst_alternate}" -ne 0 ]; then
        if [ "${_inst_bsdiff}" -ne 0 ] && [ "${_opt_altver}" -eq 2 ]; then
          mv 'usr/bin/cnpkmoduleufr2'{,.old}
        fi
        set +u; msg2 "Mixing from alternate ${_altversrc}"; set -u
        local _cnufrA="cndrvcups-ufr2-${_coA}${_p1}${_pkgverA}-1${_p2}${_archf[${CARCH}]}"
        bsdtar -xvf "${srcdir}/${_altversrc}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cnufrA}.${_archrpme[${_opt_RPM}]}"
        bsdtar -xf 'data.tar.gz' 'usr/bin/cnpkmoduleufr2'
        if [ "${_inst_bsdiff}" -ne 0 ] && [ "${_opt_altver}" -eq 2 ]; then
          set +u; msg2 "bsdiff to \${startdir}/${_arpat}"; set -u
          bsdiff 'usr/bin/cnpkmoduleufr2'{.old,} "${startdir}/${_arpat}"
          rm 'usr/bin/cnpkmoduleufr2.old'
        fi
      fi
    fi
    rm 'data.tar.gz' 'control.tar.gz' 'debian-binary'

    if [ "${CARCH}" = 'x86_64' ]; then
      # move the 32 bit libs into lib32
      if pushd 'usr/lib/' > /dev/null; then
        local _lib32=()
        local _f _t
        for _f in *.so*; do
          _t="$(file -L "${_f}")"
          if [ "${_t//32-bit/}" != "${_t}" ]; then
            _lib32+=("${_f}")
          fi
        done
        mkdir '../lib32'
        mv "${_lib32[@]}" '../lib32/'
        if [ "${_opt_32bitonly}" -ne 0 ]; then
          mv *.a '../lib32/'
        fi
        # This 32 bit lib is only searched for in /usr/lib. postinst puts it in both places.
        if [ "${_inst_common}" -ne 0 ]; then
          ln -s '../lib32/libc3pl.so'
        fi
        if [ "${_inst_lb}" -ne 0 ]; then
          ln -s '../lib32/libcnlbcm.so'
        fi
        popd > /dev/null
      fi
    fi
  fi

  if [ "${_inst_lb}" -ne 0 ]; then
    if [ "${_opt_debug_pstoufr2cpca}" -ne 0 ]; then
      set +u; msg2 "Debug pstoufr2cpca"; set -u
      if [ "${_opt_use_other}" -ne 2 ]; then
        mv 'usr/lib/cups/filter/pstoufr2cpca'{,.arch}
      fi
      install -Dm755 <(cat << EOF
#!/bin/bash
umask 000
set > "/tmp/pstoufr2cpca.\$\$.env"
printf '%s' "\$0" > "/tmp/pstoufr2cpca.\$\$.cmd"
printf ' %q' "\$@" >> "/tmp/pstoufr2cpca.\$\$.cmd"
echo "" >> "/tmp/pstoufr2cpca.\$\$.cmd"
cat > "/tmp/pstoufr2cpca.\$\$.prn"
#LD_PRELOAD=/usr/lib32/${pkgname}/ \\\\
<"/tmp/pstoufr2cpca.\$\$.prn" \
strace -f -o "/tmp/pstoufr2cpca.\$\$.strace" '/usr/lib/cups/filter/pstoufr2cpca.arch' "\$@" 2>"/tmp/pstoufr2cpca.\$\$.debug" | tee "/tmp/pstoufr2cpca.\$\$.ufr"
EOF
      ) 'usr/lib/cups/filter/pstoufr2cpca'
      if [ "${_opt_use_other}" -eq 2 ]; then
        mv 'usr/lib/cups/filter/pstoufr2cpca'{,.new}
        install -m744 <(cat << EOF
#!/bin/bash

if [ "\$(stat -c '%s' 'pstoufr2cpca')" -ge 5000 ]; then
  mv '/usr/lib/cups/filter/pstoufr2cpca'{,.arch}
fi
cp '/usr/lib/cups/filter/pstoufr2cpca'{.new,}
echo 'Filter debugger installed. Watch /tmp for print files.'
EOF
        ) 'usr/lib/cups/filter/pstoufr2cpca.inst.sh'
      fi
    fi

    if [ "${_opt_debug_cnpkmoduleufr2}" -ne 0 ]; then
      set +u; msg2 "Debug cnpkmoduleufr2"; set -u
      install -d "${pkgdir}/usr/lib32/${pkgname}/"
      mv "${srcdir}/usr/lib32"/* "${pkgdir}/usr/lib32/${pkgname}/"
      mv 'usr/bin/cnpkmoduleufr2'{,.arch}
      install -Dm755 <(cat << EOF
#!/bin/bash
# These LD_ don't work because cnpkmoduleufr2 is setuid
#LD_PRELOAD=/usr/lib32/${pkgname}/libc.so.6
LD_LIBRARY_PATH=/usr/lib32/{pkgname}/ '/usr/bin/cnpkmoduleufr2.arch' "\$@"
EOF
      ) 'usr/bin/cnpkmoduleufr2'
    fi

    if [ "${_inst_patch}" -ne 0 ]; then
      set +u; msg2 "Patching alternate to ${_pkgverA}"; set -u
      bspatch 'usr/bin/cnpkmoduleufr2'{,.new} "${srcdir}/${_arpat}"
      mv 'usr/bin/cnpkmoduleufr2'{.new,}
    fi
    # 4755 SUID seems not necessary for cnusb, USB, or Network
    chmod 755 'usr/bin/cnpkmoduleufr2'

    # grep -he '^*ModelName:' 'usr/share/cups/model'/*.ppd | sort -u > "${startdir}/models.${_pkgver}.txt"

    gzip 'usr/share/cups/model'/*.ppd
  fi

  if [ "${_inst_common}" -ne 0 ]; then
    # The filter works in /usr/bin but it's expected in .../cups/filter/
    install -d 'usr/lib/cups/filter/'
    ln -s '/usr/bin/c3pldrv' -t 'usr/lib/cups/filter/'
  fi

  set +u
}
set +u
