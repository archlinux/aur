# Maintainer: Robert Knauer <robert@privatdemail.net>

_rtfm=n # you want documentation? (y / n)
_other_agents=n # you want agents for other operating systems? (y / n)

pkgname=check_mk-git
_name=check_mk
pkgver=v1.2.3i1.522.g6223c5e
pkgrel=1
pkgdesc="A new general purpose Nagios-plugin for retrieving data."
license=('GPL2')
arch=('any')
url="http://mathias-kettner.de/check_mk.html"
depends=('python2' 'nagios' 'nagios-plugins' 'xinetd' 'mod_python' 'apache')
source=(
  'git+http://git.mathias-kettner.de/check_mk.git'
  'files_shebang.txt'
  'check_mk_templates.cfg.patch'
  'index.py.patch'
  'mkp.patch'
  'check_mk.patch'
  'make_package_info.patch'
  'check_mk.py.patch'
  'agent_vsphere.patch'
)
sha256sums=(
  'SKIP'
  '8f02d8f28cd608580a43ee2b57a16e498347ea07f61d41c6a83eae61375913b0'
  'f0bb81a195347ab0d46c8b34921021200f67f490fbe4be538e5d0c99b21e1400'
  '7488ab4d5d5e0686f477a14456585015a9d2c9cdb3cdeea383507b70db8a060a'
  'f68f4593e15010004b3abf1c8fd92638efd34c92e0a93e7810b3a972ce0bfee7'
  'e577f3549b5f3a39e974aa9ab979c67722f8ef0a8bbb434cf6b1b5ca165fe473'
  'f34bd87f353ee557a58a9ad8fa190580becfcb9f3eaea1aa87a239de8e490d7c'
  'eca4b307fc099767ae28bbcd0248f6797b34f07dfbb745ade43a5549f59edc64'
  '198be7f46addd0999f39f1ba33aa049d112b92f2e3c6ec61cffc643d1ad3d092'
)
install="${pkgname}.install"

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  patch "${srcdir}/${_name}/make_package_info" "${srcdir}/make_package_info.patch"
}

build() {
  cd "${srcdir}/${_name}"
  # Create a tar.gz-Archive:
  rm -f check_mk-*.tar.gz
  rm -rf check_mk-*
  make dist
  # ... and unpack it:
  tar xf check_mk-*.tar.gz
  rm -f check_mk-*.tar.gz
}

package() {
  cd "${srcdir}/${_name}/check_mk-"*
  DESTDIR="${pkgdir}" \
    wwwuser='http' \
    nagios_binary='/usr/bin/nagios' \
    nagios_startscript='/usr/bin/true' \
    nagpipe='/var/nagios/rw/nagios.cmd' \
    check_result_path='/var/nagios/spool/checkresults' \
    nagios_status_file='/var/nagios/status.dat' \
    check_icmp_path='/usr/share/nagios/libexec/check_icmp' \
    apache_config_dir='/etc/httpd/conf/extra' \
    livesock='/var/nagios/rw/live' \
      ./setup.sh
  # Fix python shebangs:
  cd "${pkgdir}"
  for f in `cat "${srcdir}/files_shebang.txt"`; do
    echo "#!/usr/bin/python2" > "${f}.new"
    cat "${f}" | tail -n +2 >> "${f}.new"
    cat "${f}.new" > "${f}"
    rm -f "${f}.new"
  done
  # Fix other python2 stuff:
  patch "./usr/share/check_mk/check_mk_templates.cfg" "${srcdir}/check_mk_templates.cfg.patch"
  patch "./usr/share/check_mk/web/htdocs/index.py" "${srcdir}/index.py.patch"
  patch "./usr/bin/mkp" "${srcdir}/mkp.patch"
  patch "./usr/bin/check_mk" "${srcdir}/check_mk.patch"
  patch "./usr/share/check_mk/modules/check_mk.py" "${srcdir}/check_mk.py.patch"
  patch "./usr/share/check_mk/agents/special/agent_vsphere" "${srcdir}/agent_vsphere.patch"
  # Add symlinks for the agent:
  mkdir -p "./usr/bin" "./etc/xinetd.d"
  ln -s "/usr/share/check_mk/agents/check_mk_agent.linux" "./usr/bin/check_mk_agent"
  ln -s "/usr/share/check_mk/agents/xinetd.conf" "./etc/xinetd.d/check_mk"
  ln -s "/usr/share/check_mk/agents/waitmax" "./usr/bin/waitmax"
  # Remove docs if the user wants it:
  [[ "${_rtfm}" = "n" ]] && rm -rf "./usr/share/doc"
  # Remove agents if the user wants it:
  if [[ "${_other_agents}" = "n" ]]; then
    rm -rf "./usr/share/check_mk/agents/windows/"
    rm -f "./usr/share/check_mk/agents/check_mk_agent."{freebsd,macosx,openvms,netbsd,aix,hpux,solaris,openbsd}
  fi
}
