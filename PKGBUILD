# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgname='paranoid-telnetd'
pkgname="${_pkgname}-git"
pkgver=4.5.r0.g130b1a4
pkgrel=1
pkgdesc='ptelnetd supports chroot, allow/deny lists by user, IP and MAC, ipv6, binding to specific interfaces, and authenticates against the system or a private passwd file'
arch=('i686' 'x86_64')
#url='http://www.cjpaget.co.uk/Code/paranoid-telnetd/'
url='https://github.com/ColumPaget/ParanoidTelnetD'
license=('GPL-3.0-or-later')
depends=('glibc' 'zlib' 'libxcrypt' 'pam')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%\.r*}")
conflicts=("${_pkgname%-git}")
backup=('etc/ptelnetd.auth')
_srcdir='ParanoidTelnetD'
#options=('!strip')
source=('git+https://github.com/ColumPaget/ParanoidTelnetD.git')
sha256sums=('SKIP')

pkgver() {
  local -; set -u
  cd "${_srcdir}"
  git describe --tag --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

prepare() {
  local -; set -u
  cd "${_srcdir}"
  'ma'ke -s distclean
}

build() {
  local -; set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    CFLAGS="${CFLAGS} -g -rdynamic -Wno-unused-result" \
    ./configure --prefix='/usr' --enable-ip6 --mandir='/usr/share/man' --sbindir='/usr/bin'
  fi
  nice make -s
}

package() {
  local -; set -u
  cd "${_srcdir}"
  make -s -j1 install DESTDIR="${pkgdir}"
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

set +u
