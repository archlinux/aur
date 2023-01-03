# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

# Todo: rewrite dgrp_cfg_node to be systemd compatible.
# Todo: add systemd getty support to drpadmin
# Todo: Default user, group, and mode are in the backing store. These do not work. They are set by udev and apply to all ports.
# Digi bug: terminal freezes when viewing /proc/dgrp/mon
# (fixed) Digi bug: drpd terminates after the first tty open when launched from dgrp_cfg_node. It stays working when launched by systemd restart
# (hardware) Digi bug: occasional Can't open serial /dev/ttyaf00: Resource temporarily unavailable for PortServer TS (not II)
# (hardware) Digi bug: occasional dropped characters for PortServer II, PortServer TS, Digi One
# Digi bug: Digi RealPort Manager (java) is unable to add new Realport because it uses the wrong options
# Digi bug: mbrowse reports a few parsing errors in MIB
# (fixed) Digi bug: make compatible with OpenSSL 1.1
# Digi bug: transfer hangs if unit is repowered during live connection. Tested in 4.11, 4.9, and 4.4
# Digi bug: tty* takes up to an hour to reappear after unit is powered up after a long time being off
#  Nov 29 06:16:50 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
#  Nov 29 07:21:21 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
#  Nov 29 08:25:51 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
#  Nov 29 09:30:22 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
#  Nov 29 10:34:53 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
#  Nov 29 11:39:24 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
#  Nov 29 12:43:54 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
#  Nov 29 13:48:25 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
#  Nov 29 14:52:56 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
#  Nov 29 15:57:26 springport drpd[715]: drpd(ag,128.0.0.92) Cannot connect to server - Connection timed out
# Digi bug: connect hangs for 15 minutes if no network connection to unit. Tested in 1.9-38..40
# Digi bug: backing store is rewritten on every service start which can cause loss of config

# Digi Realport driver for Arch Linux. See Digi release notes for supported products.

# Build instructions: (Skip these first two sections)

# This only applies if you installed a long time ago when this driver would still
# compile and haven't upgraded in a while. Now this can't be built on Arch without a
# patch so new users skip to the next section.

# This PKGBUILD does not clean up the slop from the Digi supplied make.
# If you have already installed according to the the instructions
# log on as root and go through the process in reverse from the original
# unmodified Digi tgz. You won't lose your configuration.
# make preuninstall; make uninstall
# To clean up you may want to remove the folders /share/ and /etc/init.d/
# Arch Linux does not use these folders though they may have spurious files from
# other misdirected installs.

# The next section: ... Now onto the real install ...

# Set the mode for all created devices.
_opt_defaultmode="0660" # default: 0600
_opt_defaultgroup="uucp" # default: root
# If you need more granular control.
# See http://knowledge.digi.com/articles/Knowledge_Base_Article/HOW-TO-Preserve-device-permissions-settings-with-RealPort-in-Linux/
# Once set copy /etc/udev/rules.d/10-dgrp.rules to the PKGBUILD folder
# and it will be made into the package.

# Digi's product name is inconsistent. Here you can choose. RealPort seems the most popular.
_opt_RealPort='RealPort' # Can also be Realport

_opt_DKMS=1           # This can be toggled between installs

# Since the kernel module isn't loaded until you have a device
# configured, these services are automatically enabled and started
# for immediate hardware support. They will be reenabled each time the
# package is installed or upgraded.
# systemctl enable dgrp_daemon.service
# systemctl start dgrp_daemon.service
# systemctl enable dgrp_ditty.service
# systemctl start dgrp_ditty.service

# To stop these services from loading:
# systemctl disable dgrp_daemon.service
# systemctl stop dgrp_daemon.service
# systemctl disable dgrp_ditty.service
# systemctl stop dgrp_ditty.service

# To get started using your Digi products:
# man -Ik "Digi "
# man dgrp_gui
# man dgrp_cfg_node
# man ditty
# man drpadmin

# The man page for dgrp_cfg_node lacks some detail. See this page for more info
# ftp://digiftp.digi.com/support_archive/support/manuals/psts/rp-linux-conf-managing-portservers-with-dgrp-config-node.html

# To get your equipment up faster on servers that don't have X installed
# I've supplied a console shell script "drpadmin".
# It is adapted from Digi's RealPort "drpadmin" for Sun, HP UX, and SCO and has the same
# look and feel.

# Show available Digi devices
#   addp.pl -Q

# For information about using dgrp_ditty.service to maintain your ditty settings
# across reboots see http://knowledge.digi.com/articles/Knowledge_Base_Article/How-do-I-configure-my-ditty-rp-port-settings-to-stay-after-rebooting-when-using-RealPort-in-Linux/

# UnInstall cleanup:
# rm /etc/dgrp.backing.store* /usr/bin/dgrp/config/ditty.commands
# rmdir /usr/bin/dgrp/config
# rmdir /usr/bin/dgrp

set -u
pkgname='dgrp'
#_pkgver='1.9-36'; _dl='81000137_X.tgz'
#_pkgver='1.9-38'; _dl='81000137_Y.tgz'
#_pkgver='1.9-39'; _dl='40002086_Z.tgz'
#_pkgver='1.9-40'; _dl='40002086_AA.tgz'
_pkgver='1.9-41'; _dl='40002086_AB.tgz'
pkgver="${_pkgver//-/.}"
pkgrel='1'
pkgdesc="tty driver for Digi ${_opt_RealPort} ConnectPort EtherLite Flex One CM PortServer TS IBM RAN serial console terminal servers"
#_pkgdescshort="Digi ${_opt_RealPort} driver for Ethernet serial servers" # For when we used to generate the autorebuild from here
arch=('i686' 'x86_64')
url='https://www.digi.com/'
license=('GPL' 'custom') # OpenSSL=Apache. Arch is always new enough to not need their version.
depends=('grep' 'awk' 'systemd' 'procps-ng' 'psmisc' 'perl')
if [ "$(vercmp "${pkgver}" '1.9.39')" -le 0 ]; then
  _opt_SSL10=1
else
  _opt_SSL10=0
fi
if [ "${_opt_SSL10}" -ne 0 ]; then
  depends+=('openssl-1.0')
fi
optdepends=(
  {tk,gksu}': Digi RealPort Manager GUI'
  'java-runtime: Digi Device Discovery Tool GUI'
  'mbrowse: SNMP browser GUI'
)
backup=('etc/dgrp.backing.store')
options=('!docs' '!emptydirs')
install="${pkgname}-install.sh"
_vercheck() {
  local _versed2="${_verwatch[1]//:/\\:}" # Escape the two things that the PKGBUILD is not permitted to do
   _versed2="${_versed2//$/\\$}" # End of line (though sed doesn't seem to require this), and end of search
  curl -s -l "${_verwatch[0]}" | sed -ne "s:^${_versed2}"'$:\1:p' | sed -e 's:-:.:g' | sort -V
}
_verwatch=('https://www.digi.com/support/includes/drivers.aspx?pid=1954&osvid=218' '<li>.*Realport Driver for Linux ver\. \([^,]\+\), tgz version.*' 'f')
_mibs=(
  '40002014_a.mib' # DIGI Connectware Manager Notifications
  '40002194_H.mib' # Portserver TS MIB File
  '40002195_P.mib' # Digi Structures of Management (SMI) MIB
  '40002236_b.mib' # Digi MODBUS MIB
  '40002237_c.mib' # Digi Power Supply MIB
  '40002238_b.mib' # Digi Multi-Electrical Interface (MEI) MIB
  '40002239_B.mib' # Digi Socket ID MIB File
  '40002240_B.mib' # Portserver TS Port Buffering MIB File
  '40002257_B.mib' # Digi IA MIB
  '40002258_B.mib' # Digi UDP Serial MIB
  '40002335_B.mib' # Portserver TS Secure Access MIB File
  '40002336_C.mib' # Digi Power Management MIB File
  '40002337_D.mib' # Digi Power Management Traps MIB
  '40002338_D.mib' # Digi Keyword Notification MIB
  '40002339_D.mib' # Digi Login Traps MIB
  '40002410_a.mib' # DIGI Connect Device Info Management Information Base
  '40002411_a.mib' # Digi Connect Serial Alarm Traps MIB
  '40002478_B.mib' # Digi NFS TRAPS MIB
  '40002479_F.mib' # CM Management Information Base
  '40002514_a.mib' # Digi Connectware Manager Notifications MIB
  '40002515_a.mib' # Digi Connect Device Identity MIB
  '40002520_a.mib' # Digi Power Traps MIB
  '40002709_C.mib' # Digi ConnectPort LTS MIB
  'rfc1316.mib' # Portserver II RFC1316-MIB Definitions
  'rfc1317.mib' # Portserver II RFC1317-MIB Definitions
)
# Let me know if these dnw (do not want) items are actually serial device servers and should be installed.
_mibsdnw=(
  '40002325_D.mib' # DIGI Wireless Lan Management Information Base
  '40002370_C.mib' # DIGI Serial Traps Management Information Base
  '40002436_B.mib' # DIGI Modem Test Traps Management Information Base
  '40002477_B.mib' # Management Information Base
  '40002519_F.mib' # Passport Management Information Base
  '40002521_a.mib' # DIGI IPMI Notification Feature Management Information Base
  '40002593_B.mib' # DIGI Connect Mobile Information Management Information Base
  '40002594_a.mib' # DIGI Mobile Traps Management Information Base
  '40002782_a.mib' # Passport Management Information Base
  '40002846_A.mib' # DIGI Connect Mobile Status Management Information Base
)
_mibsrc='http://ftp1.digi.com/support/utilities/'
_filever="${pkgver//\./-}"
_filever="${_filever/-/.}"
_srcdir="dgrp-${_filever%%-*}"
source=(
  #"${pkgname}-${pkgver}-81000137_X.tgz::http://ftp1.digi.com/support/driver/81000137_X.tgz"
  #"${pkgname}-${pkgver}-beta.tgz::ftp://ftp1.digi.com/support/driver/RealPort%20Linux%20Beta%20Driver/dgrp-${_filever}_y1p.tgz.rpm"
  #"${pkgname##*-}-${pkgver}-${_dl}::http://ftp1.digi.com/support/driver/${_dl}"
  "${pkgname##*-}-${pkgver}-${_dl}::https://hub.digi.com/dp/path=/support/asset/realport-driver-for-linux-tgz/"
  'drpadmin' 'drpadmin.1' # "autorebuild-${pkgname}.sh"
  'addp_perl-1.0.tgz::https://github.com/severach/addp/archive/f92a6fd2050c9f32a5a11cac18cd9def78138530.tar.gz'
  'ftp://ftp1.digi.com/support/utilities/AddpClient.zip'
  "${_mibs[@]/#/${_mibsrc}}"
  # 'a' versions are by Digi from next version
  '0000'{,a}'-Kernel-4-13-CLASS_ATTR_STRING.patch' # https://www.digi.com/support/forum/67157/realport-compile-error-with-fedor'{,a}'-27-kernel-4-14-14 https://www.digi.com/support/forum/65817/class_attr_driver_version-error-compiling-in-kernel-4-13
  '0001'{,a}'-Kernel-4-15-timers.patch' # https://forum.blackmagicdesign.com/viewtopic.php?uid=16&f=3&t=68382&start=0
  '0002'{,a}'-kernel-5.0.0-do_gettimeofday.patch'
  '0003'{,a}'-kernel-5.0.0-dgrp_mon_ops-access_ok.patch' # https://lkml.org/lkml/2019/1/4/418
  '0004-kernel-5.6-proc_dir_entry-proc_ops.patch'
  '0005-kernel-5.12-MODULE_SUPPORTED_DEVICE.patch'
  '0006-kernel-5.13-dropped-tty_check_change.patch'
  '0007-kernel-5.14-task_struct.state-unsigned-tty.patch'
  '0008-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  '0009-kernel-5.16-remove-LDISC_FLAG_DEFINED.patch'
  '0010-kernel-5.17-change-PDE_DATA.patch'
  '0011-kernel-6.1-remove-TTY_MAGIC.patch'
  '0012-kernel-6.1-INIT_C_CC-termios_internal.patch'
  '0013-kernel-6.0-set_termios-const-ktermios.patch'
)
unset _mibsrc
#source_i686=('http://ftp1.digi.com/support/utilities/40002890_A.tgz')
#source_x86_64=('http://ftp1.digi.com/support/utilities/40002889_A.tgz') # compiled i686 therefore worthless
# addp and sddp are incomplete. I replaced them with addp.pl
md5sums=('df7d7093759350208fbe5abf5ceb27de'
         'b4af5022ba96fcc2429263cfbbe85bae'
         '9feebec170552c9186e713e7f5852e14'
         'e9ae823e597f2b63d95e6d6a8e25cde3'
         '1b6491756c123234035c053baab1607c'
         '4dbc892ea6247057db2fe613391f9b02'
         '2e516af8bbe96b6d2137a106941d4223'
         'f404ac48baee06c5fbd7efab157704e9'
         'da3b2a1c78d981940afea9bd2da4bf96'
         'd824adbace7a52ed4a08ec2b3101b10f'
         '749a347ec350ac9ca5895ae4d0e2ca24'
         'feab0142fc161c7705e6a3a12a410f35'
         'ee66f700bdb828cfc916f1bd2fd9dc1a'
         '2a321009c37ea6070607d1f1b97de84d'
         '067d79acafc0eb32f809390fe1a9374e'
         '276d710e355e24ea6635bb23a3dd46d0'
         '0549b35492fb3e2dbee52b1ea7790a25'
         'f04c8e15255d115c05631845232e858a'
         'c1fa6b3f533da1bbf05c5be268ec9aba'
         'de6faa945f2816191f558df38a1ac917'
         '9495d5154f4d03fdd994922220dd1f2f'
         '5fc7f819bca1d5ebfc8e4d06a744cb77'
         '09ad1cc83d31f7365992d3f974fde6d5'
         '89545a33c5df6304b6c8e288a4019d54'
         'bc469a335d5b1a7986a93327a3b6f57b'
         '83104a3387dc09ba95ccf4e2581fb20f'
         '5da394f02ed6d62971f0d700f174bfd1'
         '1f6fcaabe4058c225674f866b19f2ca8'
         '031e105a06300feecacfc2774e48ff2f'
         '699172bf54ec0e45b6aae348b1f570e8'
         'be3bd26c2b2a74b445854135b17766a8'
         '60a5d51a562aa1d8fa5f2294a683ce47'
         '9f9275a3fb9b7a81a2ba098db1738b7d'
         'c1cd2d98c466e252b6c8f3a85e92489f'
         '6a58beab1cb022cd368e874e24c7b9ef'
         '91eb572a5ad032073326fd4dd2842504'
         'a65ba371ae411de4607259fc78a55682'
         '4f1c03f1cc5f440a770c080a121d998a'
         'c25c1fdfbdc1fa38d87e45cf1c8511c2'
         '2596b5f38ef54d72af08dca05fcce369'
         '60a06421a819bc65bd5ba0c3841e0500'
         '5dfc03b8f6b8d190b63271b8ef32986c'
         'f60c03c266bec028b4df4b7996deaacb'
         '3b51a73b29843bfc6db748351dea464b'
         'a841defc71b4b1da33ac9b24cdff52ca'
         '18dad6ca1c3bc2dd5206fe8caf4bcdf1'
         'bca5ff7935af3fe539ec30f1e9f59190'
         '40cf223579346f664c113cb7adcba434')
sha256sums=('9ab56e0c841a1eab13e9ced8f1ff6943be6643773dbbbb7b189462950b9f2113'
            '42898b9d24262de27e9b1f3067d51d01373810b7c9e4991403a7f0a5dd7a26cf'
            '66f8b106a052b4807513ace92978e5e6347cef08eee39e4b4ae31c60284cc0a3'
            '9d79df8617e2bb1042a4b7d34311e73dc4afcdfe4dfa66703455ff54512427f5'
            '00d7b452a4f16599f7162f512a05599614115554992b872fc5302b521ea04468'
            '4b54148008b02a2544d8b33f07c471a068b0973ac5402967af8bf73a28b6a8b6'
            'a1833d877b07b0f424676241b3e1070e116d07965db3131a61a3b6ce0ff90063'
            '6fca5df11304d905f561a0c251419619960a8da8e724d36b34e9977e97f02528'
            '2dd7868acf66c14d67012a2263088b08d8f9320c64b64db94740fae54b485c78'
            '26159071b1b0df2af04d612e32ce72c8835f241c56b9fa2dadee53d9d127d0b7'
            'f686011f7db06f0632f6460566da751a00fccd04bb1527b8a83239aad46d4de5'
            '50130240e3ce85759aa99b3a268568de6a97084eeb40a92ef0b4937333808d8a'
            'f4a89790ad1413ecfc2b723a45fa0d0b93ae01cc433d930db4e689f82d0367fd'
            '3e2881ebf6866751a64e7cf948b85a3c2053f2d0a8799234c56b732cde17b853'
            'c54576fad5ccedfd50cebc22a6dd45bd8c4deb875282f5c7d1a89a33426c1746'
            '08eecc0e5d8f9fffe0fcf3b9f47e56c81bd713964bd7aeb0f4b6a6de3e0f3592'
            '75ba60917769c2cc2324050b74a4e618f0904464ece15646045fd931001c47e4'
            '43e7f12bb32343254f472260fd26566e8aab58764ba3e73d500542e462f27ac5'
            '241ef4a96b4d34652bfc7a9ce0bab317129e0123f05c68713a45d88624ddd19b'
            '21b8d7c50cacc418611b909159ed6258dc13026e8e55034e86965227b8176509'
            '471f1342398c4fce86e1d437c4f6053be75ae3a99337613d39c05e4e3c80ede9'
            '06a81a5dfaa1c61944d1a12d2efc8129c0ee72f630817f844879bd17d6cb4d80'
            'a3286df00ca3566361faf1f128752c56d046558277cd90025831f9840129e33f'
            '33b29ee72b590ecadd54e893317a279bb49a2dd4a189fd386491e1a67ef193a8'
            '4011005db626db67b50f13b6242db1fed0d11b0d89e56af7ae39f5719d7cd323'
            '679b081c31e5fc156ad9c55afc0bba9ec354f37e28eeeb453bcbd6b1cf68988e'
            '731e05fc551367faa6ad5dc317eedf305388ab12db196c0a1361a3d01bd35279'
            'c471cafa43503a40d43b42acd8bc6ef49db29e55a74e0494c85f729ea45fe243'
            '5cac7ce2e6f043127f314b93694af021ae7820ffb5bf3de343da7a240d05e9c8'
            '8654496d83c083e457e8bb9bae2b1e71804d156a38c284d89872d0125eba947d'
            '61500188b388fd1eb52ec970150cf098d855b8ba09a8efb8192803eebefaba03'
            'cc54e4bc21255a419ba0a416b1c8d1e705e27676c5561dd4b83fe657f045b65e'
            '46a87449cd316a621271def4147ba781424dd524ae2332cd55dd07f2ac9ab456'
            '4cb63ad72244eea04879b07cbca809120bdb08a7d8ea2a37e8d9a6fcc1333f26'
            '353d15624675c78dfd83318195d75bdb0507fd0476f5e22be1329bf257d2de1e'
            '9c6ce4ae64e206b442aeea6af98b9b86b8a67571ba00a92fc721619ba3061c26'
            'acbcf462628daf4fa2dbee064969a158ccc0bb0ce9f286ceb3617e470eab1c1f'
            '882019276d59e6cc15fcda1bb1dea75b01591509a2644ddb0225ef1d5a17fd1c'
            'b812176f6061d135ab45facecf5a05922d9ffd5ec0a6f17c3e3a5a74729034b1'
            '82f2c244f169c1f5a9b6186e4e4436c116bd020a1be973e8be261097d38bc937'
            'eaab5a80791644a24950fe0c6db2c09535655c63ed3a263eb70791ab30f86ab9'
            '50975ac2377ffd24874746df4b820de1734f53eb322bd25ccc9d51148129a2e0'
            '0ae424e8211836edbededafd308cf9ae73cdb791752c4fc43e1c194db7b77cab'
            '1d6ab72eec4977b7789d0f5af3dc907bebdd21e417abb5dcfdac80c460a77bae'
            'd1c641d3f024e8e11c4a36bf58570afb4b63fcaa4a22f05c59b513a35a6a4af7'
            '2b9ccbe92e4e1cbeafd16208ef011209bce30b6d3f9b4f288d0b83418479b1bc'
            '2ac185b8a27855c22d64d2e3f56e28f6a4442b1141ad46e4a0a078e0e22adc53'
            'a23535a5681516931d7de12e35c49086cb38b5a44f831acd5840640e5f26ce09')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

_modulename='dgrp'

# Check for updates and case errors to the 2 mib lists
_fn_mibcheck() {
  echo 'Checking for newer and misnamed MIB'
  local line
  local linea
  local file='/tmp/PKGBUILD.mibs'
  # Get list of files
  while IFS='' read -r line || [[ -n "${line}" ]]; do
    read -r -a linea <<<"${line}"
    line="${linea[8]}" # filename
    case "${line}" in
    4000*.mib)
      echo "${line}" >> "${file}"
      ;;
    esac
  done < <(curl -s 'ftp://ftp1.digi.com/support/utilities/') # curl is sorted and case insensitive because Digi runs WSFTP. We can't assume this will be always so.
  # get list of latest files
  local lineu linep lineup
  lineup=''
  linep=''
  linea=()
  while IFS='' read -r line || [[ -n "${line}" ]]; do
    lineu="${line^^}"
    if [ "${lineup%%_*}" != "${lineu%%_*}" ] && [ ! -z "${linep}" ]; then
      linea+=("${linep}")
    fi
    lineup="${lineu}"
    linep="${line}"
  done < <(sort -f "${file}")
  rm -f "${file}"
      linea+=("${linep}")
  # Check against _mibs
  local found mib mibu
  for line in "${linea[@]}"; do
    lineu="${line^^}"
    found=0
    for mib in "${_mibs[@]}" "${_mibsdnw[@]}"; do
      mibu="${mib^^}"
      if [ "${lineu%%_*}" = "${mibu%%_*}" ]; then
        if [ "${lineu}" != "${mibu}" ]; then
          echo "${mib} has been updated to ${line}"
        elif [ "${line}" != "${mib}" ]; then
          echo "Case correction: ${mib} -> ${line}"
        fi
        found=1
        break
      fi
    done
    if [ "${found}" -eq 0 ]; then
      echo "${line} is missing"
    fi
  done
  return 1
}
#_fn_mibcheck
# bash -c 'source PKGBUILD; _fn_mibcheck'

prepare() {
  set -u
  cd "${_srcdir}"

  # Version check
  local _tv
  _tv="$(grep -e 'TRUE_VERSION=' ./Makefile.inc | cut -d'"' -f2)"
  _tv="${_tv%_*}"
  if [ "${_pkgver}" != "${_tv}" ]; then
    set +u
    echo 'Version mismatch'
    false
  fi

  if [ "$(vercmp "${pkgver}" '1.9.38')" -le 0 ]; then
    #cp -pr "${srcdir}/${_srcdir}"{,.orig-0000}
    #diff -pNaru5 dgrp-1.9{.orig,} > '0000-Kernel-4-13-CLASS_ATTR_STRING.patch'
    patch -Nup1 -i "${srcdir}/0000a-Kernel-4-13-CLASS_ATTR_STRING.patch"
    test ! -d "${srcdir}/${_srcdir}.orig-0000" || echo "${}"

    #cp -pr "${srcdir}/${_srcdir}"{,.orig-0001}
    #diff -pNaru5 dgrp-1.9{.orig-0001,} > '0001-Kernel-4-15-timers.patch'
    patch -Nup1 -i "${srcdir}/0001a-Kernel-4-15-timers.patch"
    test ! -d "${srcdir}/${_srcdir}.orig-0001" || echo "${}"
  fi

  # 1.3-9 adds an 11th parameter on the end of each line in dgrp.backing.store
  # Remove the last 'default' to go back

  if [ "$(vercmp "${pkgver}" '1.9.39')" -le 0 ]; then
    #cp -p driver/2.6.27/dgrp_mon_ops.c{,.orig}; false
    #diff -pNau5 driver/2.6.27/dgrp_mon_ops.c{.orig,} > '0002-kernel-5.0.0-do_gettimeofday.patch'
    patch -Nup0 -i "${srcdir}/0002a-kernel-5.0.0-do_gettimeofday.patch"

    #cp -pr driver/2.6.27{,.orig}; false
    #diff -pNaru5 driver/2.6.27{.orig,} > '0003-kernel-5.0.0-dgrp_mon_ops-access_ok.patch'
    patch -Nup0 -i "${srcdir}/0003a-kernel-5.0.0-dgrp_mon_ops-access_ok.patch"
  fi

  if [ "$(vercmp "${pkgver}" '1.9.40')" -le 0 ]; then
    #cp -pr driver/2.6.27{,.orig}; false
    #diff -pNaru5 driver/2.6.27{.orig,} > '0004-kernel-5.6-proc_dir_entry-proc_ops.patch'
    patch -Nup0 -i "${srcdir}/0004-kernel-5.6-proc_dir_entry-proc_ops.patch"

    #cp -pr driver/2.6.27{,.orig}; false
    #diff -pNaru5 driver/2.6.27{.orig,} > '0005-kernel-5.12-MODULE_SUPPORTED_DEVICE.patch'
    patch -Nup0 -i "${srcdir}/0005-kernel-5.12-MODULE_SUPPORTED_DEVICE.patch"

    #cp -pr driver/2.6.27{,.orig}; false
    #diff -pNaru5 driver/2.6.27{.orig,} > '0006-kernel-5.13-dropped-tty_check_change.patch'
    patch -Nup0 -i "${srcdir}/0006-kernel-5.13-dropped-tty_check_change.patch"

    # unsigned write_room https://www.spinics.net/lists/linux-serial/msg42297.html
    # unsigned chars_in_buffer https://www.spinics.net/lists/linux-serial/msg42299.html
    # set_current_state https://linux-kernel.vger.kernel.narkive.com/xnPfKhYP/patch-2-5-52-use-set-current-state-instead-of-current-state-take-1
    #rm -f driver/2.6.27/*.orig; cp -pr driver/2.6.27{,.orig}; false
    #diff -pNaru5 driver/2.6.27{.orig,} > '0007-kernel-5.14-task_struct.state-unsigned-tty.patch'
    patch -Nup0 -i "${srcdir}/0007-kernel-5.14-task_struct.state-unsigned-tty.patch"

    # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08799.html [PATCH 5/8] tty: drop alloc_tty_driver
    # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08801.html [PATCH 7/8] tty: drop put_tty_driver
    #rm -f driver/2.6.27/*.orig; cp -pr driver/2.6.27{,.orig}; false
    #diff -pNaru5 driver/2.6.27{.orig,} > '0008-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
    patch -Nup0 -i "${srcdir}/0008-kernel-5.15-alloc_tty_driver-put_tty_driver.patch"

    # https://lore.kernel.org/all/20210914091134.17426-2-jslaby@suse.cz/
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0009-kernel-5.16-remove-LDISC_FLAG_DEFINED.patch'
    patch -Nup1 -i "${startdir}/0009-kernel-5.16-remove-LDISC_FLAG_DEFINED.patch"

    # https://www.spinics.net/lists/linux-fsdevel/msg207433.html
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0010-kernel-5.17-change-PDE_DATA.patch'
    patch -Nup1 -i "${startdir}/0010-kernel-5.17-change-PDE_DATA.patch"
  fi

  if :; then
    # https://lore.kernel.org/lkml/723478a270a3858f27843cbec621df4d5d44efcc.1663288066.git.nabijaczleweli@nabijaczleweli.xyz/T/
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0011-kernel-6.1-remove-TTY_MAGIC.patch'
    patch -Nup1 -i "${startdir}/0011-kernel-6.1-remove-TTY_MAGIC.patch"

    # https://www.uwsg.indiana.edu/hypermail/linux/kernel/1809.1/00449.html
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0012-kernel-6.1-INIT_C_CC-termios_internal.patch'
    patch -Nup1 -i "${startdir}/0012-kernel-6.1-INIT_C_CC-termios_internal.patch"

    # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0013-kernel-6.0-set_termios-const-ktermios.patch'
    patch -Nup1 -i "${startdir}/0013-kernel-6.0-set_termios-const-ktermios.patch"
  fi

  # Standardize name of RealPort
  sed -e "s/RealPort/${_opt_RealPort}/gI" -i $(grep -lrF $'RealPort\nRealport' .)
  # grep -ri realport . | grep -vF $'RealPort\nRealport'

  rm -f daemon/openssl-*.tar.gz # I don't want their version to build if OpenSSL version detection fails in the future

  # Fix configure
  sed -e '# Cosmetic fix for newer gcc compilers' \
      -e '#s:\(3.9\*|4.\*\))$:\1|5.*|6.*|7.*|8.*|9.*):g' \
      -e "# I can't find any other way to fix the modules dir" \
      -e 's:/lib/modules/:/usr&:g' \
      -e '# Kill a harmless mkdir error. They mkdir the folder then dont use it.' \
      -e 's@^\(\s\+\)\(mkdir -p /usr/lib/modules/${osrel}/misc\)$@\1: #\2@g' \
    -i 'configure'

  # Some files ignore configure --sbindir
  sed -e 's:/usr/sbin:/usr/bin:g' -e 's:/sbin/:/usr/bin/:g' -i 'configure' Makefile* */Makefile scripts/{preun,post}install

  # make postinstall package compatible
  # some postinstall is done in install
  # cp -p 'scripts/postinstall'{,.Arch} # DEBUG for comparison
  sed -e '# Some security for root' \
      -e 's:^#!\s*/bin/sh$:&\nif [ "${EUID}" -ne 0 ]; then\n  echo "Must be root!"\n  exit 1\nfi:g' \
      -e '# Remove Install noise' \
      -e 's:^\(\s*\)\(echo "Running\):\1#\2:g' \
      -e '# Block the usage of chkconfig' \
      -e 's:/usr/bin/chkconfig:/usr/bin/true:g' \
      -e '# Remove noise for defunct chkconfig' \
      -e 's:^\(\s\+\)\(echo "Added\):\1#\2:g' \
      -e '# Automatically bring back pacsave file on reinstall' \
      -e 's:^if \[ -f /etc/dgrp:if [ -s "/etc/dgrp.backing.store.pacsave" -a ! -s "/etc/dgrp.backing.store" ]; then\n  mv "/etc/dgrp.backing.store.pacsave" "/etc/dgrp.backing.store"\nfi\n&:g' \
      -e '# No need to upgrade and back up a blank file' \
      -e 's:-f \(/etc/dgrp.backing.store\):-s \1:g' \
      -e '# Why depend on /tmp when we can use the /etc folder which is where admin will be looking to fix their non working hardware' \
      -e 's:/tmp/dgrp/dgrp.backing.store:/etc/dgrp.backing.store:g' \
      -e '# The rest is done in package.' \
      -e 's:^echo "Checking:exit 0\n&:g' \
      -e '# Prepare the links for package to use them' \
      -e 's:^\(\s\+\)ln -s /usr/bin/\([^ ]\+\) \(.\+\)$:\1ln -sf "\2" "${_DESTDIR}\3":g' \
      -e "# All that's left is config conversion" \
    -i 'scripts/postinstall'
  test ! -s 'scripts/postinstall.Arch'
  #cp -p 'scripts/preuninstall' 'scripts/preuninstall.Arch' # For comparison
  sed -e '# Some security for root' \
      -e 's:^#!\s*/bin/sh$:&\nif [ "${EUID}" -ne 0 ]; then\n  echo "Must be root!"\n  exit 1\nfi:g' \
      -e '# Remove UnInstall noise' \
      -e 's:^\(\s*\)\(echo "Running\):\1#\2:g' \
      -e '# Block the usage of chkconfig' \
      -e 's:/usr/bin/chkconfig:/usr/bin/true:g' \
      -e '# Remove more noise' \
      -e 's:^\(\s\+\)\(echo "Removed\):\1#\2:g' \
      -e '# No need to sleep. The daemons are shut down by systemd' \
      -e 's:^sleep :#&:g' \
      -e '# pacman handles the links and files' \
      -e 's;if \[ -L ;if ! : \&\& [ -L ;g' \
      -e 's;^\(\s*\)\(rm -f \);\1: #\2;g' \
      -e '# Fixing this file was almost useless. All it does after we disable everything is an rmmod' \
    -i 'scripts/preuninstall'
  test ! -s 'scripts/preuninstall.Arch'

  # Change insmod to modprobe
  sed -e 's:\${INSMOD}.*$:modprobe "${DGRP_DRIVER}" # &:g' -i 'config/dgrp_cfg_node'

  if [ "${_opt_SSL10}" -ne 0 ]; then
    # drpd makefile does not honor --with-ssl-dir. We convert the bogus folder to the one we need.
    sed -e 's:/usr/local/ssl/include:/usr/include/openssl-1.0:g' \
        -e 's:/usr/local/ssl/lib:/usr/lib/openssl-1.0:g' \
      -i 'daemon/Makefile.in'
  fi

  # new folder in gcc 8
  sed -e 's/^clean:$/&\n\trm -f .cache.mk/g' \
      -e '# Switch SUBDIRS= to M= for Kernel 5.4' \
      -e 's:SUBDIRS=:M=:g' \
    -i driver/*/Makefile*

  # Branding in dmesg
  sed -e 's@ please visit [^"]\+"@ please visit https://aur.archlinux.org/packages/dgrp/"@g' \
      -e '/^dgrp_init_module/,/^$/ s@version: %s@& Arch Linux@g' \
    -i driver/[0-9]*/dgrp_driver.c

  set +u
}

_configure() {
  if [ ! -s 'Makefile' ]; then
    # this generates a harmless error as it tries to make a folder in /usr/lib/modules...
    if [ "${_opt_SSL10}" -ne 0 ]; then
      # --with-ssl-dir supplies to -I but mainly for configure. CFLAGS goes everywhere.
      # --with-ssl-dir is supplied to -L too which is worthless. We amend with LDFLAGS.
      CFLAGS="${CFLAGS} -I/usr/include/openssl-1.0" \
      LDFLAGS="${LDFLAGS} -L/usr/lib/openssl-1.0" \
      ./configure -q --sbindir='/usr/bin' --prefix='/usr' --mandir='/usr/share/man' --with-ssl-dir='/usr/include/openssl-1.0'
    else
      ./configure -q --sbindir='/usr/bin' --prefix='/usr' --mandir='/usr/share/man'
    fi
  fi
}

build() {
  set -u
  cd "${_srcdir}"
  _configure

  #. 'config/file_locations.Arch'
  make -s all -j1 # This package doesn't support threaded make and it's too small to fix
  set +u
}

# Copy this line into the .install file
_daemons=('daemon' 'ditty')

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

  #. 'config/file_locations.Arch'

  make -s -j1 RPM_BUILD_ROOT="${pkgdir}" install
  install -m644 'dinc/dinc.1' -t "${pkgdir}/usr/share/man/man1/" # They bypass the Makefile that does this
  chmod 644 "${pkgdir}/usr/bin/dgrp/config"/{dgrp.gif,file_locations}
  chmod 744 "${pkgdir}/usr/bin/"{dgelreset,dgipserv}

  # Postinstall
  # Create the links, customized for us by prepare above
  grep 'ln -sf ' 'scripts/postinstall' |\
  _DESTDIR="${pkgdir}" \
  sh -e -u -s --
  #rmdir "${pkgdir}/usr/share/doc" # makepkg does this for us

  # Install MIB
  local _mib
  for _mib in "${srcdir}"/*.mib; do
    install -Dpm0644 "${_mib}" "${pkgdir}/usr/share/snmp/mibs/digi-serial-server-${_mib##*/}.txt"
  done

  # Prepend our message on the udev rules file
  install -dm755 "${pkgdir}/etc/udev/rules.d/"
  touch "${pkgdir}/${backup[0]}" # postinstall handles the pacsave file automatically
  chmod 644 "${pkgdir}/${backup[0]}"
  if [ ! -s "${pkgdir}/tmp/dgrp/10-dgrp.rules" ]; then
    mv "${pkgdir}/etc/udev/rules.d/10-dgrp.rules" "${pkgdir}/tmp/dgrp/10-dgrp.rules" # 1.9-41
  fi
  sed -e 's:^KERNEL=="cu_dgrp:#&:g' -i "${pkgdir}/tmp/dgrp/10-dgrp.rules" # Recommended by Digi
  cat > "${pkgdir}/etc/udev/rules.d/10-dgrp.rules" << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# Generated: $(date +"%F %T")

# Warning: If you modify this file you should copy it into the folder with the
# PKGBUILD or you might lose the customizations on the next install.

# This file was customized by the PKGBUILD by setting the mode on all ports
# to MODE=(see below). If all you need is a different mode on all ports
# then set the option in the PKGBUILD. If you need more granular control
# see these customization instructions:

# http://knowledge.digi.com/articles/Knowledge_Base_Article/HOW-TO-Preserve-device-permissions-settings-with-RealPort-in-Linux/

# Then copy this file into the folder with PKGBUILD.

$(cat "${pkgdir}/tmp/dgrp/10-dgrp.rules")
EOF
  rm -f "${pkgdir}/tmp/dgrp/10-dgrp.rules"
  rmdir "${pkgdir}/tmp/dgrp" "${pkgdir}/tmp" # crashes if other files ever show up in /tmp/dgrp
  if [ ! -z "${_opt_defaultmode:-}" ]; then
    sed -e 's:^\(KERNEL=="tty_dgrp\)\(.*\)$:\1\2, MODE="'"${_opt_defaultmode}"'", GROUP="'"${_opt_defaultgroup}"'":g' -i "${pkgdir}/etc/udev/rules.d/10-dgrp.rules"
  fi
  if [ -s "${srcdir}/../10-dgrp.rules" ]; then
    cp "${srcdir}/../10-dgrp.rules" "${pkgdir}/etc/udev/rules.d/10-dgrp.rules" # no cp -p in case this file has any wrong user:group
  fi
  chmod 644 "${pkgdir}/etc/udev/rules.d/10-dgrp.rules"

  install -Dpm755 "${pkgdir}/etc/init.d"/{dgrp_daemon,dgrp_ditty} -t "${pkgdir}/usr/bin/dgrp/daemon/"
  rm -f "${pkgdir}/etc/init.d"/{dgrp_daemon,dgrp_ditty}
  rmdir "${pkgdir}/etc/init.d"

  # systemd integration.
  #install -dm755 "${pkgdir}/usr/lib/systemd/system/"
  local _daemon
  for _daemon in "${_daemons[@]}"; do
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
[Unit]
Description="Digi ${_opt_RealPort} ${_daemon}"
After=network.target

[Service]
Type=forking
ExecStart=/usr/bin/dgrp/daemon/dgrp_${_daemon} start
ExecStop=/usr/bin/dgrp/daemon/dgrp_${_daemon} stop
ExecReload=/usr/bin/dgrp/daemon/dgrp_${_daemon} reload

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/dgrp_${_daemon}.service"
  #chmod 644 "${pkgdir}/usr/lib/systemd/system/dgrp_${_daemon}.service"
done

  # Install my custom drpadmin with man page.
  install -Dm755 "${srcdir}/drpadmin" -t "${pkgdir}/usr/bin/"
  sed -e 's/^#distro=:::$/g_distro="Arch Linux"/g' \
      -e "s/RealPort/${_opt_RealPort}/gI" -i "${pkgdir}/usr/bin/drpadmin"
  install -Dm444 "${srcdir}/drpadmin.1" -t "${pkgdir}/usr/share/man/man1/"
  # Standardize name of RealPort in man pages
  sed -e "s/RealPort/${_opt_RealPort}/gI" -i "${pkgdir}/usr/share/man/man8/"*.8 "${pkgdir}/usr/share/man/man1/"*.1

  # Desktop file for config tool
  install -Dm644 <(cat << EOF
[Desktop Entry]
Name=Digi RealPort Manager
GenericName=Device Server Manager
Comment=Manage tty connections to Digi serial device servers
Exec=gksudo -k -u root dgrp_gui
Terminal=false
Type=Application
#Icon=
Categories=Application;Utility;
MimeType=application/x-executable
EOF
  ) "${pkgdir}/usr/share/applications/dgrp_cfg.desktop"

  # addp tui and gui utilities
  #install -Dpm755 "${srcdir}/addp" -t "${pkgdir}/usr/bin/"
  install -Dpm755 "${srcdir}"/addp-*/'/addp.pl' "${pkgdir}/usr/bin/"
  install -Dpm644 "${srcdir}/AddpClient.jar" -t "${pkgdir}/usr/bin/dgrp/"

  # Desktop file for config tool
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Desktop Entry]
Name=Digi Device Discovery Tool
GenericName=Device Server Manager
Comment=Manage Digi serial device servers
Exec=java -jar /usr/bin/dgrp/AddpClient.jar
Terminal=false
Type=Application
#Icon=
Categories=Application;Utility;
MimeType=application/x-executable
EOF
  ) "${pkgdir}/usr/share/applications/AddpClient.desktop"

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
# Placing the DKMS generated module in a different location than the standard install prevents conflicts when PKGBUILD _opt_DKMS is toggled
DEST_MODULE_LOCATION[0]="/kernel/drivers/misc"
EOF
    ) "${_dkms}/dkms.conf"
    install -dm755 "${_dkms}/driver/build/"
    cp -pr 'driver/build/' "${_dkms}/driver/"
    cp -pr 'commoninc/' "${_dkms}/"
    install -pm644 'Makefile.inc' -t "${_dkms}/"
    sed -e 's:/usr/lib/modules/[^/]\+/:/usr/lib/modules/$(KERNELRELEASE)/:g' \
       -i "${_dkms}/driver/build/Makefile"
    make -C "${_dkms}/driver/build/" clean
  fi
  set +u
}

set +u
