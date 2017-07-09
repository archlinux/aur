# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: vorbote
# Contributor: Fernando Jiménez Solano <fjim@sdfeu.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Link Dupont <link@subpop.net>
# Contributor: Pierre Bourdin <pierre@pi3rrot.net>

set -u
pkgname='cherokee'
pkgver=1.2.103.d021376
pkgrel=2
pkgdesc='A very fast, flexible and easy to configure Web server'
arch=('i686' 'x86_64')
url='http://cherokee-project.com'
license=('GPL2')
depends=('openssl-1.0' 'pcre' 'python2')
optdepends=('libldap: ldap validator'
            'pam: pam validator'
            'php-fpm: php5 support'
            'libmariadbclient: mysql validator'
            'ffmpeg: Audio/Video streaming handler'
            'geoip: GeoIP rule module'
            'rrdtool: RRDtool based information collector')
makedepends=('libldap' 'pam' 'libmariadbclient' 'php-fpm' 'ffmpeg' 'geoip' 'rrdtool' 'wget')
backup=('etc/cherokee/cherokee.conf'
        'etc/logrotate.d/cherokee'
        'etc/pam.d/cherokee')
options=('!libtool')
_srcdir="webserver-${pkgver}"
_verwatch=("${url}/downloads.html" 'Version \(.\+\)' 't')
_srcfile="v${pkgver}.zip"
source=("${pkgname}-${_srcfile}::https://github.com/cherokee/webserver/archive/${_srcfile}"
        'cherokee.rc'
        'cherokee.logrotate'
#       'fix-ctk-path-handler-match.patch'
#       'cherokee-1.2.101-ffmpeg0.11.patch'
        'cherokee.service')
sha256sums=('fb6390e55ae901493806cdc9bdf0a8d68ba6ac3ac76b20b05ad247c05b771311'
            '4c06cebfab8b68edd4967c020bfb41b077cfff10d76596d1ed192d0b6cedbd86'
            '20e26d633f8c1cd90eb21f41dd163b73a83846e405b1ce995e072c4efefc522e'
            '415a2e4cd7d04afe21e502dd0ad76301f85a7087cadbfdab5566bec469679a68')

prepare() {
  set -u
  cd "${_srcdir}"

  # Fix path matching bug in CTK apps (e.g. market)
  #patch -Np1 -i "${srcdir}/fix-ctk-path-handler-match.patch"

  # Fix this bug : https://bugs.mageia.org/show_bug.cgi?id=6145
  #patch -Np1 -i "${srcdir}/cherokee-1.2.101-ffmpeg0.11.patch"

  # Use subdirectory for logs
  sed -r -e 's|(%localstatedir%/log)|\1/cherokee|' -i 'cherokee.conf.sample.pre'

  # Use Python 2 in cherokee-admin
  sed -e 's|"python"|"python2"|' -i 'cherokee/main_admin.c'

  # Fix pid file location
  sed -e 's:var/run/:run/:g' -i 'admin/PageNewConfig.py'
  set +u
}

_configure() {
  set -u
  cd "${srcdir}/${_srcdir}"
  if [ ! -s 'configure' ]; then
    #CPPFLAGS="${CPPFLAGS} -I/usr/include/openssl-1.0" 
    CFLAGS="${CFLAGS} -I/usr/include/openssl-1.0" \
    LDFLAGS="${LDFLAGS} -L/usr/lib/openssl-1.0" \
    ./autogen.sh \
      --prefix='/usr' \
      --sysconfdir='/etc' \
      --localstatedir='/var' \
      --sbindir='/usr/bin' \
      --with-wwwroot='/srv/cherokee/http' \
      --with-cgiroot='/src/cherokee/cgi-bin' \
      --with-wwwuser='http' \
      --with-wwwgroup='http' \
      --disable-static \
      --with-php='/usr/bin/php-fpm' \
      --with-python='python2' \
      --enable-os-string='Arch Linux'
    #sed -e 's:^\(LIBSSL_LIBS = \).*$:\1 -lopenssl-1.0/libssl:g' -i 'Makefile'
  fi
  set +u
  cd "${srcdir}"
}

build() {
  _configure
  set -u
  cd "${_srcdir}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  make -s -j1 DESTDIR="${pkgdir}" install

  # PAM configuration file for cherokee
  install -Dpm644 'pam.d_cherokee' "${pkgdir}/etc/pam.d/${pkgname}"

  # Fix ownership of /var/lib/cherokee/graphs
  chown -R 'http:http' "${pkgdir}/var/lib/${pkgname}/graphs"

  # Use Python 2 (mostly fixed upstream, from the Cherokee PKGBUILD)
  sed -e 's/env python$/&2/' -i "${pkgdir}/usr/bin/CTK-run"
    #"${pkgdir}/usr/share/cherokee/admin/"{server,upgrade_config}.py
    #"${pkgdir}/usr/bin/"{CTK-run,cherokee-{admin-launcher,tweak}}
  #sed -r -e "s/['\"]python/&2/g" -i "${pkgdir}/usr/share/cherokee/admin/wizards/django.py"

  # Compile Python scripts
  python2 -m 'compileall' "${pkgdir}"
  python2 -O -m 'compileall' "${pkgdir}"

  install -d -o 'http' -g 'http' "${pkgdir}/var/log/${pkgname}"
  #install -Dpm755 "${srcdir}/${pkgname}.rc" "${pkgdir}/etc/rc.d/${pkgname}"
  install -Dpm644 "${srcdir}/${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
  install -Dpm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"

  # Cleanup
  rm -rf "${pkgdir}/srv"
  rmdir "${pkgdir}/var/run"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
