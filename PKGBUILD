# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Category: daemons

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
# See avantfaxsetup.sh for more todo

# VERIFIED: Upon remove (and cleanup) 'avantfax' isn't found in /etc /var/spool/hylafax
#  other than in the logs for faxes sent by AvantFAX.
# VERIFIED: AvantFAX integration for HylaFAX+ upgrades

# How to install:
# Setup these parameters
_opt_AUTO_START_HTTP=1 # 1 to automatically enable avantfax and restart apache, 0=manual
_opt_DEBUG_PHP=0       # 1 to show php debug messages, 0 for production
_opt_pagesize='letter' # a4, letter

# Recommended build command: makepkg -scCfi

# With a non set up MySQL or a root password the install will fail.

# sudo vi /usr/bin/avantfaxsetup.sh.password

# Add mysql root password then finish install.

# avantfaxsetup.sh install

# Check settings in /usr/share/webapps/avantfax/includes/local_config.php

# Cleanup: sudo rm -rf /usr/share/webapps/avantfax /root/avantfaxbackup
# Note: Removing the avantfax package is very destructive. It destroys all 
# avantfax files and tables.

set -u
pkgname='avantfax'
_pkgnick="${pkgname}" # 'ArchFAX' # Changing this for an upgrade leaves cruft in many files.
pkgver='3.3.3'
pkgrel='1'
pkgdesc='a web-based application for managing faxes on HylaFAX fax servers'
arch=('any') #('i686' 'x86_64')
install='avantfax.install'
license=('GPLv2')
depends=('hylafax' 'sudo' 'ghostscript' 'gsfonts' 'dash'
         'php' 'apache' 'php-apache' 'php-pear'
         'pear-mail-mime' 'pear-mail-mime-decode' 'pear-net-smtp'
         'pear-mdb2>=2.5.0b5-1' 'pear-mdb2-mysql>=1.5.0b4-1' 'html2ps' # AUR in May 2015
         'mariadb' 'psutils' 'libtiff' 'libpng' 'imagemagick' 'netpbm' 'giflib'
         )
optdepends=('tesseract: OCR incoming faxes for document keyword searches' # not enabled in local-config, might already work
            'AvantFAX-support: iFax Solutions can help configure your fax system'
)

# Searching config.php for 'extension_loaded' doesn't show any extensions we need at this time.
# 'php-mysql'    # included in php as 'extension=mysql.so'
# 'php-mbstring' # included in the Arch Linux PKGBUILD configure --enable-mbstring
# 'php-fileinfo' # built in as of php 5.3
# 'libungif'     # no longer supported, seems to be replaced with giflib
# 'vixie-cron'   # replaced with systemd timers. I use cronie.
# 'rsync'        # used only in the manual upgrade scripts. rsync is not used in the package.
#makedepends=('smtp-server') # sendmail isn't required. It can be used on another server.
url='http://www.avantfax.com/'
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tgz"
        'avantfaxsetup.sh'
        'avantfax.cron.service'
        'avantfax.cron.timer'
        'avantfax.phb.service'
        'avantfax.phb.timer')

sha256sums=('b27deff3953af084d3930878e7377d382d434da43a05388a72251f6352e6133d'
            '615fcba915da20c10614c618dfc6a4d55ed526d2b689947c104102e3cc37e18c'
            '2c633cd03dd234cfbcf6d0530be573e9eaa2b1e92876faa946895bf99bfb3ebc'
            '057be12012e2bd10c8400cac9a2612b9d66ea1535476671f28dbf633c8eb6972'
            '51b4bcf2e26418f8392f765c7d0f363fe3c842ddfbefb8c950f484f4ce4a179a'
            '8a0baba7cfeea3b5e20353677335b923c9333a4d1ab6143b41ca4b2d47449bbd')

build () {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  # chmod 755 *.sh
  # All of the .php files marked as executable need to be executable.
  # find avantfax -executable -type f -name "*.php" -exec chmod 644 {} \;

  # Patch to bring avantfax into compliance with php5
  # http://sourceforge.net/p/avantfax/discussion/542402/thread/bfe70151/?limit=25
  local _file
  for _file in 'AFUserAccount.php' 'FormRules.php'; do
    sed -i -e 's:^\(\s\+\)private \(function __unset.\+\)$:\1public \2:g' \
           -e 's:^\(\s\+\)private \(function __isset.\+\)$:\1public \2:g' \
           -e 's:^\(\s\+\)private \(function __get.\+\)$:\1public \2:g' \
           -e 's:^\(\s\+\)private \(function __set.\+\)$:\1public \2:g' \
      "${pkgname}/includes/${_file}"
  done

  # http://forum.joomla.org/viewtopic.php?t=618315
  # Strict Standards patch, remove & from =&
  sed -i -e 's|^\(\s\+$this->db =\)&\( MDB2::singleton\)|\1\2|g' \
         -e 's|^\(\s\+$res =\)&\( $this->db->query\)|\1\2|g' \
         -e 's|^\(\s\+$this->result =\)&\( $this->db->query\)|\1\2|g' \
         -e 's|^\(\s\+$aff =\)&\( $this->db->exec\)|\1\2|g' \
    "${pkgname}/includes/SQL.php"
  #exit 1

  # This PEAR bug will never be fixed but is also unlikely to be deprecated so we'll supress it.
  # http://pear.php.net/bugs/bug.php?id=17987
  for _file in SQL.php MDBO.php; do
    sed -i -e 's|(\(PEAR::isError\)|(@\1|g' \
      "${pkgname}/includes/${_file}"
  done

  # I don't see a fast way to fix this one so I'll just supress the warning for now.
  sed -i -e 's|\(^\s\+$source_content = \)\(preg_replace\)|\1@\2|g' \
    "${pkgname}/includes/Smarty/Smarty_Compiler.class.php"
  set +u
}

package () {
  set -u
  local _httpdir='/usr/share/webapps'

  cd "${srcdir}"
  # systemd timer (from the HylaFAX PKGBUILD). No need to install cron.
  install -d -m755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
  for _i in avantfax*.{timer,service}; do
    install -D -m644 "${_i}" "${pkgdir}/usr/lib/systemd/system/${_i}"
    case "${_i}" in
    # If you're going to do this, it's better to systemctl enable in the install.
    #*.timer) ln -s "../${_i}" "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/${_i}";;
    *.service) sed -i -e "s:/var/www/avantfax:${_httpdir}/${_pkgnick}:g" "${pkgdir}/usr/lib/systemd/system/${_i}";;
    esac
  done

  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the main advantfax folder
  install -d -m755 "${pkgdir}${_httpdir}"
  cp -pr "avantfax" "${pkgdir}${_httpdir}/${_pkgnick}"
  install -d -m755 "${pkgdir}${_httpdir}/${_pkgnick}/tmp"

  # Install the SQL scripts
  install -d -m755 "${pkgdir}/usr/lib/${_pkgnick}"
  install -D -m644 *.sql "${pkgdir}/usr/lib/${_pkgnick}"

  # Branding. Too bad this can't be better.
  sed -i -e 's/\(:: AvantFAX LOGIN\) \(::\)/\1 for Arch Linux \2/g' \
    "${pkgdir}${_httpdir}/${_pkgnick}/includes/templates/main_theme/templates/index.tpl"

  # Create our bin dir so we can adhere to open_basedir restrictions
  # The installer will place hard links in here.
  local _bindir="${_httpdir}/${_pkgnick}-bin"
  install -d -m755 "${pkgdir}${_bindir}"

  # Enable debug
  if [ "${_opt_DEBUG_PHP}" -ne 0 ]; then
    sed -i -e "s:^\(\s\+\)\(//\s\+DATABASE\sSETTINGS\$\):\1ini_set('display_errors', true); \2:g" \
      "${pkgdir}${_httpdir}/${_pkgnick}/includes/local_config-example.php"
    sed -i -e "s:^\(\s\+\)\(require_once '\.\./includes/classes\.php';\)\$:\1ini_set('display_errors', true);\n\1\2:g" \
      "${pkgdir}${_httpdir}/${_pkgnick}/index.php"
    sed -i -e "s:^\(\s\+\)\(require_once '\.\./includes/classes\.php';\)\$:\1ini_set('display_errors', true);\n\1\2:g" \
      "${pkgdir}${_httpdir}/${_pkgnick}/admin/index.php"
  fi

  # patch php scripts with our bin dir to comply with php open_basedir
  # Set page size
  sed -i -e 's:/usr/local/bin/:'"${_bindir}/:g" \
         -e 's:/usr/bin:'"${_bindir}:g" \
         -e "s:^\(\s\+\$HYLAFAX_PREFIX\s*=\s*'\)[^']\+\(';\):\1${_bindir}\2:g" \
         -e "s:^\(\s\+\$PAPERSIZE\s*=\s*'\)[^']\+\(';\):\1${_opt_pagesize}\2:g" \
    "${pkgdir}${_httpdir}/${_pkgnick}/includes/local_config-example.php"
  #exit 1

  # The original technique for HYLA being in bin and sbin is hostile to our bin folder
  # Besides, sbin must go
#         -e 's:^\(\s\+error_reporting(E_ALL\)\();\)$:\1 \& ~E_DEPRECATED\2:g' 
  sed -i -e "s:'sbin':'bin':g" \
         -e 's:\($HYLAFAX_PREFIX.DIRECTORY_SEPARATOR.\)'"'bin'.DIRECTORY_SEPARATOR.:\1:g" \
    "${pkgdir}${_httpdir}/${_pkgnick}/includes/config.php"

  # Install Apache vhosts file. It's similar to phpMyAdmin and Adminer.
  install -d -m755 "${pkgdir}/etc/webapps/${_pkgnick}"
  cat > "${pkgdir}/etc/webapps/${_pkgnick}/apache.example.conf" <<EOF
# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/
Alias /${_pkgnick} "${_httpdir}/${_pkgnick}"
<Directory "${_httpdir}/${_pkgnick}">
  AllowOverride All
  Options FollowSymlinks
  Require all granted
    php_admin_value open_basedir "/tmp/:/usr/share/pear/:${_httpdir}/${_pkgnick}/:${_httpdir}/${_pkgnick}-bin/"
# The AvantFAX installer avantfaxsetup.sh will tack the HylaFAX+ spool folder onto the end
</Directory>
EOF
  install -d -m755 "${pkgdir}/etc/httpd/conf/extra"
  cp -p "${pkgdir}/etc/webapps/${_pkgnick}/apache.example.conf" "${pkgdir}/etc/httpd/conf/extra/httpd-${_pkgnick}.conf"

  # Install, patch, source, and run our setup script
  local _shellfile="${pkgdir}/usr/bin/avantfaxsetup.sh"
  install -d -m755 "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/avantfaxsetup.sh" "${_shellfile}"
  # Arch Linux uses bash as sh which allows bashishms through. For strict POSIX shell compliance we use dash.
  sed -i -e 's:^\(_opt_HTTP_DIR\)=.*$'":\1='${_httpdir}':g" \
         -e 's:^\(_opt_VHOSTS\)=.*$'":\1=0:g" \
         -e 's:^\(_opt_AUTO_START_HTTP\)=.*$'":\1=${_opt_AUTO_START_HTTP}:g" \
         -e 's:^\(_opt_AVANTFAX_SERVERNAME\)=.*$'":\1='${_pkgnick}':g" \
         -e 's:^#!/bin/sh$:#!/usr/bin/dash:g' \
    "${_shellfile}"

  # Install php mysql extension
  _opt_SOURCEONLY=1; . "${_shellfile}"; unset _opt_SOURCEONLY
  install -d -m755 "${pkgdir}/etc/php/conf.d"
  cat >> "${pkgdir}/etc/php/conf.d/${_pkgnick}.ini" << EOF
; Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
; http://aur.archlinux.org/
extension=mysql.so
EOF
  chmod 755 "${pkgdir}/etc/php/conf.d"

  # Fix timers to run as user
  local _i
  for _i in "${pkgdir}/usr/lib/systemd/system/"*.service; do
    sed -i -e 's:^#\(User\)=.*$'":\1=${_opt_WWWUSER}:g" \
           -e 's:^#\(Group\)=.*$'":\1=${_opt_WWWGROUP}:g" \
      "${_i}"
  done

  # Install sudo config
  install -d -m750 "${pkgdir}/etc/sudoers.d"
  cat >> "${pkgdir}/etc/sudoers.d/${_pkgnick}.sudo" << EOF
# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/
${_opt_SUDO_LINE} -u * -p * *  ${_opt_AVANT_CMTTAG}
EOF

  # We run the *modified* shell script
  export _opt_DESTDIR="${pkgdir}"
  "${_shellfile}" 0 package # package ignores the flag
  set +u
}

set +u
