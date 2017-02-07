# Maintainer: Georg Pichler <georg.pichler@gmail.com>

_rtfm=n # you want documentation? (y / n)
_other_agents=n # you want agents for other operating systems? (y / n)
_agent=n # agent is in seperate package check_mk-agent

pkgname=check_mk
pkgver=1.2.8p16
pkgrel=1
pkgdesc="A comprehensive IT monitoring solution in the tradition of Nagios"
license=('GPL2')
arch=('any')
url="http://mathias-kettner.com/check_mk.html"
depends=( 'python2'
	  'nagios>=4.0.0'
	  'nagios-plugins'
	  'xinetd'
	  'mod_python2'
	  'apache'
	  'monitoring-plugins'
	  )
optdepends=('pnp4nagios: Graphing performance data')
source=(
  "https://mathias-kettner.de/download/${pkgname}-${pkgver}.tar.gz"
  'init.d.check_mk'
  'check_mk_templates.cfg.patch'
  'mkp.patch'
  'check_mk.patch'
  'setup.sh.patch'
)
md5sums=('b018d0c4eba2f10c99469ec0f64a879f'
         '078175f2851419ae53346a06a42f9f2c'
         'e10a352fff0563bddeb788c7f9aee759'
         '5e8cb4a9ca2b7e17c1c902be43808653'
         'dff7c1d42947b4b54e2953dd31def78a'
         '7c426024053ec772d21ce042776f9497')

install="${pkgname}.install"
backup=( 'etc/nagios/htpasswd.users' )

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # patch setup file
  patch "./setup.sh" "${srcdir}/setup.sh.patch"

  DESTDIR="${pkgdir}" \
    wwwuser='http' \
    nagios_binary='/usr/bin/nagios' \
    nagios_startscript='/usr/bin/true' \
    nagpipe='/var/nagios/rw/nagios.cmd' \
    check_result_path='/var/nagios/spool/checkresults' \
    nagios_status_file='/var/nagios/status.dat' \
    check_icmp_path='/usr/lib/monitoring-plugins/check_icmp' \
    apache_config_dir='/etc/httpd/conf/extra' \
    livesock='/var/nagios/rw/live' \
    nagios_startscript='/usr/share/check_mk/init.d.check_mk' \
    nagios_version='4.2.2' \
      ./setup.sh
      
  # Fix python shebangs:
  cd "${pkgdir}"
  for f in `grep -rl '#!/usr/bin/python' .`; do
      sed -i 's_#!/usr/bin/python_#!/usr/bin/env python2_g' "${f}"
  done
  # Fix other python2 stuff:
  patch "./usr/share/check_mk/check_mk_templates.cfg" "${srcdir}/check_mk_templates.cfg.patch"
  patch "./usr/bin/mkp" "${srcdir}/mkp.patch"
  patch "./usr/bin/check_mk" "${srcdir}/check_mk.patch"
  
  # Add symlinks for the agent:
  mkdir -p "./usr/bin" "./etc/xinetd.d"
  ln -s "/usr/share/check_mk/agents/check_mk_agent.linux" "./usr/bin/check_mk_agent"
  ln -s "/usr/share/check_mk/agents/xinetd.conf" "./etc/xinetd.d/check_mk"
  ln -s "/usr/share/check_mk/agents/waitmax" "./usr/bin/waitmax"

  # Add init.d dummy script
  cp "${srcdir}/init.d.check_mk" "./usr/share/check_mk/init.d.check_mk"
  
  # Use proper webapps directory for apache config
  mkdir -p "./etc/webapps/check_mk"
  mv "./etc/httpd/conf/extra/zzz_check_mk.conf" "./etc/webapps/check_mk/apache.example.conf"

  # Fixing directory permissions
  chmod 0775 "./etc/nagios"
  chmod 0775 "./etc/nagios/objects"
  chmod 0750 "./etc/sudoers.d"

  # Change directory owners
  chown -R nagios:nagios "var/lib/check_mk"
  chmod -R 0775 "var/lib/check_mk"
  chown nagios:nagios "etc/check_mk/conf.d"
  chmod 0775 "etc/check_mk/conf.d"
  chown nagios:nagios "etc/check_mk/multisite.d"
  chmod 0775 "etc/check_mk/multisite.d"
  
  # Remove docs if the user wants it:
  [[ "${_rtfm}" = "n" ]] && rm -rf "./usr/share/doc"
  # Remove agents if the user wants it:
  if [[ "${_other_agents}" = "n" ]]; then
    rm -rf "./usr/share/check_mk/agents/windows/"
    rm -f "./usr/share/check_mk/agents/check_mk_agent."{freebsd,macosx,openvms,netbsd,aix,hpux,solaris,openbsd}
  fi
  # Remove agent if the user wants it:
  if [[ "${_agent}" = "n" ]]; then
    rm -rf "./etc/xinetd.d/"
    rm -f "./usr/bin/check_mk_agent"
  fi
}
