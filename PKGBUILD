# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Ermenegildo Fiorito <fiorito.g@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Rickey Visinski <rickeyvisinski at gmail.com>

set -u
pkgname='nmap'
#pkgname+='-git'
pkgname+='-svn'
pkgver=7.80.r37760
pkgrel=1
pkgdesc='Utility for network discovery and security auditing'
url='https://nmap.org/'
arch=('x86_64')
license=('GPL2')
depends=('pcre' 'openssl' 'lua')
makedepends=('pygtk')
optdepends=('pygtk: zenmap'
            'sudo: privilege escalation for zenmap'
            'xterm: privilege escalation for zenmap'
            'kde-cli-tools: privilege escalation for zenmap')
_srcdir="${pkgname%-*}-${pkgver}"
source=("https://nmap.org/dist/${_srcdir}.tar.bz2")
md5sums=('d37b75b06d1d40f27b76d60db420a1f5')
sha256sums=('fcfa5a0e42099e12e4bf7a68ebe6fde05553383a682e816a7ec9256ab4773faa')
sha512sums=('d4384d3ebf4f3abf3588eed5433f733874ecdceb9342a718dc36db19634b0cc819d73399974eb0a9a9c9dd9e5c88473e07644ec91db28b0c072552b54430be6b')

if [ "${pkgname%-*}" != "${pkgname}" ]; then
  _srcdir="${pkgname}"
  case "${pkgname}" in
  *'-git') source[0]="${_srcdir}::git://github.com/nmap/nmap.git"; makedepends+=('git');;
  *'-svn') source[0]="${_srcdir}::svn+https://svn.nmap.org/${pkgname%-svn}/"; makedepends+=('svn');;
  esac
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  sha512sums[0]='SKIP'
  provides=("${pkgname%-*}=${pkgver%%.r*}")
  conflicts=("${pkgname%-*}")
pkgver() {
  set -u
  cd "${_srcdir}"
  local _v='s:^#define NMAP_UPDATE_CHANNEL "([^"]+)".*$:\1:p'
  _v="$(sed -E -n -e "${_v}" 'nmap.h')"
  case "${pkgname}" in
  *'-git') printf '%s.r%s.g%s' "${_v}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)";;
  *'-svn') printf '%s.r%s' "${_v}" "$(svnversion)";;
  esac
  set +u
}
fi

build() {
  set +u
  cd "${_srcdir}"
  export PYTHON='python2'
  ./configure \
    --prefix='/usr' \
    --libexecdir='/usr/lib' \
    --mandir='/usr/share/man' \
    --with-libpcap='included' \

  make
  set -u
}

package() {
  set +u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/bin/uninstall_*
  install -Dm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 -m compileall "${pkgdir}/usr/lib/python2.7/site-packages/zenmapCore"
  set -u
}
set +u
