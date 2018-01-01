# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgname='paranoid-telnetd'
pkgname="${_pkgname}-git"
pkgver=2.0.r7.ga877d15
pkgrel=1
pkgdesc='ptelnetd supports chroot, allow/deny lists by user, IP and MAC, ipv6, binding to specific interfaces, and authenticates against the system or a private passwd file'
arch=('i686' 'x86_64')
url='http://www.cjpaget.co.uk/Code/paranoid-telnetd/'
license=('GPLv3')
depends=('pam')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%\.r*}")
conflicts=("${_pkgname%-git}")
backup=('etc/ptelnetd.auth')
_srcdir='ParanoidTelnetD'
options=('!strip')
source=('git+https://github.com/ColumPaget/ParanoidTelnetD.git')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --tag --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  'ma'ke -s distclean
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    CFLAGS="${CFLAGS} -g -rdynamic -Wno-unused-result" \
    ./configure --prefix='/usr' --enable-ip6 --mandir='/usr/share/man' --sbindir='/usr/bin'
  fi
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 install DESTDIR="${pkgdir}"
  install -Dpm644 'LICENCE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  set +u
}

set +u
