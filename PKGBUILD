# Maintainer: Brent Saner <r00t (at) square-r00t (dot) net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Contributor: TJ Vanderpoel <tj@rubyists.com>

## MAINTAINER NOTE BEGIN
# Most (like, ~80%) of this is taken verbatim from the freeswitch AUR package currently (as of 02.28.2014) maintained by bougyman.
# https://aur.archlinux.org/packages/freeswitch/
# However, it's horribly out of date and doesn't seem to be actively maintained anymore.
## MAINTAINER NOTE END


# This builds the FreeSWITCH open source telephone engine
# from the freeswitch git.  It enables the following modules
# not enabled in the standard freeswitch build:
#  * mod_callcenter
#  * mod_xml_curl
# And disables the following standard modules:
#  * mod_dialplan_asterisk
#  * mod_say_ru
#  * mod_spidermonkey
#  * mod_lua
# You can modify this and other options in the BUILD CONFIGURATION section below


# BUILD CONFIGURATION BEGINS #

# SET THIS TO GET HIGHER QUALITY SOUNDFILES
# Value can be "hd-", "uhd-", or "cd-" to get 16k, 32k, or 48k sounds.
# By default we only download the 8k sounds. If you only use g711 or
# 8k codecs, leave this as-is

_sounds="cd-"

# ADDED MODULES
# If you don't need/want these modules remove them from _enabled_modules
# You can add any modules here you wish to add, make sure they're not
# in _disabled_modules, though
#
# xml_int/mod_xml_curl - Remote http dialplan lookups/control
# xml_int/mod_xml_cdr - Remote http dialplan lookups/control
# applications/mod_callcenter - Inbound call queueing system
_enabled_modules=(xml_int/mod_xml_curl
                  xml_int/mod_xml_cdr
                  formats/mod_shout
                  applications/mod_callcenter
		  languages/mod_lua)

# DISABLED MODULES
# Remove from _disabled_modules if you want to build these
#
# languages/mod_spidermonkey - server-side javascript
# languages/mod_lua - server-side lua
# say/mod_say_ru - Russian phrases
# dialplans/mod_dialplan_asterisk - Legacy dialplan
_disabled_modules=(languages/mod_spidermonkey
                   say/mod_say_ru
                   dialplans/mod_dialplan_asterisk)

# CONCURRENT BOOTSTRAP
# Uncomment this to enable backgrounded concurrent bootstrap operations.
# You will suffer a lot of autotools scroll from this, Fair Warning.

#_concurrent="-j"

# BUILD CONFIGURATION ENDS                     #
#                                              #
# CHANGE ANYTHING BELOW HERE AT YOUR OWN RISK! #
#                                              #


pkgname='freeswitch-git'
pkgver=1.5.final.r2501.g07b200c
pkgrel=3
pkgdesc="An opensource and free (libre, price) telephony system, similar to Asterisk (git version)."
arch=('i686' 'x86_64')
url="http://freeswitch.org/"
license=('MPL')
depends=('curl'
         'xz'
         'python'
         'libtheora'
         'unixodbc'
         'libvorbis'
         'speex'
         'libjpeg-turbo'
         'postgresql-libs'
	 'libshout'
	 'lua'
	 'opus')
# per https://wiki.freeswitch.org/wiki/FreeSwitch_Dependencies, dependencies are downloaded and built *from upstream*, so thankfully the deps are pretty minimal.
makedepends=('git'
             'libjpeg'
             'ldns'
             'libedit'
             'curl'
             'python2'
             'unixodbc'
             'sed'
             'make'
	     'libyuv-git'
	     'yasm')
# per https://aur.archlinux.org/packages/freeswitch-fixed/ 2014-08-13 14:02 comment, enable this when freetdm is packaged.
# freetdm will require libsangoma, wanpipe, libsng_isdn, libpri. see http://wiki.freeswitch.org/wiki/FreeTDM#Dependencies ; links below
# http://wiki.sangoma.com/wanpipe-linux-drivers
# http://downloads.asterisk.org/pub/telephony/libpri/releases
#optdepends=('freetdm: FreeTDM support for DAHDI etc.') 
provides=('freeswitch')
conflicts=('freeswitch'
           'freeswitch-fixed')
install=freeswitch.install
backup=('etc/freeswitch/private/passwords.xml'
        'etc/freeswitch/vars.xml')
source=("git+https://stash.freeswitch.org/scm/fs/freeswitch.git"
        'freeswitch.conf.d'
         'README.freeswitch'
         'run.freeswitch'
         'run_log.freeswitch'
         'conf_log.freeswitch'
         'freeswitch.service'
	'freeswitch.conf.d.sig'
	'README.freeswitch.sig'
	'run.freeswitch.sig'
	'run_log.freeswitch.sig'
	'conf_log.freeswitch.sig'
	'freeswitch.service.sig')
changelog='ChangeLog'
_pkgname="freeswitch"
sha512sums=('SKIP'
            'a9c0f8397e9375b26f8c3950c07fff9ce2c60684bd99cfb371cd19cce2bfb2f042a5380a38751bcd212096611d38731a2613a93d037b53f0c1cf356180b98912'
            '55e913bae6d3bb04ae9253989e40b6e0c3bfcecf95c28c904f5022ed218227c68530aaa60f99d7486469c95f9c1719da041a8fef82bf4ee54b1f901c443d347d'
            '6d8a3080b73918fb4a10e077758726b8b8e917c6b6f9d3c11c3b81e14e2efb43cd6fdf87d86f81a9e374811ca0d555eaa901113795c9334104de5e1309458da7'
            'e0ad57847905d11540567512fb224587a96db086ecaefd949964bd7e5bf29e448497fb3d6df5d88dbedd69beb5ae4618bb0e8462cbbb9fad84947c6932fc0b46'
            'a4fd539de109de3475abfeb2bd8a95670af3f5af83bd6f6b229df19e81da3f121c28a62cff282f9dc152908ebe0f24f76743e00c72fa04dc1fd465a00dc6f976'
            '0d71a056de156f5840effabf6fb37a20e64ae011ecd48bf049886d4c073fe251cd6adeb0380784622b570948e1ca30ce7c92a2cade230a7177c97ed697e6f1cb'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}


_pathorig=${PATH}

enable_module() {
  _fs_mod=${1}
  sed -i -e "s|^#${_fs_mod}|${_fs_mod}|" modules.conf
}

disable_module() {
  _fs_mod=${1}
  sed -i -e "s|^${_fs_mod}|#${_fs_mod}|" modules.conf
}

build() {
  cd ${srcdir}/${_pkgname}

  # BUILD BEGINS
  msg "Bootstrapping..."
  ./bootstrap.sh ${_concurrent} > /dev/null
  msg "Bootstrap Complete"

  # MODULE ENABLE/DISABLE
  for _mod in ${_enabled_modules[@]};do
    msg "Enabling ${_mod}"
    enable_module ${_mod}
  done

  for _mod in ${_disabled_modules[@]};do
    msg "Disabling ${_mod}"
    disable_module ${_mod}
  done

  msg "Module Configuration Complete, Stop Now with Ctrl-C if the above is not correct"
  sleep 5

  # SED FIXES
   #sed -i -e '/if\ test\ "\$ac_cv_gcc_supports_w_no_unused_result"\ =\ yes;\ then/,+2d' configure.ac
   #sed -i -e '/\ _BSD_SOURCE$/d' src/include/switch.h

  # CONFIGURE
  ./configure --prefix=/var/lib/freeswitch --with-python=/usr/bin/python2 \
    --bindir=/usr/bin --sbindir=/usr/sbin --localstatedir=/var \
    --sysconfdir=/etc/ --datarootdir=/usr/share \
    --libexecdir=/usr/lib/freeswitch --libdir=/usr/lib/freeswitch \
    --includedir=/usr/include/freeswitch --enable-core-odbc-support \
    --with-recordingsdir=/var/spool/freeswitch/recordings \
    --with-dbdir=/var/spool/freeswitch/db \
    --with-pkgconfigdir=/usr/lib/pkgconfig \
    --with-logfiledir=/var/log/freeswitch \
    --with-modinstdir=/usr/lib/freeswitch/mod \
    --with-rundir=/run/freeswitch

  # COMPILE
  make

}

enable_mod_xml() {
  _fs_mod=$(basename $1)

  if [ "x$(grep ${_fs_mod} ${pkgdir}/etc/freeswitch/autoload_configs/modules.conf.xml)" == "x" ];then
    msg "Adding missing module ${_fs_mod} to modules.conf.xml"
    sed -i -e "s|^\(\s*</modules>\)|\t\t<\!-- added by archlinux package -->\n\t\t<load module=\"${_fs_mod}\"/>\n\1|" \
      "${pkgdir}/etc/freeswitch/autoload_configs/modules.conf.xml"
  else
    msg "Enabling module ${_fs_mod} in modules.conf.xml"
    sed -i -e "s|^\(\s*\)<\!--\s*\(<load module=\"${_fs_mod}\"/>\)\s*-->|\1\2|" \
      "${pkgdir}/etc/freeswitch/autoload_configs/modules.conf.xml"
  fi

}

disable_mod_xml() {
  _fs_mod=$(basename $1)
  msg "Disabling module ${_fs_mod} in modules.conf.xml"
  sed -i -e "s|^\(\s*\)\(<load module=\"${_fs_mod}\"/>\)|\1<\!-- \2 -->|" \
    "${pkgdir}/etc/freeswitch/autoload_configs/modules.conf.xml"
}

package() {
  mkdir -p /var/tmp/bin
  ln -sf /usr/bin/python2 /var/tmp/bin/python
  PATH="/var/tmp/bin:${PATH}"
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
  make DESTDIR="${pkgdir}/" ${_sounds}moh-install
  make DESTDIR="${pkgdir}/" ${_sounds}sounds-install
  PATH=${_pathorig}
  rm -rf /var/tmp/bin/python
  rmdir /var/tmp/bin

  cd ${pkgdir} # MUY IMPORTANT, $PWD is $pkgdir from here on out
  # Mangle freeswitch's installed dirs into a more compliant structure,
  # leaving symlinks in their place so freeswitch doesn't notice.
  ln -sf /var/log/freeswitch var/lib/freeswitch/log
  ln -sf /var/spool/freeswitch/db var/lib/freeswitch/db
  ln -sf /var/spool/freeswitch/recordings var/lib/freeswitch/recordings
  install -D -m 0755 -d var/spool/freeswitch/storage && \
    ln -sf /var/spool/freeswitch/storage var/lib/freeswitch/storage
  rm usr/lib/freeswitch/mod/*.la 2>/dev/null|| true
  rm usr/lib/freeswitch/*.la 2>/dev/null || true
  ln -sf /usr/lib/freeswitch/mod var/lib/freeswitch/mod
  install -D -m 0644 ${srcdir}/freeswitch.service usr/lib/systemd/system/freeswitch.service
  install -D -m 0644 "${srcdir}/freeswitch.conf.d" etc/conf.d/freeswitch
  install -D -m 0644 "${srcdir}/README.freeswitch" usr/share/doc/freeswitch/README
  cp -a "${srcdir}/${_pkgname}/docs" usr/share/doc/freeswitch
  install -D -m 0755 -d usr/share/doc/freeswitch/support-d
  cp -a "${srcdir}/${_pkgname}/support-d" usr/share/doc/freeswitch/
  install -D -m 0755 -d usr/share/doc/freeswitch/scripts
  cp -a "${srcdir}/${_pkgname}/scripts" usr/share/doc/freeswitch/
  # Copy upstream confs 
  install -D -m 0755 -d usr/share/doc/freeswitch/examples/conf.default
  install -D -m 0755 -d usr/share/doc/freeswitch/examples/conf.archlinux
  mkdir etc/freeswitch/private
  echo '<X-PRE-PROCESS cmd="include" data="private/passwords.xml"/>' >> etc/freeswitch/vars.xml
  echo "<X-PRE-PROCESS cmd=\"set\" data=\"default_password=$(tr -dc 0-9 < /dev/urandom | head -c10)\"/>" > etc/freeswitch/private/passwords.xml
  chmod 700 etc/freeswitch/private
  chmod 600 etc/freeswitch/private/passwords.xml
  ln -sf /etc/freeswitch var/lib/freeswitch/conf
  cp -a etc/freeswitch/* usr/share/doc/freeswitch/examples/conf.default/

  for _mod in ${_enabled_modules[@]};do
    enable_mod_xml $_mod
  done

  for _mod in ${_disabled_modules[@]};do
    disable_mod_xml $_mod
  done

  mv etc/freeswitch/* usr/share/doc/freeswitch/examples/conf.archlinux/
  rmdir etc/freeswitch
  install -D -m0755 -d usr/share/freeswitch/conf
  install -D -m 0755 "${srcdir}/run.freeswitch" usr/share/freeswitch/run
  install -D -m 0755 "${srcdir}/run_log.freeswitch" usr/share/freeswitch/log/run
  install -D -m 0644 "${srcdir}/conf_log.freeswitch" usr/share/freeswitch/log/conf
} 
