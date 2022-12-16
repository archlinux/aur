# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# https://github.com/fukawi2/aur-packages

# The Basic and Remote configurations are included. Some folders have been changed to
# align with current methods.
# http://wiki.zmanda.com/index.php/GSWA/Build_a_Basic_Configuration

# Online guide for a single tape drive.
# http://www.resolveradiologic.com/blog/2017/01/16/how-to-set-up-amanda-to-backup-to-tape-in-ubuntu/
# Don't add your tape drive to the existing file. An upgrade will overwrite it and disappear.
#   Add it to /etc/amanda/TestConfig/tapetypes and add an includefile to amanda.conf

# http://blog.learnadmin.com/2010/07/install-and-configure-amanda-backup.html

# More guides using the old fashioned configuration method
# http://fedoranews.org/ghenry/amanda/
# http://blog.secaserver.com/2012/09/centos-install-configure-amanda-backup-server/
# https://wiki.centos.org/HowTos/AmandaBackups
# https://www.novell.com/coolsolutions/feature/18050.html

# If your backup is not working, see if these demos work before reporting. You can also set some
# values back to legacy.

# If you want to run amanda as a different user and/or group, change these
# variables before running makepkg
# Do not use existing users or groups like daemon or nobody. They will be altered then removed.
# These can be changed between upgrades. You must recompile for the change to take effect.
# Changing while a backup is running will cause problems.
_amandauser='amandabackup' # formerly amanda, too likely to collide with a real Amanda
_amandagroup='amandabackup'
_amandauid='112'
_amandagid='112'

# Changing this requires a manual change to auth in amanda.conf
_opt_bsd=''  # '' for none, 'tcp' or 'udp'. ssh is always available

# The am helper utilities assume that the home folder is the same on all computers
_amhome='/var/lib/amanda'
#_amhome='/var/amanda' # legacy

# Don't change any of the following settings between upgrades
_ametc='/etc/amanda' # changing this to /etc will destroy your /etc folder
#_amsecurity="${_ametc}/amanda-security.conf" # legacy, not compatible with amserverconfig
_amsecurity='/etc/amanda-security.conf'

_amdump='/dumps' # Always in /, or at least outside of any folder you would want to back up.

_amlibexec='/usr/lib'
#_amlibexec='/usr/libexec' # legacy, not liked by namcap, Arch does not use this folder

_amlog='/var/log/amanda'
# /var/cache/amanda is only mentioned in help files

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

set -u
pkgname='amanda'
#pkgver='3.3.9'
pkgver='3.5.2'
pkgrel='1'
pkgdesc='Advanced Maryland Automatic Network Disk Archiver network backup for Linux Windows clients, supports SSH, AES, GPG, encryption, tape, RAIT, mirror, changers, Amazon S3, ipv6, DVD, NDMP, VTL, advanced scripting'
arch=('i686' 'x86_64')
url='http://www.amanda.org'
license=('custom' 'GPL')
depends=('perl>=5.6.0' 'glib2>=2.2.0' 'gawk' 'tar>=1.12' 'gzip' 'curl>=7.10' 'openssl' 'openssh' 'cron' 'libarchive' 'readline' 'netcat' 'bash')
# perl-module-scandeps: cd pkg; scandeps.pl $(grep -lR '/usr/bin/perl' .) | sort -u | grep -v "^'Amanda::"
depends+=(
  'perl-encode-locale'
  'perl-io-socket-ssl'
  'perl-json'
  'perl-net-ssleay'
  'perl-uri'
  'perl-xml-namespacesupport'
  'perl-xml-parser'
  'perl-xml-sax'
  'perl-xml-simple'
  ## from CentOS 3.3.9 install https://linoxide.com/tools/setup-centralized-backup-server-amanda-centos-7/
  # I can't find any reference to the non builtins. Maybe for old versions.
  #'perl-business-isbn'
  #'perl-business-isbn-data'
  ##'perl-compress-raw-bzip2' # built in
  ##'perl-compress-raw-zlib'  # built in
  ##'perl-data-dumper' # built in
  ##'perl-digest' # built in
  ##'perl-digest-md5' # built in
  ##'perl-file-listing' # built in
  #'perl-html-parser'
  #'perl-html-tagset'
  #'perl-http-cookies'
  #'perl-http-daemon'
  #'perl-http-date'
  #'perl-http-message'
  #'perl-http-negotiate'
  #?'perl-io-compress'
  #'perl-io-html'
  #?'perl-io-socket-ip'
  #'perl-lwp-mediatypes'
  #'perl-net-http'
  #'perl-net-libidn'
  #'perl-timedate'
  #'perl-www-robotrules'
  #'perl-xml-sax-base'
  #'perl-libwww' # perl-libwww-perl
  # From manual install
  #'perl-extutils-embed' # developers only
)
depends+=('libtirpc') # 0000-fedora-patch-tirpc.patch
optdepends=(
  'sudo: run commands as amanda user'
  'gnuplot: amplot pictures'
  'dump: creating backups in dump format'
  'samba: backing up Windows hosts'
  'pigz: parallel gzip compression for dumptype'
  'bzip2: better compression for dumptype'
  'xz: better compression for dumptype'
  'ncompress: LZW .Z compression'
  'gnupg: amcrypt encryption'
  'aespipe: amcrypt encryption'
  'sharutils: uuencode for amcrypt encryption'
  'mt-st-git: manual tape drive control for blocksize, testing, and restore' # some tape drive support is built in
  'mtx-svn: advanced tape autoloader support' # some changer support is built in
  'cups: printed reports'
  'mailx: email notifications'
  #'git: taper transfer' # does not seem to be current
  #'svn: ' # lots of references but no action
  'xfsdump: direct XFS backup with xfsdump xfsrestore' # This is why amanda needs to be in the disk group
  'dump: direct EXT backup with dump restore' # see sendsize.c for the OS of various dump programs
)
# grep 'checking for' config.log | cut -d' ' -f2- | sort -u | grep -v '\.h$'
makedepends=('swig' 'grep' 'splint' 'gettext' 'sed') # swig is for developers only
makedepends+=('rpcsvc-proto')
backup=(
  "${_amsecurity#/}"
  "${_amhome#/}/.amandahosts"
  "${_ametc#/}/MyConfig/amanda.conf" # Assume that many users will build from the demo configuration
  "${_ametc#/}/MyConfig/disklist"
)
options=('!strip')
install="${pkgname}.install"
_tapetypes=('tapetypes.txt')
#_verwatch=('http://www.amanda.org/download.php' '\([0-9\.]\+\)' 't')
#_srcdir="${pkgname}-${pkgver}"
source=(
  #"https://prdownloads.sourceforge.net/amanda/amanda-${pkgver}.tar.gz"
  "https://cdn.zmanda.com/downloads/community/Amanda/${pkgver}/Source/amanda-tag-community-${pkgver}.tar.gz"
  "xinetd.${pkgname}".{udp,tcp}
  '0000-fedora-patch-tirpc.patch' # https://src.fedoraproject.org/rpms/amanda/tree/master
  "${_tapetypes[@]}"
  # https://bugs.gentoo.org/663182
  # https://bugs.gentoo.org/656340
  # https://fedoraproject.org/wiki/Changes/SunRPCRemoval
)
_srcdir="${source[0]##*/}"
_srcdir="${_srcdir%%.tar*}"
md5sums=('b3b3ec3f3eecbe1a38c637feecf1b922'
         '4745f45c43488f46cba00073a60d587e'
         'c42f8eb4461c1979b22761e288ff5c2e'
         '51982f3d5c6b4a367de24c7fd7b7eb16'
         'fbb84f7b778ff76759062878f413f047')
sha256sums=('812aea37d5e5ae852ab4147e989f090fb60ef66e7b7fe49ef58e2d139fe3e99f'
            '3db294c9d7c610e9c0d531dcc2725dbddf1213fad64f04bc7cf9b1b9c30e9803'
            '46446a8dc4ee8ec39ed0a3e2636fb02a198565e8111abe8392c456da56a007ce'
            'ae51f305b49bd7c94e854c2784ee4b58dabf74bc43bfe9a738d3d03322938861'
            'c368e7f9d6d1df703619476e0fcf06e841a7ec86a5a7b86dc499821fbb0a137e')

if [ ! -z "${_opt_bsd}" ]; then
  depends+=('xinetd')
  backup+=('etc/xinetd.d/amanda')
fi

# (deprecated) upstream sources require amanda user and group exist at build time
# We capture the chown commands so this is no longer needed.
# This requirement made it hard for noobs with AUR helpers to install.
_testAmandaUserGroup() {
  if ! getent group "${_amandagroup}" > /dev/null ; then
    error "The amanda group must exist prior to building."
    error "Suggested command: groupadd -g ${_amandagid} ${_amandagroup}"
    return 1
  fi
  if ! getent passwd "${_amandauser}" > /dev/null ; then
    error "The amanda user must exist prior to building."
    error "Suggested command: useradd --system -u ${_amandauid} -g ${_amandagroup} -G storage,disk -m -d ${_amhome} -s /bin/bash -c 'Amanda Backup Daemon' ${_amandauser}"
    return 2
  fi
}
unset -f _testAmandaUserGroup

# We can't modify .install but we can stop and force the user to fix it.
_install_check() {
  local _ckvar
  local _ckline
  for _ckvar in _amlibexec _amsecurity _amhome; do
    _ckline="${_ckvar}='${!_ckvar}'"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      set +u
      msg "${install} must be fixed"
      echo "${_ckline}"
      false
    fi
  done
}

prepare() {
  set -u
  cd "${_srcdir}"
  _install_check

  if [ "${_amandauid}" -ge 1000 ]; then
    echo "This package won't create UID >= 1000"
    set +u
    false
  fi

  patch -Nup1 -i "${srcdir}/0000-fedora-patch-tirpc.patch"

  # rm -r 'packaging' # cleaner path listings, crashes make
  # grep -shroe '/[a-z][a-z/]*/' | grep -e 'etc\|usr\|var' | sort -u

  # Get rid of sbin
  sed -e 's:/sbin/:/bin/:g' -i 'example/amanda.conf.in' 'example/template.d/dumptypes'

  # Lots of confusion where the amanda home folder is
  if [ "${_amhome}" != '/var/lib/amanda' ]; then
    local _amhfiles
    readarray -t _amhfiles <<<"$(grep -slire 'LOCALSTATEDIR.*/lib/amanda')"
    sed -e '/LOCALSTATEDIR/I s:/lib/amanda:'"${_amhome#/var}:g" -i "${_amhfiles[@]}"
    readarray -t _amhfiles <<<"$(grep -sliFre '/var/lib/amanda')"
    sed -e "s:/var/lib/amanda:${_amhome}:g" -i "${_amhfiles[@]}"
  fi
  local _hfiles
  readarray -t _hfiles <<<"$(grep -slrFe '/var/amanda/')"
  sed -e "s:/usr/local/var/amanda:${_amhome}:g" -e "s:/var/amanda:${_amhome}:g" -i "${_hfiles[@]}"
  readarray -t _hfiles <<<"$(grep -slrFe '/usr/local/etc/amanda')"
  sed -e "s:/usr/local/etc/amanda:${_ametc}:g" -i "${_hfiles[@]}"
  sed -e '/chg-disk/ s:/@prefix@::g' -i 'example/template.d/amanda-harddisk.conf.in'

  # Set the default auth to ssh if bsdtcp is not installed
  if [ -z "${_opt_bsd}" ]; then
    #cp -p 'server-src/amserverconfig.pl' 'server-src/amserverconfig.Arch.pl' # for diff comparison
    sed -e '/print CONF/ s:bsdtcp:ssh:g' -i 'server-src/amserverconfig.pl'
    #cp -p 'server-src/amaddclient.pl' 'server-src/amaddclient.Arch.pl'
    sed -e '/^\$auth=/ s:bsdtcp:ssh:g' -i 'server-src/amaddclient.pl'
  fi

  # Amend the tapetype file. Mark each line to be written with a >. Add a blank line after each entry.
  pushd "${srcdir}" > /dev/null
  sed -e '1i # Do not modify this file. It is overwritten on every upgrade' -i "${_srcdir}/example/template.d/tapetypes"
  echo -e "# Added by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR\n# https://aur.archlinux.org/\n" >> "${_srcdir}/example/template.d/tapetypes"
  sed -n -e 's:^>\(.*\)$:\1:p' "${_tapetypes[@]}" >> "${_srcdir}/example/template.d/tapetypes"
  popd > /dev/null

  # Fix xinetd files. Our xinetd file is fixed in package()
  sed -e "/^\s*user\s\+=/ s:amandabackup:${_amandauser}:g" \
      -e "/^\s*group\s\+=/ s:disk:${_amandagroup}:g" \
    -i 'example/xinetd.'*

  # Various fixes
  #cp -p 'example/template.d/advanced.conf.in' 'example/template.d/advanced.conf.in.Arch'
  sed -e 's:@CONFIG_DIR/:@CONFIG_DIR@/:g' \
      -e 's:DailySet1:@DEFAULT_CONFIG@:g' \
      -e '/^netusage/ s:8000 :80000 :g' \
    -i 'example/template.d/advanced.conf.in'

  set +u
}

build() {
  set -u
  #_testAmandaUserGroup
  cd "${_srcdir}"
  _install_check

  if [ ! -s 'configure' ]; then
    ./autogen
  fi
  if [ ! -s 'Makefile' ]; then
    #autoreconf # 0000-fedora-patch-tirpc.patch
    local _opts=()
    if [ ! -z "${_opt_bsd}" ]; then
      _opts+=("--with-bsd${_opt_bsd}-security")
    fi
    # There are configure flags to install only the client or server, but I don't see any reason to.
    # Amanda's handling of /etc is so broken that we must specify it 3 times and fix it in package()
    MT='/usr/bin/mt-st' \
    CFLAGS="${CFLAGS} -g -rdynamic -fcommon" \
    CXXFLAGS="${CXXFLAGS} -g -rdynamic -fcommon" \
    ./configure "${_opts[@]}" \
      --prefix='/usr' \
      --sbindir='/usr/bin' \
      --libexecdir="${_amlibexec}" \
      --sysconfdir='/etc' \
      --localstatedir='/var' \
      --with-configdir="${_ametc}" \
      --with-security-file="${_amsecurity}" \
      --with-gnutar-listdir="${_amhome}/gnutar-lists" \
      --mandir='/usr/share/man' \
      --with-user="${_amandauser}" \
      --with-group="${_amandagroup}" \
      --with-ipv6 \
      --with-ssh-security \
      --with-amandates="${_amhome}/amandates" \
      --with-tmpdir="/tmp/amandabackup-$$"
    ! grep -F $'/usr/var\n/usr/etc' 'config.log' || echo "{}"
  fi

  nice make # not using -s helps
  set +u
}

package() {
  set -u
  #_testAmandaUserGroup
  cd "${_srcdir}"
  _install_check

  # Obnoxious installer expects fakeroot. We'll capture chown & chmod commands to place them in .install
  # A beneficial side affect is that improper permissions and owership will be fixed on every install/upgrade.
  local _aminstall="${pkgdir}${_amlibexec}/amanda/amanda-install.sh"
  install -Dpm755 <(cat << EOF
#!/bin/bash

echo "  chown\$(printf ' "%s"' "\${@}")" >> '${_aminstall}'
EOF
  ) "${pkgdir}/chown"

  # Capture suid chmod, passthru normal chmod
  install -Dpm755 <(cat << EOF
#!/bin/bash

if [ "\$1" = '644' ] || [ "\$1" = '755' ]; then
  # Pass through standard chmod
  /usr/bin/chmod "\${@}"
else
  echo "  chmod\$(printf ' "%s"' "\${@}")" >> '${_aminstall}'
fi
EOF
  ) "${pkgdir}/chmod"

  # Capture commands go into this script
  install -Dpm744 <(cat << EOF
#!/bin/sh
# Created by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# This is run by the package installer which can't be modified
# to have all the current settings

set -e
set -u

# commands captured from Makefile

_fn_chown_makefile() {
EOF
  ) "${_aminstall}"

  # Install the compiled output using the PATH to capture chown/chmod commands
  PATH="${pkgdir}:${PATH}" \
  make -j1 DESTDIR="${pkgdir}" install # not using -s helps

  # This file is put in the wrong place
  if [ ! -s "${pkgdir}${_amsecurity}" ]; then
    mv "${pkgdir}/etc/amanda/${_amsecurity##*/}" "${pkgdir}${_amsecurity}"
  fi

  # Clean up capture and scripts
  rm "${pkgdir}/chown" "${pkgdir}/chmod"
  sed -e '# Trim pkgdir for .install' \
      -e "s:${pkgdir}::g" \
      -e '# Convert amanda group to var' \
      -e 's/"root:'"${_amandagroup}"'"/"root:${_amandagroup}"/g' \
    -i "${_aminstall}"
  echo -e '}\n\n# Commands from PKGBUILD\n# must run before makefile above\n\n_fn_chown_PKGBUILD() {' >> "${_aminstall}"

  # Create amanda log dir, not much used
  install -dm0770 "${pkgdir}${_amlog}/"
  echo '  chmod 770 "${_amlog}"' >> "${_aminstall}"
  echo '  chown "root:${_amandagroup}" "${_amlog}"' >> "${_aminstall}"

  # Create amanda home dir
  install -dm0700 "${pkgdir}${_amhome}/"
  echo '  chmod 700 "${_amhome}"' >> "${_aminstall}"
  install -dm0700 "${pkgdir}${_amhome}/.ssh/"
  echo '  chmod 700 "${_amhome}/.ssh/"' >> "${_aminstall}"
  echo '  find "${_amhome}/.ssh" -type "f" -exec chmod 600 "{}" "+"' >> "${_aminstall}"

  # Set permission on config folders
  install -dm0755 "${pkgdir}${_ametc}"
  install -dm0750 "${pkgdir}${_ametc}/MyConfig"
  if [ "${_ametc}" = '/etc' ] || [ "${_ametc}" = '/etc/' ]; then
    echo 'The folder specified for ${_ametc} will destroy the system! Cant build package!'
    set +u
    false
  else
    echo '  find "${_ametc}" -mindepth 1 -maxdepth 1 -type "d" -exec chown -R "${_amandauser}:${_amandagroup}" "{}" ";" -exec chmod 750 "{}" ";"' >> "${_aminstall}"
  fi
  echo '  chown "root:${_amandagroup}" "${_ametc}"' >> "${_aminstall}"
  echo '  chown "root:root" "${_amsecurity}"' >> "${_aminstall}"
  echo '  chmod 644 "${_amsecurity}"' >> "${_aminstall}"
  ln -s '/usr/share/amanda/example/' "${pkgdir}${_ametc}/example"
  ln -s '/usr/share/amanda/example/' "${pkgdir}${_amhome}/example"
  ln -s '/usr/share/amanda/template.d/' "${pkgdir}${_ametc}/template.d"
  ln -s '/usr/share/amanda/template.d/' "${pkgdir}${_amhome}/template.d"

  # If amanda-security.conf is placed in /etc/amanda then we must use
  # a more restrictive permissions setup and a helper script to create
  # the folder. amserverconfig doesn't work. A better way was found so
  # this isn't used any more. It documents how it could be done.
  local _helpertext=''
  if [ "${_amsecurity#/etc/amanda/}" != "${_amsecurity}" ]; then
    echo '  chmod 755 "${_ametc}"' >> "${_aminstall}"
    _helpertext=" with ${_ametc}/mkconfig.sh"
    install -Dm755 <(cat << EOF
#!/bin/bash
# Created by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# This file is necessary because there are no permissions that will allow
# Amanda to backup and also allow Amanda to create folders here.

set -e
set -u

if [ "\$#" -eq 0 ] || [ "\${EUID}" -ne 0 ]; then
  echo "Example: sudo ./mkconfig.sh MyConfig"
  echo "This will create or fix the specified config folder with correct permissions"
  echo "for the Amanda user"
else
  while [ "\$#" -ne 0 ]; do
    mkdir "${_ametc}/\$1" || :
    chmod 750 "${_ametc}/\$1"
    chown -R "${_amandauser}:${_amandagroup}" "${_ametc}/\$1"
    shift
  done
fi
EOF
    ) "${pkgdir}${_ametc}/mkconfig.sh"
  else
    echo '  chmod 775 "${_ametc}"' >> "${_aminstall}"
    chmod 775 "${pkgdir}${_ametc}"
    _helpertext=" with amserverconfig"
  fi

  # Install xinetd configuration
  if [ ! -z "${_opt_bsd}" ]; then
    install -Dpm0644 "${srcdir}/xinetd.amanda.${_opt_bsd}" "${pkgdir}/etc/xinetd.d/${pkgname}"
    pushd "${srcdir}" >> /dev/null
    local _xinetd
    for _xinetd in "xinetd.${pkgname}".*; do
      install -Dpm0644 "${_xinetd}" "${pkgdir}/etc/xinetd.d/${_xinetd#xinetd\.}"
    done
    popd > /dev/null
    sed -e "/^\s*user\s\+=/ s:amanda:${_amandauser}:g" \
        -e "/^\s*group\s\+=/ s:storage:${_amandagroup}:g" \
        -e "/^\s*server\s\+=/ s:/usr/libexec:${_amlibexec}:g" \
      -i "${pkgdir}/etc/xinetd.d/${pkgname}"*
  fi
  # Can't put ${pkgver} on this one
  install -Dm0600 <(cat << EOT
# Created by ${pkgname} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# http://wiki.zmanda.com/index.php/How_To:Configure_bsdtcp_authentication

# This is where amanda works out what remote connections to allow in the format
# of <host> <username> <command>
#
# server1.example.com   amanda  amdump
EOT
  ) "${pkgdir}/${_amhome}/.amandahosts"
  echo '  chmod 600 "${_amhome}/.amandahosts"' >> "${_aminstall}"

  # create some of the runtime files amanda requires so they are created with
  # the correct ownership and permissions.
  install -Dm0664 /dev/null "${pkgdir}${_amhome}/amandates" # https://wiki.zmanda.com/index.php/Amanda:What_is_the_%27amandates%27_file_for%3F
  #install -Dm0664 /dev/null "${pkgdir}${_amhome}/dumpdates"
  install -dm755 "${pkgdir}${_amhome}/gnutar-lists"
  echo '  chown -R "${_amandauser}:${_amandagroup}" "${_amhome}"' >> "${_aminstall}"

  # Prevent non amanda users from running these and causing unexpected errors.
  # These chmod must be run after the ones from makefile so they take precedence
  set +u; msg 'Fixing executable permissions'; set -u
  local _amps
  pushd "${pkgdir}/usr/bin" > /dev/null
  readarray -t _amps <<<"$(find -mindepth 1 -maxdepth 1 -type 'f' -perm /111)"
  chmod 754 "${_amps[@]}"
  popd > /dev/null
  local _amprogs="${_amps[*]#\./}"
  echo "${_amprogs}"
  _amprogs="${_amprogs// /,}"
  echo '  chown "root:${_amandagroup}" "/usr/bin"'"/{${_amprogs}}" >> "${_aminstall}"
  echo '  chmod 754 "/usr/bin"'"/{${_amprogs}}" >> "${_aminstall}"

  # Set up Wiki local demo to check with sudo -u 'amandabackup' amcheck 'MyConfig'
  install -dm0750 "${pkgdir}${_amdump}"
  install -dm0755 "${pkgdir}${_amhome}/holdings/MyConfig"
  install -dm0755 "${pkgdir}${_amhome}/vtapes/MyConfig"/slot{1,2,3,4}
  install -dm0755 "${pkgdir}${_ametc}/MyConfig"/{curinfo,index}
  echo '  chown -R "${_amandauser}:${_amandagroup}" "${_amdump}"' >> "${_aminstall}"
  # Using pkgver in files that are backed up would trigger .pacnew constantly
  install -Dm0640 <(cat << EOF
# Created by ${pkgname} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# You can extend this to be your backup.
# It would be better to create another backup${_helpertext}
# and let this stay a demo.

# Local backup demo
# http://wiki.zmanda.com/index.php/GSWA/Build_a_Basic_Configuration

# The Wiki has old folder names. The folders here match what the amanda programs use.

# Examples: /usr/share/amanda/template.d/

org "MyConfig"
infofile "${_ametc}/MyConfig/curinfo"
logdir "${_ametc}/MyConfig"
indexdir "${_ametc}/MyConfig/index"
dumpuser "${_amandauser}"

tpchanger "chg-disk:${_amhome}/vtapes/MyConfig"
labelstr "MyData[0-9][0-9]"
autolabel "MyData%%" EMPTY VOLUME_ERROR
tapecycle 4
dumpcycle 3 days
amrecover_changer "changer"

tapetype "TEST-TAPE"
define tapetype TEST-TAPE {
  length 100 mbytes
  filemark 4 kbytes
}

define dumptype simple-gnutar-local {
    auth "local"
    compress none
    program "GNUTAR"
}

holdingdisk hd1 {
    directory "${_amhome}/holdings/MyConfig"
    use 50 mbytes
    chunksize 1 mbyte
}

# Remote backup demo
# This requires some ssh key management. See Wiki.
# http://wiki.zmanda.com/index.php/GSWA/Backing_Up_Other_Systems

# see disklist for the matching line to enable
#define dumptype simple-gnutar-remote {
#    auth "ssh"
#    ssh_keys "/etc/amanda/MyConfig/ssh-key"
#    compress none
#    program "GNUTAR"
#}
EOF
  ) "${pkgdir}${_ametc}/MyConfig/amanda.conf"
  install -Dm0640 <(cat << EOF
# Created by ${pkgname} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# Local backup demo
# http://wiki.zmanda.com/index.php/GSWA/Build_a_Basic_Configuration

localhost /etc simple-gnutar-local

# Remote backup demo
# http://wiki.zmanda.com/index.php/GSWA/Backing_Up_Other_Systems

# see amanda.conf for the matching lines to enable
# euclid.amanda.org /etc simple-gnutar-remote
EOF
  ) "${pkgdir}${_ametc}/MyConfig/disklist"

  # List of backup items for _aminstall
  local _pacsavea=("${backup[@]/#/\/}")
  _pacsavea=("${_pacsavea[@]/%/.pacsave}")
  local _pacsave="$(printf " '%s'" "${_pacsavea[@]}")"

  # Finish _aminstall
  cat >> "${_aminstall}" << EOF
}

_fn_post_install() {
  echo "Test the system with"
  echo "  sudo -u '\${_amandauser}' amcheck 'MyConfig'"
  echo "  su -c \"su \${_amandauser} -c 'amcheck MyConfig'\""
}

_fn_post_upins() {
  if [ -z "\$(getent group "\${_amandagroup}")" ]; then
    groupadd -g "\${_amandagid}" "\${_amandagroup}"
    echo "amanda: Group \${_amandagroup} \${_amandagid} added"
  fi
  if [ -z "\$(getent passwd "\${_amandauser}")" ]; then
    # Amanda is in the disk group so it can image drives using xfsrestore and other tools
    useradd -u "\${_amandauid}" -g "\${_amandagroup}" -G "storage,disk" -m -d "\${_amhome}" -s '/bin/bash' -c 'Amanda Backup Daemon' "\${_amandauser}"
    echo "amanda: User \${_amandauser} \${_amandauid} added"
  fi
  if ! grep -q '^[a-z]\+tar:' "\${_amsecurity}"; then
    echo "amanda warning: no archivers are enabled in \${_amsecurity}"
  fi
  rm -f '/usr/bin/amanda-uninstall.sh'
}

_fn_pre_remove() {
  set -u
  local _uid
  _uid="\$(id -u "\${_amandauser}")"
  if [ \$? -eq 0 ]; then
    if [ "\${_uid}" -lt 1000 ]; then
      userdel "\${_amandauser}" || :
      echo "amanda: User \${_amandauser} deleted"
      # Mysteriously, userdel also removes the group making groupdel fail
      groupdel "\${_amandagroup}" 2>/dev/null || :
      echo "amanda: Group \${_amandagroup} deleted"
    else
      echo "uid of amanda is \${_uid}, >=1000, can't delete"
    fi
  fi
  set +u
}

_fn_post_remove() {
  local _cmd='#!/bin/sh
_true=""
if [ "\${EUID}" -ne 0 ]; then
  echo "This must be run as root"
  echo "You may want to look through the folders to be deleted for anything valuable"
  _true="true"
else
  echo "This is likely to destroy backup configurations, encryption keys, and ssh keys."
fi
_delself=1
'
  rm -f '/usr/bin/amanda-uninstall.sh'
  local _file
  for _file in${_pacsave}; do
    if [ -f "\${_file}" ]; then
      echo -n "\${_cmd}" >> '/usr/bin/amanda-uninstall.sh'; _cmd=''
      echo "echo rm -f '\${_file}'" >> '/usr/bin/amanda-uninstall.sh'
      echo '\${_true} '"rm -i '\${_file}'" >> '/usr/bin/amanda-uninstall.sh'
      echo "if [ -f '\${_file}' ]; then" >> '/usr/bin/amanda-uninstall.sh'
      echo '  _delself=0' >> '/usr/bin/amanda-uninstall.sh'
      echo 'fi' >> '/usr/bin/amanda-uninstall.sh'
    fi
  done

  local _folder
  for _folder in "\${_amhome}" "\${_ametc}" "\${_amdump}" "\${_amlog}"; do
    if [ -d "\${_folder}" ]; then
      echo -n "\${_cmd}" >> '/usr/bin/amanda-uninstall.sh'; _cmd=''
      echo "echo rm -r '\${_folder}'" >> '/usr/bin/amanda-uninstall.sh'
      echo '\${_true} '"rm -I -r '\${_folder}'" >> '/usr/bin/amanda-uninstall.sh'
      echo "if [ -d '\${_folder}' ]; then" >> '/usr/bin/amanda-uninstall.sh'
      echo '  _delself=0' >> '/usr/bin/amanda-uninstall.sh'
      echo 'fi' >> '/usr/bin/amanda-uninstall.sh'
    fi
  done

  if [ -s '/usr/bin/amanda-uninstall.sh' ]; then
    chmod 755 '/usr/bin/amanda-uninstall.sh'
    echo 'if [ "\${_delself}" -ne 0 ]; then' >> '/usr/bin/amanda-uninstall.sh'
    echo '  \${_true} '"echo 'Amanda folders removed'" >> '/usr/bin/amanda-uninstall.sh'
    echo '  \${_true} '"echo 'Amanda uninstaller removed'" >> '/usr/bin/amanda-uninstall.sh'
    echo '  \${_true} rm -f "\$0"' >> '/usr/bin/amanda-uninstall.sh'
    echo 'fi' >> '/usr/bin/amanda-uninstall.sh'
    echo "amanda: use '/usr/bin/amanda-uninstall.sh' to remove all Amanda config files and folders"
  fi
}

# Vars from PKGBUILD
# The .install sets a flag to bypass the functions and source the desired variables for upgrades

if [ ! -z "\${_GetOVars:-}" ]; then
  # These variables are from before the upgrade
  \${_GetOLocal:=declare} _Oamandauser='${_amandauser}'
  \${_GetOLocal} _Oamandagroup='${_amandagroup}'
  \${_GetOLocal} _Oamandauid='${_amandauid}'
  \${_GetOLocal} _Oamandagid='${_amandagid}'
  \${_GetOLocal} _Oamhome='${_amhome}'
  \${_GetOLocal} _Oametc='${_ametc}'
  \${_GetOLocal} _Oamdump='${_amdump}'
  \${_GetOLocal} _Oamsecurity='${_amsecurity}'
  \${_GetOLocal} _Oamlog='${_amlog}'
else
  # These variables are from after the upgrade
  \${_GetOLocal:=declare} _amandauser='${_amandauser}'
  \${_GetOLocal} _amandagroup='${_amandagroup}'
  \${_GetOLocal} _amandauid='${_amandauid}'
  \${_GetOLocal} _amandagid='${_amandagid}'
  \${_GetOLocal} _amhome='${_amhome}'
  \${_GetOLocal} _ametc='${_ametc}'
  \${_GetOLocal} _amdump='${_amdump}'
  \${_GetOLocal} _amsecurity='${_amsecurity}'
  \${_GetOLocal} _amlog='${_amlog}'

  if [ -z "\${_GetVars:-}" ]; then
    if [ "\$#" -eq 0 ]; then
      echo 'The package installer runs this, not you!'
      echo 'Nothing to see here, Move along!'
    else
      while [ "\$#" -gt 0 ]; do
        _fn_\$1
        shift
      done
    fi
  fi
fi
EOF

  # Install the licence
  install -Dpm444 'COPYRIGHT' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
