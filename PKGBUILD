# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# Note: These TODO may not be things I'm planning to fix. Some of them are just
# notes to be fixed by someone else who wants that functionality and warnings
# to those who are expecting that functionality. The HylaFAX+ and AvantFAX
# PKGBUILD have taken many days to get them functional on a modern OS.
# I can't spend a lot more time fixing things I don't use without help.

# TODO: Test receive fax functionality. I only send faxes.
# TODO: Verify timers work
# TODO: Check if Tesseract works
# TODO: Support for HylaFAX in extra (HylaFAX+ on AUR is supported)
# TODO: Less destructive remove or better cleanup.
# TODO: Even safer password storage (the current method is pretty safe)
# TODO: SendEmail or smtp-cli.pl support instead of sendmail
# TODO: We should stop using hard links. They won't update as the system updates.
# See avantfaxsetup.sh for more todo

# VERIFIED: Upon remove (and cleanup) 'avantfax' isn't found in /etc /var/spool/hylafax /usr/lib/fax
#  other than in the logs for faxes sent by AvantFAX.
# VERIFIED: AvantFAX integration for HylaFAX+ upgrades

# How to install:
# Setup these parameters
_opt_AUTO_START_HTTP=1 # 1 to automatically enable avantfax and restart apache, 0=manual
_opt_DEBUG_PHP=0       # 1 to show php debug messages, 0 for production
_opt_pagesize='letter' # a4, letter
_opt_phpver='php56'    # php56 for now, php when avantfax is php7 compatible

# With a non set up MySQL or a root password the install will fail.

# sudo vi /usr/bin/avantfaxsetup.sh.password

# Add mysql root password then finish install.

# sudo avantfaxsetup.sh install

# Check settings in /usr/share/webapps/avantfax/includes/local_config.php

# Cleanup: sudo rm -rf /usr/share/webapps/avantfax /root/avantfaxbackup
# Note: Removing the avantfax package is very destructive. It destroys all
# avantfax files and tables.

set -u
pkgname='avantfax'
_pkgnick="${pkgname}" # 'ArchFAX' # Changing this for an upgrade leaves cruft in many files.
pkgver='3.4.1'
pkgrel='1'
pkgdesc='a web-based application for managing faxes on HylaFAX fax servers'
arch=('any') #('i686' 'x86_64')
url='http://www.avantfax.com/'
license=('GPL-2.0-only')
depends=(
  'hylafax' 'sudo' 'ghostscript' 'gsfonts' 'dash'
  'apache' "${_opt_phpver}" "${_opt_phpver}-apache"
  #"${_opt_phpver}-pear"
  #'pear-mail-mime' 'pear-mail-mime-decode' 'pear-net-smtp'
  #'pear-mdb2>=2.5.0b5-1' 'pear-mdb2-mysql>=1.5.0b4-1'
  'html2ps' # AUR in May 2015
  'mariadb' 'psutils' 'libtiff' 'libpng' 'imagemagick' 'netpbm' 'giflib'
)
depends+=('php56-cli')
optdepends=('tesseract: OCR incoming faxes for document keyword searches' # not enabled in local-config, might already work
#            'AvantFAX-support: iFax Solutions can help configure your fax system'
)

# Searching config.php for 'extension_loaded' doesn't show any extensions we need at this time.
# 'php-mysql'    # included in php as 'extension=mysql.so'
# 'php-mbstring' # included in the Arch Linux PKGBUILD configure --enable-mbstring
# 'php-fileinfo' # built in as of php 5.3
# 'libungif'     # no longer supported, seems to be replaced with giflib
# 'vixie-cron'   # replaced with systemd timers. I use cronie.
# 'rsync'        # used only in the manual upgrade scripts. rsync is not used in the package.
#makedepends=('smtp-server') # sendmail isn't required. It can be used on another server.
options=('!strip')
install="${pkgname}.install"
_verwatch=("${url}/changelog.php" 'AvantFAX\s\([0-9\.]\+\)\s*' 'f')
source=(
  "http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tgz"
  'avantfaxsetup.sh'
  'avantfax.cron.service'
  'avantfax.cron.timer'
  'avantfax.phb.service'
  'avantfax.phb.timer'
)
md5sums=('1985ea0885d1d847248dbba94c0c067c'
         'daa42347b4b089aa7c0a5a8b55d4537c'
         '10d6468f628c5522a7e2aabf034eb3d5'
         '5150cfa5c94562d94bc8e87392632fbd'
         '1d2da10d483f92a454e2c047a88f2241'
         '1329f1d50831ee5b48f32caf5278ad04')
sha256sums=('8321e6e9ff022dbbf2a2e7b79ac1956189d4aa30fbec4510c289eaf1e495249b'
            'ebd4fb7dd1b5ec7f9ad4f5ec03dcfaa9fde32c3137d52656007bf2df94b28670'
            '2c633cd03dd234cfbcf6d0530be573e9eaa2b1e92876faa946895bf99bfb3ebc'
            '057be12012e2bd10c8400cac9a2612b9d66ea1535476671f28dbf633c8eb6972'
            '51b4bcf2e26418f8392f765c7d0f363fe3c842ddfbefb8c950f484f4ce4a179a'
            '8a0baba7cfeea3b5e20353677335b923c9333a4d1ab6143b41ca4b2d47449bbd')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  # chmod 755 *.sh
  # All of the .php files marked as executable need to be executable.
  # find avantfax -executable -type f -name "*.php" -exec chmod 644 {} \;

  if [ "$(vercmp "${pkgver}" '3.3.4')" -le 0 ]; then
    # http://forum.joomla.org/viewtopic.php?t=618315
    # Strict Standards patch, remove & from =&
    sed -e 's|^\(\s\+$this->db =\)&\( MDB2::singleton\)|\1\2|g' \
        -e 's|^\(\s\+$res =\)&\( $this->db->query\)|\1\2|g' \
        -e 's|^\(\s\+$this->result =\)&\( $this->db->query\)|\1\2|g' \
        -e 's|^\(\s\+$aff =\)&\( $this->db->exec\)|\1\2|g' \
      -i "${pkgname}/includes/SQL.php"
    #exit 1
  fi

  if [ "$(vercmp "${pkgver}" '3.3.3')" -le 0 ]; then
    # Patch to bring avantfax into compliance with php5
    # http://sourceforge.net/p/avantfax/discussion/542402/thread/bfe70151/?limit=25
    local _file
    for _file in 'AFUserAccount.php' 'FormRules.php'; do
      sed -e 's:^\(\s\+\)private \(function __unset.\+\)$:\1public \2:g' \
          -e 's:^\(\s\+\)private \(function __isset.\+\)$:\1public \2:g' \
          -e 's:^\(\s\+\)private \(function __get.\+\)$:\1public \2:g' \
          -e 's:^\(\s\+\)private \(function __set.\+\)$:\1public \2:g' \
        -i "${pkgname}/includes/${_file}"
    done

    # This PEAR bug will never be fixed but is also unlikely to be deprecated so we'll supress it.
    # http://pear.php.net/bugs/bug.php?id=17987
    for _file in 'SQL.php' 'MDBO.php'; do
      sed -e 's|(\(PEAR::isError\)|(@\1|g' -i "${pkgname}/includes/${_file}"
    done

    # I don't see a fast way to fix this one so I'll just suppress the warning for now.
    sed -e 's|\(^\s\+$source_content = \)\(preg_replace\)|\1@\2|g' \
      -i "${pkgname}/includes/Smarty/Smarty_Compiler.class.php"
  fi

  # All executables run under the special version of php
  if [ "${_opt_phpver}" != 'php' ]; then
    sed -e "s:/usr/bin/php:/usr/bin/${_opt_phpver}:g" -i $(grep --include='*.php' -lr -e '#!/usr/bin')
  fi
  set +u
}

package () {
  set -u
  local _httpdir='/usr/share/webapps'

  # systemd timer (from the HylaFAX PKGBUILD). No need to install cron.
  #install -dm755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
  local _i
  for _i in avantfax*.{timer,service}; do
    install -Dm644 "${_i}" "${pkgdir}/usr/lib/systemd/system/${_i}"
    case "${_i}" in
    # If you're going to do this, it's better to systemctl enable in the install.
    #*.timer) ln -s "../${_i}" "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/${_i}";;
    *.service) sed -e "s:/var/www/avantfax:${_httpdir}/${_pkgnick}:g" -i "${pkgdir}/usr/lib/systemd/system/${_i}";;
    esac
  done

  cd "${pkgname}-${pkgver}"

  # Install the main advantfax folder
  install -dm755 "${pkgdir}${_httpdir}"
  cp -pr 'avantfax' "${pkgdir}${_httpdir}/${_pkgnick}"
  install -dm755 "${pkgdir}${_httpdir}/${_pkgnick}/tmp"

  # Install the SQL scripts
  install -dm755 "${pkgdir}/usr/lib/${_pkgnick}"
  install -Dm644 *.sql -t "${pkgdir}/usr/lib/${_pkgnick}/"

  # Branding. Too bad this can't be better.
  sed -e 's/\(:: AvantFAX LOGIN\) \(::\)/\1 for Arch Linux \2/g' \
    -i "${pkgdir}${_httpdir}/${_pkgnick}/includes/templates/main_theme/templates/index.tpl"

  # Create our bin dir so we can adhere to open_basedir restrictions
  # The installer will place hard links in here.
  local _bindir="${_httpdir}/${_pkgnick}-bin"
  install -dm755 "${pkgdir}${_bindir}"

  # Enable debug
  if [ "${_opt_DEBUG_PHP}" -ne 0 ]; then
    sed -e "s:^\(\s\+\)\(//\s\+DATABASE\sSETTINGS\$\):\1ini_set('display_errors', true); \2:g" \
      -i "${pkgdir}${_httpdir}/${_pkgnick}/includes/local_config-example.php"
    sed -e "s:^\(\s\+\)\(require_once '\.\./includes/classes\.php';\)\$:\1ini_set('display_errors', true);\n\1\2:g" \
      -i "${pkgdir}${_httpdir}/${_pkgnick}/index.php"
    sed -e "s:^\(\s\+\)\(require_once '\.\./includes/classes\.php';\)\$:\1ini_set('display_errors', true);\n\1\2:g" \
      -i "${pkgdir}${_httpdir}/${_pkgnick}/admin/index.php"
  fi

  # patch php scripts with our bin dir to comply with php open_basedir
  # Set page size
  sed -e 's:/usr/local/bin/:'"${_bindir}/:g" \
      -e 's:/usr/bin:'"${_bindir}:g" \
      -e "s:^\(\s\+\$HYLAFAX_PREFIX\s*=\s*'\)[^']\+\(';\):\1${_bindir}\2:g" \
      -e "s:^\(\s\+\$PAPERSIZE\s*=\s*'\)[^']\+\(';\):\1${_opt_pagesize}\2:g" \
    -i "${pkgdir}${_httpdir}/${_pkgnick}/includes/local_config-example.php"

  # The original technique for HYLA being in bin and sbin is hostile to our bin folder
  # Besides, sbin must go
  sed -e "s:'sbin':'bin':g" \
      -e 's:\($HYLAFAX_PREFIX.DIRECTORY_SEPARATOR.\)'"'bin'.DIRECTORY_SEPARATOR.:\1:g" \
      -e '#s:^\(\s\+error_reporting(E_ALL\)\();\)$:\1 \& ~E_DEPRECATED\2:g' \
    -i "${pkgdir}${_httpdir}/${_pkgnick}/includes/config.php"

  # Install Apache vhosts file. It's similar to phpMyAdmin and Adminer.
  local _phpxpath=''
  if [ "${_opt_phpver}" != 'php' ]; then
    _phpxpath=":/usr/share/${_opt_phpver}/pear/"
  fi
  install -Dm644 <(cat <<EOF
# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
Alias /${_pkgnick} "${_httpdir}/${_pkgnick}"
<Directory "${_httpdir}/${_pkgnick}">
  AllowOverride All
  Options FollowSymlinks
  Require all granted
    php_admin_value open_basedir "/tmp/${_phpxpath}:/usr/share/pear/:${_httpdir}/${_pkgnick}/:${_httpdir}/${_pkgnick}-bin/"
# The AvantFAX installer avantfaxsetup.sh will tack the HylaFAX+ spool folder onto the end
</Directory>
EOF
  ) "${pkgdir}/etc/webapps/${_pkgnick}/apache.example.conf"
  install -Dpm644 "${pkgdir}/etc/webapps/${_pkgnick}/apache.example.conf" "${pkgdir}/etc/httpd/conf/extra/httpd-${_pkgnick}.conf"

  # Install, patch, source, and run our setup script
  local _shellfile="${pkgdir}/usr/bin/avantfaxsetup.sh"
  install -d "${pkgdir}/usr/bin"
  install -Dpm755 "${srcdir}/avantfaxsetup.sh" "${_shellfile}"
  # Arch Linux uses bash as sh which allows bashishms through. For strict POSIX shell compliance we use dash.
  sed -e 's:^\(_opt_HTTP_DIR\)=.*$'":\1='${_httpdir}':g" \
      -e 's:^\(_opt_VHOSTS\)=.*$'":\1=0:g" \
      -e 's:^\(_opt_AUTO_START_HTTP\)=.*$'":\1=${_opt_AUTO_START_HTTP}:g" \
      -e 's:^\(_opt_AVANTFAX_SERVERNAME\)=.*$'":\1='${_pkgnick}':g" \
      -e 's:^#!/bin/sh$:#!/usr/bin/dash:g' \
    -i "${_shellfile}"

  # Install php mysql extension
  local _opt_SOURCEONLY=1; . "${_shellfile}"; unset _opt_SOURCEONLY
  install -Dm644 <(cat << EOF
; Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
; https://aur.archlinux.org/
extension=mysql.so
EOF
  ) "${pkgdir}/etc/${_opt_phpver}/conf.d/${_pkgnick}.ini"

  # Fix timers to run as user
  sed -e 's:^#\(User\)=.*$'":\1=${_opt_WWWUSER}:g" \
      -e 's:^#\(Group\)=.*$'":\1=${_opt_WWWGROUP}:g" \
    -i "${pkgdir}/usr/lib/systemd/system/"*.service

  # Install sudo config
  install -dm750 "${pkgdir}/etc/sudoers.d"
  install -Dm644 <(cat << EOF
# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
${_opt_SUDO_LINE} -u * -p * *  ${_opt_AVANT_CMTTAG}
EOF
  ) "${pkgdir}/etc/sudoers.d/${_pkgnick}.sudo"

  # We run the shell script modified with pkgdir
  _opt_DESTDIR="${pkgdir}" \
  "${_shellfile}" 0 'package' # package ignores the flag

  # pacman hook for automatic update on HylaFax Upgrade
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Trigger]
Operation = Upgrade
Type = Package
Target = hylafax
Target = hylafaxplus

[Action]
Description = AvantFAX: Update with HylaFax+
When = PostTransaction
Exec = /usr/bin/bash /usr/bin/${_shellfile##*/} 2 install
EOF
  ) "${pkgdir}/usr/share/libalpm/hooks/avantfax-hylafax.hook"

  set +u
}

set +u
