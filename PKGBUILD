# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# From core
# $Id: PKGBUILD 241146 2015-06-21 01:47:41Z eric $
# Contributor: Eric Bélanger <eric@archlinux.org>

set -u
_pkgname='inetutils'
pkgname="${_pkgname}-git"
pkgver=1.9.4.r11.g050928b
pkgrel=1
_srcdir="${_pkgname}"
pkgdesc='A collection of common network programs'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/inetutils/'
license=('GPL3')
#groups=('base')
depends=('pam' 'libcap')
makedepends=('help2man' 'git' 'autoconf')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
backup=('etc/xinetd.d'/{telnet,talk,rlogin,rsh}
        'etc/pam.d'/{rlogin,rsh})
options=('!emptydirs')
install="${_pkgname}.install"
_verurl='http://ftp.gnu.org/gnu/inetutils/'
_versed='inetutils-\([0-9\.]\+\)\.tar\.gz'
_veropt='l'
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
source=("git://git.savannah.gnu.org/${_pkgname}.git"
        'git://git.sv.gnu.org/gnulib') # This link must be the same as the one in bootstrap
_archsource=(
        'ftpd.service'
        'rlogin'{.pam,@.service,.socket,.xinetd}
        'rsh'{.pam,@.service,.socket,.xinetd}
        'talk'{.service,.socket,.xinetd}
        'telnet'{@.service,.socket,.xinetd}
)
for _src in "${_archsource[@]}"; do
  source+=("${_archlink//@@@/${_src}}")
done
unset _src _archlink
sha256sums=('SKIP'
            'SKIP'
            'f1b9b4e57f484070366444a649f1be151d01d5bc965b9b192c242e4b7cc4beeb'
            '428367b148033c7fa865e92bdd73b06cb58e6909488649adebf8d2253a022f1f'
            '6112bcdb595937a8c7940dc158a97fd48b8cce6526a9fb017f347f614b9d6548'
            '4d1c1eef689be2caf26435e38f7e37337fdfd642a0c1e32aa60a9e94b2983df5'
            'c5ff9a299f4b09bc097069e8a4987f6db495083fb7b11443e390cabfdf230165'
            '6317e1e62f0dcf32ac99334bafdc8972b4967048456448ef1e2458219661bf18'
            'c726f53023b42e2b0f0dc12ef5989914bc7050855967b3e5263112bb8e75b0c5'
            'c17a00bbc75edae1131cab216189cc1c0157d4de91d8c9155cc2a496b8b2aa2d'
            '5d8852f3961ea9b1aec7d50b84ddde4746ddbf4f6c5ed67cb419ab56e79d4762'
            '73f368fae50ce6107846f156d667dbc3e60428cc1f0976ab6ca82d34bd8eff82'
            '91f135996131daf07c51cf76756c2064270d9f5b74b863c36055a0b5e08e80c7'
            '0f5799a8d9a8a7ad28ff99ee022b1e742b6e5cfd1ba451339173d6eb75624bab'
            '5df7e1f283366dbf57b7ecd98fbc503aa42bac2fc3084ae98b866ef261d98d55'
            '7f84e6a9ad2d28ddc440aab95359c14c633deb5e9bb7a0df7a46a3d54c1aefc5'
            'b019c8d8130a5dcda5dacd988a7e35e21e34738ff4d6b4cfe39be83a413ec8ac')
#validpgpkeys=('4FBD67621082C4C502448E3B180551BAD95A3C35')

pkgver() {
  cd "${_srcdir}"
  git describe --long | sed -e "s:^${_pkgname}-::g" -e 's:_:.:g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

prepare() {
  set -u
  cd "${_srcdir}"
  ln -sf '../gnulib'
  ./bootstrap
  ./configure --prefix='/usr' --libexec='/usr/bin' \
    --localstatedir='/var' --sysconfdir='/etc' \
    --without-wrap --with-pam \
    --enable-ftp --enable-ftpd \
    --enable-telnet --enable-telnetd \
    --enable-talk --enable-talkd \
    --enable-rlogin --enable-rlogind \
    --enable-rsh --enable-rshd \
    --enable-rcp --enable-hostname --enable-dnsdomainname \
    --disable-rexec --disable-rexecd \
    --disable-tftp --disable-tftpd \
    --disable-ping --disable-ping6 \
    --disable-logger --disable-syslogd \
    --disable-inetd --disable-whois \
    --disable-uucpd --disable-ifconfig --disable-traceroute
  # telnetd disconnects without banner on 90% of connections
  # http://lists.gnu.org/archive/html/bug-inetutils/2015-07/msg00006.html
  # http://lists.gnu.org/archive/html/bug-inetutils/2015-08/index.html
  sed -i -e 's:if (pty_read () <= 0):if (pty_read () < 0):g' 'telnetd/telnetd.c'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j $(nproc)
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  make -s check
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s DESTDIR="${pkgdir}" install

  chmod -s "${pkgdir}/usr/bin"/{rcp,rlogin,rsh}

  local _src
  for _src in "${_archsource[@]}"; do
    case "${_src}" in
    *.xinetd)           install -Dpm644 "${srcdir}/${_src}" "${pkgdir}/etc/xinetd.d/${_src%.xinetd}";;
    *.pam)              install -Dpm644 "${srcdir}/${_src}" "${pkgdir}/etc/pam.d/${_src%.pam}";;
    *.service|*.socket) install -Dpm644 "${srcdir}/${_src}" -t "${pkgdir}/usr/lib/systemd/system/";;
    esac
  done
  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  ! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; false; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; false; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; false; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  # Only found in help files
  #! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; false; }
  # Only found in help files
  #! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  # Only found in help files
  #! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
}
set +u
