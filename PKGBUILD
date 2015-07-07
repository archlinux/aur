# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Category: system

# TOFIX: Cactus Lone-Star needs to produce new compiles of vback,vrestore,showstar
# TOFIX: Cactus Lone-Star needs to fix device setup to not ask about AIR-BAG if not installed.
# TOFIX: Cactus Lone-Star needs to fix all the shell scripts so that /log can be 
#   somewhere more sane. Various texts claim that it can be moved but look at 
#   the scripts and you'll see: not a chance!
# TOFIX: Why are the color menus disabled?
# TOFIX: Cactus Lone-Star needs to fix 1 script so ksh isn't needed.
# TOFIX: Cactus Lone-Star needs to fix spelling on the Rescue Ranger web page. 
#        It's HIPAA, not HIPPA.
# TODO: Check the prelink code in the installer.
# TODO: Switch to bzip2 after verifying that lone-tar isn't a multi cpu hog.
# TODO: Smtp server
# TODO: Test upgrades to new versions.
# TODO: Ask Cactus if lone-tar has been coded to use AES-NI extensions in E3 processors.
# TODO: See if trial can be installed to ArchISO.
# TODO: Why aren't /proc and /run excluded? What's special about /sys?

# This PKGBUILD is not supported by Cactus Software! For a supported system see
# http://www.cactus.com/support/linux-support-table.html
# See also: Quick Start Guide - Linux - Lone Star Software Corp. (PDF)
# FYI: This installs better, upgrades better, and is easier to use than their 
#   install on supported systems.

# AIR-BAG is not installed. I'd need to rework the whole thing for Arch and
#  Arch servers with a well documented install playbook and PKGBUILDs for all 
#  critical software (hint hint) are faster and easier to reinstall. A proper
#  implementation of AIR-BAG would be generated using the distro's official
#  installer release so that CD and USB boot would be supported. See Arch
#  'Remastering the Install ISO' for more information on adding to the 
#  install CD.
# Cactus constructs AIR-BAG variants for each supported OS which are 
#  downloaded separately as they become available. At this time Cactus has 
#  AIR-BAG 4412 built for only two supported systems. Previous versions are
#  available for more systems.
# LTX is not included. RESCUE-RANGER is for Unix only. AIR-BAG is for Linux.
# AES256 is installed but is not available to trial users.
# GOSH is installed but I have no idea how it works.

# This package includes only a 30 day free trial. A license can be purchased
# from Cactus Software, Lone Star Software. The trial can be used to restore
# data from old backups though I suspect not AES encrypted backups.
# http://www.cactus.com/ Lone Star Software

# Installation on 64 bit Linux requires Multilib support for 32 bit apps.
# See the ArchWiki for how to enable Multilib.

# Recommended build command: makepkg -scCfi

# A cron daemon must be started and enabled. cron is too integrated into
# lone-tar for a quick switch to systemd without changes by Cactus. 
# I use cronie but any should do. Enable the one you selected during 
# install.
# systemctl enable cronie.service
# systemctl start cronie.service

# To finish the initial install run as root:
# lone-tarinstall.sh

# Continue your install with the PDF from Cactus online:
#   Quick Start Guide - Linux - Lone Star Software Corp.
# Glance through the already complete early instructions and start at
#   5.3. Adding a new backup device.

# Uninstall cleanup:
# rm -rf /log # check for non Lone-tar files first
# rm -rf /usr/lone-tar
# rm -rf /usr/lib/lone-tar
# So far no files in /etc

# VERIFIED: lone-tar installs substantially in accordance to the instructions.
#   Any deviations are assisted by the install programs.
# VERIFIED: cron management works with cronie.
# VERIFIED: Test works with device type "file"
# VERIFIED: Same version upgrades work pretty well.
# VERIFIED: Device setup auto detects tape drives.
# VERIFIED: Restore from DAT 160 tape written by SCO lone-tar, hardware compression enabled.
# VERIFIED: mt-st seems to be a good substitute for cpio::mt-gnu

# Troubleshooting:
# Restore from tape: Error 12 occurred  because...Cannot allocate memory
# Fix: Change blocking factor. Auto detect selected 64. 20 was required to restore from this SCO written DAT 160 tape.
# You can see that tar will give the exact same cryptic error here:
# http://aplawrence.com/Linux/tapeblock.html Reading SCO tapes on Linux
# tar: /dev/st0: Cannot read: Cannot allocate memory

set -u
pkgname='lone-tar'
pkgver='4.4.1.2'
pkgrel='1'
pkgdesc='a reliable, easy to use, backup and recovery software for Linux supporting tape, optical, FTP, file, ssh, NAS, RDX, RD1000, USB, Samba, REV, and AES'
arch=('i686' 'x86_64')
license=('custom:LoneStarSoftware')
depends=('bash' 'awk' 'ncurses' 'wget' 'lynx' 'cdrkit' 'dvd+rw-tools' 'gzip' 'bzip2' 'rsync' 'openssh' 'mt-st-git' 'words' 'ksh' 'cron')
# Lone-tar expects mt-gnu from the cpio package which Arch removes for their compile. https://wiki.zmanda.com/index.php/Hardware_compression
# One script requires ksh, a script we're unlikely to ever use.
# We could make the cdr tools optional but I fear that the target market
# won't read the optdepends list resulting in a flurry of calls to support. 
# Besides if AIR-BAG is ever supported then it would need cdr tools even if 
# CD/DVD is never used as a backup device. I don't even allow servers to have 
# DVD drives so AIR-BAG really needs to be improved to boot USB.
if [ "${CARCH:-}" = 'x86_64' ]; then
# this will error out on x64 if multilib isn't enabled
# Even with the system utilities subbed out, some lone-tar executables are still 32 bit.
  depends+=('lib32-glibc' 'lib32-ncurses')
  : # depends+=('lib32-libstdc++5')
else
  : # depends+=('libstdc++5')
fi
# lt.dvdformat3 requires 'lib32-libstdc++5': ldd $(find -type f -executable) > ../flst
# Fortunately I determined I could replace this with a current executable.
url='http://www.cactus.com/'
#source_i686=('ftp://ftp.cactus.com/demos/4412-Linux/lt4412-LNX.sh.gz')
#source_x86_64=('ftp://ftp.cactus.com/demos/4412-Linux/lt4412-LNX64.sh.gz')
source_i686=('ftp://ftp.cactus.com/demos/4412-Linux/lt4412-LNX-EL6.sh.gz')
source_x86_64=('ftp://ftp.cactus.com/demos/4412-Linux/lt4412-LNX64-EL6.sh.gz')
md5sums_i686=('d355ef664488d3d9952429ff38f56a33')
md5sums_x86_64=('c5732935c5331aa0214af4b4f6b14a87')
# The 4 shell scripts are the same. All that differs is the enclosed tar.
# EL6 is newer with better 64 bit support. AIR-BAG has been included in all the
# demos but the installer isn't present. The included versions have crufty 
# names so they might not be supported any more. AIR-BAG is downloaded separately.
install="${pkgname}.install"
options=('emptydirs' '!strip')
_installfileArch='lone-tarinstall.sh'

_unpackall() {
  # Debug: unpack all packages for Total Commander diff comparison
  mkdir -p zsrc
  for _exe in lt4*.gz; do
    if [ ! -d "zsrc/${_exe}.lt" ]; then
      gunzip -dc "${_exe}" > 'lonetartmp'
      local _SKIP="$(awk '/^__ARCHIVE_FOLLOWS__/ { print NR + 1; exit 0; }' "lonetartmp")"
      (mkdir -p "zsrc/${_exe}.lt"; cd "zsrc/${_exe}.lt"; tail -n +"${_SKIP}" "../../lonetartmp" | tar -xf -)
      rm -f 'lonetartmp'
    fi
  done
  exit 1
}
#_unpackall

build() {
  set -u
  #cd "${pkgname}-${pkgver}"
  cd "${srcdir}"

  local _installfile="$(echo "lt${pkgver}-LNX"*.sh)"
  #[ -s "${_installfile}" ] || _installfile="lt${pkgver}-LNX64.sh"

  # Manual: confirm_root
  # Manual: accept_terms (prompts are not permitted in a PKGBUILD)
  # PKGBUILD: confirm_install continue_or_not is_log_a_file
  # preupgrade: lt_exists

  # decompress_tar: The installer is too screwed up to fix. We'll split and untar ourselves.
  mkdir "${srcdir}/usr"
  cd "${srcdir}/usr"
  local _SKIP="$(awk '/^__ARCHIVE_FOLLOWS__/ { print NR + 1; exit 0; }' "${srcdir}/${_installfile}")"
  # Why do they use tar -v >/dev/null ? How about we just leave the -v off?
  tail -n +"${_SKIP}" "${srcdir}/${_installfile}" | tar -xf -
  cd "${srcdir}"
  head -n "$((${_SKIP}-2))" "${_installfile}" > "${_installfileArch}"
  # Debug: We make a copy to diff with Total Commander to ensure that we haven't made any unwanted changes
  # cp -p "${_installfileArch}" "${_installfileArch//\.sh/2.sh}"

  # The permissions on these files are horrendous. Some are corrected in the installers but I don't trust them to fix all.
  # Shell scripts starting with : instead of #!/bin/sh confuse file--and me too!
  # I tried dash but some sh scripts aren't compatible. The Linux version was clearly developed with bash.
  sed -i -e 's|^:$|#!/bin/sh|g' $(grep -rl "^:$" * 2>/dev/null)
  # We fix most bad references to shells but there are some in shell-lock
  # encrypted shell scripts within that are hard coded to /usr/lone-tar/bin/bash
  # Change private bash to system bash on all the shell scripts we can read.
  sed -i -e 's|^#!/usr/lone-tar/bin/bash$|#!/usr/bin/bash|g' $(grep -rl '^#!/usr/lone-tar/bin/bash$' * 2>/dev/null)
  local _file
  for _file in $(find . -type f); do
    #echo "${_file}"
    local _pm_executable=0
    local _pm_type="`file "${_file}"`"
    local _pm_isdata="${_pm_type##*:}" # bashism
    local _pm_isdata="`echo ${_pm_isdata}`" # Trim spaces

    case "${_pm_isdata}" in
      'empty')         _pm_executable=0;;
      'ASCII text'*)   _pm_executable=0;;
      'HTML'*)         _pm_executable=0;;
      *'tar archive'*) _pm_executable=0;;
      *'ELF '*)        _pm_executable=1;;
      #*'compressed data'*) _pm_executable=0;;
      *' batch '*)     _pm_executable=1;;
      *' source, '*)   _pm_executable=0;;
      #'BBx '*) _pm_executable=0;;
      *'POSIX shell script'*) _pm_executable=1;;
      *executable*)    _pm_executable=1;;
      *) echo "${_pm_isdata}: ${_file}";;
    esac

    if [ "${_pm_executable}" -eq 0 ]; then
      chmod 644 "${_file}"
    else
      chmod 755 "${_file}"
    fi
  done

  # Replace their mostly 32 bit executables with the real ones. A few were 
  # replaced in linux_setup. Packages eliminate the need for supplying 
  # these crufty old utilities. Why make copies? We softlink so the 
  # lone-tar utilities update as the system updates.
  # Cdrecord 2.00.3, Lynx Version 2.8.8rel.2, md5sum (GNU coreutils) 8.23
  # GNU Wget 1.16.3, sort (textutils) 2.0.21
  local _exe
  for _exe in 'bash' 'cdrecord' 'lynx' 'md5sum' 'wget' 'ftp'; do # left out 'sort'. The SCO install doesn't provide a sort.
    ln -sf "/usr/bin/${_exe}" "${srcdir}/usr/lone-tar/bin/${_exe}"
  done
  # Looks like they supply multiple versions of the same tool then detect
  # which runs on the target OS. We'll just overwrite them all. The package is
  # smaller and the first one tried always works. Neither supplied version of
  # lt.dvdformat* runs on Arch due to improper lib files.
  ln -sf '/usr/bin/growisofs' "${srcdir}/usr/lone-tar/bin/lt.dvd2" # growisofs v7.0
  ln -sf '/usr/bin/growisofs' "${srcdir}/usr/lone-tar/bin/lt.dvd3" # They forgot one. Links are cheap and CD/DVD are mostly useless for a backup medium.
  ln -sf '/usr/bin/growisofs' "${srcdir}/usr/lone-tar/bin/lt.dvd4" # growisofs v5.21
  ln -sf '/usr/bin/gawk' "${srcdir}/usr/lone-tar/mawk" # GNU Awk 4.1.2
  ln -sf '/usr/bin/gawk' "${srcdir}/usr/lone-tar/gawk" # GNU Awk 4.1.2
  ln -sf '/usr/bin/dvd+rw-format' "${srcdir}/usr/lone-tar/bin/lt.dvdformat2" # version 4.10 libstdc++-libc6.2-2.so.3 (bad lib reference)
  ln -sf '/usr/bin/dvd+rw-format' "${srcdir}/usr/lone-tar/bin/lt.dvdformat3" # version 4.10 libstdc++.so.5 (too old)

  rm -rf "${srcdir}/usr/lone-tar"/ab*tar* # Big files that bloat the package and are no use for Arch.
  rm -f "${srcdir}/usr/lone-tar/mk_ab.older.v24" # It's big and it crashes on Linux 4.0. Let's save space and guarantee that it can't run!
  chmod 644 "${srcdir}/usr/lone-tar/showstar" # This is so old that I don't think it works on any of the platforms they've supported within the last 10 years.
  chmod 644 "${srcdir}/usr/lone-tar/"{vback,vrestore} # These are incorrectly compiled and can't work on any of their supported platforms. They probably haven't noticed because so few customers need them.
  # rm -f "${srcdir}/usr/lone-tar/ENV" # replaced by ltar.cfg (nope, it's used by .profile though I'm not sure .profile is ever used.)
  rm -f "${srcdir}/usr/lone-tar/rr_fd2hd" # AIR-BAG replaced RESCUE-RANGER 04-21-2010

  # The parts of the installer that could be used in PKGBUILD are easier to 
  # duplicate than to fix. This wouldn't be a problem if they'd make a package 
  # for their supported OS rather than running an installer, a technique that
  # fortunately is dying along with all the OS that don't do packages. 
  # Packages are the way forwards. No more slow and ultra complicated scripts 
  # that try to self support every OS. No more complex manual Install
  # sequences. Imagine the reduction in support costs as the
  # package installs all the right support tools and makes the right changes 
  # appropriate for each OS. Just install package and run... so easy that
  # you no longer need to limit the product to just a few platforms.
  # Then when making packages isn't quite so difficult, skilled distro packagers
  # will help make packages for smaller distros.
  sed -i -e '# Keep your /etc trash out of my path, you and all the junk OS that do that!' \
         -e 's:^\[ [! ] -d "/usr/5bin" \]:# &:g' \
         -e "# Plug a security leak. I know that 666/777 isn't needed because some utils use umask 0077 and backup runs as root" \
         -e 's:^umask 0000$:umask 0022:g' \
         -e '# The code that needed to cd anywhere has long been disabled' \
         -e 's:^cd /tmp$:#&:g' \
         -e 's:^\(\s\+\)\(cd /usr\s*\)$:\1#\2:g' \
         -e '# Clearing the screen is rude' \
         -e 's:^clear$:#&:g' \
         -e '# This lets us call any parts in any order from the install' \
         -e 's:^confirm_root$:if [ "$1" = "pkginstall" ]; then\n  shift\n  while [ "$#" -ne 0 ]; do\n     $1\n     shift\n  done\n  exit 0\nfi\nclear\n&:g' \
         -e '# We redid all all but the last few' \
         -e 's:^confirm_install$:# &:g' \
         -e 's:^continue_or_not$:# &:g' \
         -e 's:^lt_exists$:# &:g' \
         -e 's:^decompress_tar[^(]*$:# &:g' \
         -e 's:^check_migrate[^(]*$:# &:g' \
         -e 's:^move_ENV[^(]*$:# &:g' \
         -e 's:^is_log_a_file$:# &:g' \
         -e 's:^\(\s\+\)\(mv_lonetar_to_bin.*\)$:\1# \2:g' \
         -e 's:^\(\s\+\)\(link_lonetar_to_fd.*\)$:\1# \2:g' \
         -e 's:^\(\s\+\)\(mv_vfiles.*\)$:\1# \2:g' \
         -e 's:^reorg_lonetar[^(]*$:# &:g' \
         -e 's:^check_rr[^(]*$:# &:g' \
         -e 's:^check_LTX[^(]*$:# &:g' \
         -e 's:^create_menu_links[^(]*$:# &:g' \
         -e 's:^linux_setup[^(]*$:# &:g' \
         -e 's:^freebsd_setup[^(]*$:# &:g' \
         -e 's:^check_compress[^(]*$:# &:g' \
         -e 's:^check_ab_init[^(]*$:# &:g' \
         -e "# We'll leave the device setup in the manual installer which is highly interactive and a good excuse to view the license agreement" \
         -e '# Let them into ltmenu after a successful run of lone-tarinstall.sh' \
         -e 's:^say_goodbye$:&\nln -sf "/usr/lone-tar/ltmenu" "/usr/bin/ltmenu"\nchmod 644 "/usr/lone-tar/ltar.dev"\nif [ -f "/usr/lone-tar/ltar.dev" -a -f "/usr/lone-tar/ltar.dev.prev" ] \&\& [ "$(md5sum < "/usr/lone-tar/ltar.dev")" = "$(md5sum < "/usr/lone-tar/ltar.dev.prev")" ]; then\n  rm -f "/usr/lone-tar/ltar.dev.prev"\nfi\n:g' \
         -e '# Fix for kernels later than 2.6' \
         -e 's:^\(\s\+\)\(UNAMECHK=".*\)$:\1UNAMECHK="4.0" # \2:g' \
         -e '# Switch the exclude from RPM cache to the pacman cache' \
         -e 's:^\(\s\+\)\(echo "\./var/lib/rpm/"\)\(.*\)$:\1echo "./var/cache/pacman/pkg/"\3 # \2:g' \
         -e '# disable some commands in reorg_lonetar though it ended up being totally useless and done in pieces' \
         -e "# this file doesn't even exist any more" \
         -e 's|cp ${LTARDIR}/etc.default|: # &|g' \
         -e '# Already done much better down in package()' \
         -e 's|cp /bin/bash ${LTARDIR}/bin/|: # &|g' \
         -e 's|cp $FTPLOC ${LTARDIR}/|: # &|g' \
         -e 's:\swhich growisofs: false #&:g' \
         -e 's:\swhich cdrecord: false #&:g' \
         -e "# Smooth out the upgrade process. This doesn't look well tested!" \
         -e "# A second upgrade can't overwrite the backup folder. When upgrades are done right there's no reason to back the whole folder up." \
         -e 's:^\(\s\+\)\(cp -Rf ${LTAR_HOME}\):\1 echo >/dev/null \2:g' \
         -e '# Backing up the binary makes no sense' \
         -e 's:^\(\s\+\)\(mv /bin/lone-tar \${LTAR_HOME}\):\1 echo >/dev/null \2:g' \
         -e "# Migrate destroys your devices but doesn't reimport them. Again, this seems poorly tested" \
         -e '# s:^\(\s\+\)\(mv \${LTAR_HOME}/ltar\.dev\):\1 echo >/dev/null \2:g' \
         -e '# Fix a misleading message' \
         -e 's:\(Importing\) \(LONE-TAR Settings\):\1 (migrating) \2:g' \
    "${_installfileArch}"

  sed -i -e "# More PATH /etc trash! Hopefully the shell-lock shell scripts don't have this junk." \
         -e 's|:/etc:|:|g' \
    "${srcdir}/usr/lone-tar/.profile"

  sed -i -e "# Yet more PATH /etc trash!" \
         -e 's|^\(\s\+PATH=.*\):/etc"$|\1"|g' \
    "${srcdir}/usr/lone-tar/"{lt.out,lt.in}

  sed -i -e '# Eliminate a confusing screen full of errors when non root tries ltmenu. How many support calls has this caused?' \
         -e 's:^. /usr/lone-tar/ltar.cfg$:if [ "${EUID}" -ne 0 ]; then\n  echo "Must be root for Lone-tar menu"\nexit 1\nfi\n&:g' \
      "${srcdir}/usr/lone-tar/ltmenu"

  # check_compress and other config fixes
  sed -i -e "# use gzip as bzip2 is too slow. I might switch to bzip when I verify that lone-tar doesn't hog more than one processor" \
         -e '# This compression option might not matter. gzip vs bzip2 is selected for each device.' \
         -e 's:^\(COMPRESS_LOGS_CMD="\)[^"]*\(".\+\)$:\1/usr/bin/gzip\2:g' \
         -e '# fix another errant tmp folder.' \
         -e 's:^\(SORT_TMP="\)[^"]*\(".\+\)$:\1/tmp\2:g' \
         -e '# change the tape controller to mt-st' \
         -e 's:"/bin/mt:"/usr/bin/mt-st:g' \
         -e "# Looks like ENV is no longer used in preference to ltar.cfg but we'll fix it too" \
    "${srcdir}/usr/lone-tar/"{ltar.cfg,ENV,ltar_before}

  # Seems like it would be hard to answer support questions when the software 
  # won't say what it's running on.
  sed -i -e '# Branding, spaces: 16...12 - 14/2 "for Arch Linux"' \
         -e 's:^\(\s\+\${b1} \${b2}\)\s\+\(LONE-TAR(tm) v\${MenuVersion}\)\s\+\(\${b1} ${b2}\)$:\1       \2for Arch Linux       \3:g' \
    "${srcdir}/usr/lone-tar/lt_functions"

  # Bring some sanity to the upgrade system. Unlike other platforms that 
  # Install once and forget, Arch users expect seamless upgrades and will
  # exercise them. These pacdef files will allow us to delete files to be
  # backed up if we detect they haven't changed.
  # Skipped ltar.dev Serial_Number LICENSE Version
  local _sane
  for _sane in 'ENV' 'ltar.cfg' 'select.S.menu' 'create_dow' 'ltar_chdir' 'create_si' 'ltar_before' 'ltar_after' 'robotics' 'change_slot' 'logoff_cron' 'logoff_menu'; do
    cp -p "${srcdir}/usr/lone-tar/${_sane}" "${srcdir}/usr/lone-tar/${_sane}.pacdef"
  done
  # Review tss.out after first ltmenu run to see if we got everything.
  set +u
}

package() {
  #cd "${pkgname}-${pkgver}"
  set -u
  cd "${srcdir}"

  # Install: check_migrate move_ENV=ltar.cfg determine_flavor

  # reorg_lonetar:
  # etc.default doesn't seem to exist. I found it on SCO. It seems to contain defaults for tape devices.
  # install -Dm755 "${srcdir}/usr/lone-tar/etc.default" "${pkgdir}/etc/default/ltar"
  #install -dm755 "${pkgdir}/usr/bin"
  # Place the modified installer so the user can complete all the Manual steps
  install -Dm755 "${srcdir}/${_installfileArch}" "${pkgdir}/usr/bin/${_installfileArch}"
  # mv_lonetar_to_bin (we'll link instead of move)
  ln -sf '/usr/lone-tar/lone-tar' "${pkgdir}/usr/bin/lone-tar"
  #install -dm755 "${pkgdir}/usr"
  cp -pr "${srcdir}/usr/lone-tar" "${pkgdir}/usr/"

  # reorg_lonetar-mv_vfiles (these two programs don't work)
  install -dm755 "${pkgdir}/usr/lib/lone-tar/BACKUPS.DIR" # The installer doesn't create a BACKUPS.DIR but lone-tar expects it. The SCO install doesn't have a BACKUPS.DIR.
  # The SCO install copies these into /usr/lib
  mv "${pkgdir}/usr/lone-tar/"{vback,vrestore} "${pkgdir}/usr/lib/lone-tar"

  # Skipped: check_rr (AIR-BAG not installed, RESCUE-RANGER not available for Linux)
  # Skipped: check_LTX (looks like X support, not in demo package)

  # create_menu_links:
  local _exe
  for _exe in 'ltmenu' 'tapetell' 'bin/ck_license'; do
    ln -s "/usr/lone-tar/${_exe}" "${pkgdir}/usr/bin/$(basename "${_exe}")"
  done
  # We'll force them to run lone-tarInstall.sh.
  rm -f "${pkgdir}/usr/bin/ltmenu"
  cat > "${pkgdir}/usr/bin/ltmenu" << EOF
#!/bin/sh
# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/
#
echo 'Welcome to Lone-tar for Arch Linux'
echo 'Run lone-tarinstall.sh as root to complete your install/upgrade.'
echo 'You can peform device setup there or in ltmenu.'
echo ''
echo 'Continue your install with the PDF from Cactus online:'
echo '  Quick Start Guide - Linux - Lone Star Software Corp.'
echo 'Glance through the early instructions and start at'
echo '  5.3. Adding a new backup device.'
echo ''
echo 'For more information see:'
echo 'http://www.cactus.com/'
echo 'Support, Documentation'
EOF
  chmod 755 "${pkgdir}/usr/bin/ltmenu"

  # Install: linux_setup
  # Skipped: freebsd_setup

  # Another hard coded folder, boo hiss!
  install -dm755 "${pkgdir}/log/list.dir"
  install -dm755 "${pkgdir}/log/backup_gosh.dir"
  # The installer creates all files and folders umask 0000. What a security leak.

  # Manual: check_devices cleanup_lt (this is very interactive and lets us push the user through the agreement)
  # Skipped: check_ab_init (tar is present but init script isn't in demo package. If the quality is anything like these scripts we'd need to rebuild the whole thing anyways for something Arch users don't have any use for.)
  # Manual: say_goodbye
  set +u
}
set +u
