# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=open-av4ms
pkgname="${_pkgname}-git"
pkgver=1.5+1.r7.20181017.e7ac570
pkgrel=6
pkgdesc="Log and monitor the serial output of the MiMH/ NiCd battery chargers 'AV4m+'/ 'AV4ms'."
url='https://gitlab.com/corbolais/open-av4ms'
arch=(
  'any'
)
license=('GPL-3.0-or-later')
provides=(
  "${_pkgname}=${pkgver}"
  "av4ms-server=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "av4ms-server"
)
makedepends=(
  'git'
)
depends=(
  'python2'
  'python2-daemon'
  'python2-netifaces'
  'python2-pyro3'
  'python2-pyserial'
)
optdepends=(
  'logrotate: To rotate the webserver logs.'
  'sysvinit: For system-V-style initscript.'
  'wget: For av4update Raspian(!) helper script.'
)
backup=(
  'etc/open-av4ms/av4server.conf'
  'etc/open-av4ms/Password.py'
  'etc/logrotate.d/av4server'
)
install='open-av4ms.install'
options=('emptydirs')
source=(
  "${_pkgname}::git+${url}.git"
  "arch-adaption.patch"
  "python2.patch"
  "${install}"
)
sha256sums=(
  'SKIP'
  'ee58fc4f947f307dbb1e424809ee691acb68391af6be8369286dae8fc08e234d'
  '68f44564cfe7bb9199e3a9d781ca681a645d5c50a1dd9ea6875a030a78177264'
  '01760fc8c5b37a86c4b37f48923bde6aaad302a94161f84bb253671d613beaf3'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Patching software Arch Linux ready ..."
  patch -N -p1 --follow-symlinks -i "${srcdir}/arch-adaption.patch"

  msg2 "Patching shebang line to be explicitly 'python2' ..."
  patch -N -p1 --follow-symlinks -i "${srcdir}/python2.patch"

  printf '%s\n' "${url}" > "${srcdir}/website.url"
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep -E '^[[:space:]]*Version:[[:space:]]' 'debian/control' | awk '{print $2}' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
  return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

# build() {
#   cd "${srcdir}/${_pkgname}"
# }

package() {
  cd "${srcdir}/${_pkgname}"


  ## The python version for site-packages:
  _pythonversion="$(pacman -Qi python2 | grep -E '^[[:space:]]*Version[[:space:]]*:' | awk -F ':' '{print $2}' | tr -d '[[:space:]]' | awk -F. '{print $1"."$2}')"


  ## User and group the webserver should run as:
  _user="av4ms-server"
  _group="${_user}"


  ## Install helper executables:
  for _bin in "usr/local/bin/av4config"; do
    install -D -m755 -v   "${_bin}"                                     "${pkgdir}/usr/bin/$(basename "${_bin}")"
  done


  ## Install main executables:
  for _pybin in "home/www"/{av4server.py,webserver.py}; do
    install -D -m755 -v   "${_pybin}"                                   "${pkgdir}/usr/lib/${_pkgname}/$(basename "${_pybin}")"
  done
  ln -sv                  "/usr/lib/${_pkgname}/av4server.py"  "${pkgdir}/usr/bin/av4server"
  ln -sv                  "/usr/lib/${_pkgname}/webserver.py"  "${pkgdir}/usr/bin/av4webserver"


  ## Install python modules:
  for _pymodule in "home/www"/{Pages.py,SockServer.py,Status.py,av4analyse.py,av4logbuch.py}; do
    install -D -m644 -v   "${_pymodule}"                                "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/${_pkgname}/$(basename "${_pymodule}")"
  done
  for _odslib in "home/www/odslib"/*; do
    install -D -m644 -v   "${_odslib}"                                  "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/${_pkgname}/odslib/$(basename "${_odslib}")"
  done


  ## Install files to be served directly by the webserver:
  for _static in "home/www/static"/*; do
    install -D -m644 -v   "${_static}"                                  "${pkgdir}/usr/share/${_pkgname}/static/$(basename "${_static}")"
  done


  ## Install SysV initscripts:
  install -D -m755 -v     'etc/init.d/av4server'                        "${pkgdir}/etc/rc.d/av4server"
  install -D -m755 -v     'etc/init.d/webserver'                        "${pkgdir}/etc/rc.d/av4webserver"


  ## Install configuration files:
  install -D -m644 -v     'etc/av4server.conf'                          "${pkgdir}/etc/${_pkgname}/av4server.conf"
  install -D -m644 -v     "home/www/Password.py.dist"                   "${pkgdir}/etc/${_pkgname}/Password.py"
  install -D -m644 -v     'etc/logrotate.d/av4server'                   "${pkgdir}/etc/logrotate.d/av4server"


  ## Create logging and pidfile directories:
  install -d -m755 -v                                                   "${pkgdir}/var/log/${_pkgname}"
  install -d -m755 -v                                                   "${pkgdir}/var/log/${_pkgname}/av4server"
  install -d -m755 -v                                                   "${pkgdir}/var/log/${_pkgname}/av4server/av4logs"
  install -d -m755 -v                                                   "${pkgdir}/run/${_pkgname}"
  install -d -m755 -v                                                   "${pkgdir}/run/${_pkgname}/av4server"


  ## Install documentation:
  for _docfile in README.md; do
    install -D -m644 -v   "${_docfile}"                                 "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done


  ## Install further assets which are not needed or not safe to use:
  install -D -m755 -v     "usr/local/bin/av4update"                     "${pkgdir}/usr/share/doc/${_pkgname}/scripts/raspian/av4update"
  install -D -m755 -v     'etc/cron.weekly/av4ms-version'               "${pkgdir}/cron.weekly/av4ms-version"
  for _sysvinit in 'etc/init.d'/pilocator; do
    install -D -m755 -v   "${_sysvinit}"                                "${pkgdir}/sysvinit/init.d/$(basename "${_sysvinit}")"
  done
  install -D -m644 -v     "${srcdir}/website.url"                       "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  install -D -m644 -v     "${srcdir}/git.log"                           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"


  ## Install license:
  install -D -m644 -v     'LICENSE'                                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  ln -sv                  "/usr/share/licenses/${pkgname}/LICENSE.txt"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.txt"
}
