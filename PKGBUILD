# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Eric Bélanger <eric@archlinux.org>

# TODO: package is not compatible with makepkg -Rfi

set -u
_pkgname='inetutils'
pkgname="${_pkgname}-git"
pkgver=1.9.4.r101.g393f4c6c
pkgrel=1
_srcdir="${_pkgname}"
pkgdesc='A collection of common network programs'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/inetutils/'
license=('GPL3')
#groups=('base')
depends=('pam' 'libcap' 'readline')
makedepends=('help2man' 'git' 'autoconf')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
backup=('etc/xinetd.d'/{telnet,talk,rlogin,rsh}
        'etc/pam.d'/{rlogin,rsh,telnetd})
options=('!emptydirs' '!strip')
install="${_pkgname}.install"
_verwatch=('http://ftp.gnu.org/gnu/inetutils/' 'inetutils-\([0-9\.]\+\)\.tar\.gz' 'l')
source=(
  "git://git.savannah.gnu.org/${_pkgname}.git" #commit=3d64a8c7280e7d218c4b607aa25352be1d6c4ded"
  'git://git.sv.gnu.org/gnulib'
  '0001-telnetd-Fix-buffer-overflows.patch'
  'telnetd.pam' # for now this overwrites /etc/pam.d/other until a better way or pam patch is found
) # This link must be the same as the one in bootstrap
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
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
md5sums=('SKIP'
         'SKIP'
         'a902f8c38f6db36574b928e41d2d2814'
         '6e6c8719e5989d976a14610f340bd33a'
         'fe181e22d3544456f52e64f3bdf5f291'
         'cda2aa3cd2353120b142fd33b3b4f4df'
         '7cea13f4ff7fd170fc4d03ef2698200d'
         'f4d16e649c13db9d47ad3654d1595c83'
         'bf522b381451b3fba8386f3566b37848'
         '8083b2fac54a76afb93be31d2f55dc68'
         'fc022f7959011aa2bf27d573bdcdc7dd'
         '71b8206f220d28b91aabaf9cb16038f1'
         '50c76143eadd3c004f5857d712fa05c4'
         '2b7ea36e13178c7a3b3c9b38ac7eb588'
         'bd581fa64b91ded853317334b1489346'
         'ae4539ffbabae314744aea8467125f85'
         'd7e5d8f70b7fc7321ab0e61178829b06'
         'bafd84474b3a0942307571e742dd096f'
         'ab71e7458e8ed2b9d31c48eba5ab4c3a')
sha256sums=('SKIP'
            'SKIP'
            '09210d3e7799fe93c712a0540f74ba281c61499a47af53e308ee6c3c3367b4dc'
            'de66118684a2ecec18017dd96e50a489f30465510250c007ced16f81fb542ba5'
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
  set -u
  cd "${_srcdir}"
  git describe --long | sed -e "s:^${_pkgname}-::g" -e 's:_:.:g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  # makepkg -i reruns prepare() which it should not
  if [ ! -L 'gnulib' ]; then
    ln -s '../gnulib'
    # telnetd disconnects without banner on 90% of connections
    # http://lists.gnu.org/archive/html/bug-inetutils/2015-07/msg00006.html
    # http://lists.gnu.org/archive/html/bug-inetutils/2015-08/index.html
    sed -e 's:if (pty_read () <= 0):if (pty_read () < 0):g' -i 'telnetd/telnetd.c'

    # http://lists.gnu.org/archive/html/bug-inetutils/2017-07/msg00005.html
    #patch -Nbup1 -i '../0001-telnetd-Fix-buffer-overflows.patch'
  fi

  # Disable wu-ftpd logging to wtmp. logging is worthless without anti-hammer.
  sed -e '/logwtmp_keep_open/ s:^:// :g' -i 'ftpd/ftpd.c'
  set +u
}

_configure() {
  set -u
  cd "${_srcdir}"

  if [ ! -s 'configure' ]; then
    ./bootstrap
    CFLAGS="${CFLAGS} -g -rdynamic" \
    CXXFLAGS="${CXXFLAGS} -g -rdynamic" \
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
    sed -e '/INSTALL_STRIP_PROGRAM/ s: -s::g' -i 'Makefile'
  fi
  cd "${srcdir}"
  set +u
}

build() {
  _configure
  set -u
  cd "${_srcdir}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -j "${_nproc}"
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  nice make -s -j1 check
  set +u
}

_scriptdir="/usr/share/${pkgname}"
_script="${_scriptdir}/${pkgname}.sh"

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install

  chmod -s "${pkgdir}/usr/bin"/{rcp,rlogin,rsh}

  local _src
  for _src in "${_archsource[@]}"; do
    case "${_src}" in
    *.xinetd)           install -Dpm644 "${srcdir}/${_src}" "${pkgdir}/etc/xinetd.d/${_src%.xinetd}";;
    *.pam)              install -Dpm644 "${srcdir}/${_src}" "${pkgdir}/etc/pam.d/${_src%.pam}";;
    *.service|*.socket) install -Dpm644 "${srcdir}/${_src}" -t "${pkgdir}/usr/lib/systemd/system/";;
    *) echo "Don't know where to write ${_src}"; false;;
    esac
  done

  # Install readline update detector
  install -Dpm644 <(cat << EOF
#!/bin/sh

set +e
set -u

ftp << FEOF
quit
FEOF
if [ "\$?" -ne 0 ]; then
  echo '*******************************************************************************'
  echo '*******************************************************************************'
  echo 'readline has been updated. ${pkgname} must be recompiled soon***************'
  echo '*******************************************************************************'
  echo '*******************************************************************************'
fi
EOF
  ) "${pkgdir}${_script}"
  bash -n "${pkgdir}${_script}"

  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# Check ${pkgname} on each upgrade of readline

[Trigger]
Operation = Upgrade
Type = Package
Target = readline

[Action]
Description = Check ${pkgname} for readline update
Depends = coreutils
When = PostTransaction
Exec = /usr/bin/bash "${_script}"
EOF
  ) "${pkgdir}/usr/share/libalpm/hooks/${pkgname}-readline.hook"

  # Crude but effective method for fixing pam unaware application
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# Update /etc/pam.d/other for ${pkgname} on each upgrade of pambase

[Trigger]
Operation = Upgrade
Type = Package
Target = pambase

[Action]
Description = Update /etc/pam.d/other for ${pkgname}
Depends = coreutils
When = PostTransaction
Exec = /usr/bin/cp -p /etc/pam.d/telnetd /etc/pam.d/other
EOF
  ) "${pkgdir}/usr/share/libalpm/hooks/${pkgname}-pambase-other.hook"
  install -Dpm644 "${srcdir}/telnetd.pam" "${pkgdir}/etc/pam.d/telnetd"
  set +u
}
set +u
