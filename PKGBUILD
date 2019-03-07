# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: garion < garion @ mailoo.org >
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>

set -u
pkgname='mysecureshell'
#pkgname+='-git'
pkgver='2.00'
pkgrel='2'
pkgdesc='A shell that adds advanced SFTP features to the OpenSSH server including ACLs, connection limits, and bandwidth control'
arch=('arm' 'i686' 'x86_64')
#url='http://mysecureshell.sourceforge.net'
#url='https://github.com/mysecureshell/mysecureshell'
url='https://mysecureshell.readthedocs.org/'
license=('GPL')
depends=('openssh')
backup=('etc/ssh/sftp_config')
install="${pkgname%-git}.install"
#source=("http://mysecureshell.free.fr/repository/index.php/source/mysecureshell_${pkgver}.tar.gz")
_srcdir="${pkgname%-git}-${pkgver}"
_giturl="https://github.com/mysecureshell/${pkgname%-git}"
_verwatch=("${_giturl}/releases" "${_giturl#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${pkgname%-git}-${pkgver}.tar.gz::${_giturl}/archive/v${pkgver}.tar.gz")
sha256sums=('05fbcc407a61a06f980581320e7df46bbb7cf2d2ae253cae79f716bda0940890')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  unset _verwatch
  makedepends+=('git')
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts+=("${pkgname%-git}")
  _srcdir="${pkgname%-git}"
  source[0]="${_giturl//https:/git:}.git"
  :;sha256sums[0]='SKIP'
pkgver() {
  set -u
  cd "${_srcdir}"
  local _vg
  _vg="$(git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g')"
  if ! :; then
    _vg="${_vg##*.r}"
    local _vc
    _vc="$(sed -ne 's:^AC_INIT(\[MySecureShell],\[\([^]]\+\)].*:\1:p' 'configure.in')"
    printf '%s.r%s' "${_vc}" "${_vg}"
  else
    printf '%s' "${_vg}"
  fi
  set +u
}
fi

build(){
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./configure --with-logcolor='yes' # --prefix='/usr' # prefix moves /etc
  fi
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make all -s -j "${_nproc}"
  set +u
}

package(){
  set -u
  cd "${_srcdir}"
  #local USER=root
  sed -e 's!MANDIR=/share/man!MANDIR=/usr/share/man!g' -i './install.sh'
  make -j1 DESTDIR="${pkgdir}" install

  chmod a+r "${pkgdir}/usr/bin/sftp-"{kill,admin,state}
  #cp -pvR 'man/fr' "${pkgdir}/usr/share/man/"
  set +u
}
set +u
