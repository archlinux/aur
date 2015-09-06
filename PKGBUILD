# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Ermenegildo Fiorito <fiorito.g@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Rickey Visinski <rickeyvisinski at gmail.com>

_svnname='nmap'
pkgname="${_svnname}-svn"
pkgver=r35224
pkgrel=1
pkgdesc="A network exploration tool and security/port scanner"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="httpss://nmap.org"
license=('GPLv2' 'custom:nmap')
depends=('pcre' 'openssl' 'libpcap>=1.0.0' 'lua52' 'libnl')
makedepends=('python2' 'subversion') # python is needed for zenmap
optdepends=('pygtk: zenmap'
            'sudo: privilege escalation for zenmap'
            'xterm: privilege escalation for zenmap'
            'kdebase-runtime: privilege escalation for zenmap'
            'gksu: privilege escalation for zenmap')
options=('!makeflags')
source=("svn+https://svn.nmap.org/${_svnname}/")
provides=("${_svnname}")
conflicts=("${_svnname}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_svnname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${_svnname}"

  sed -i 's# @LIBS@# @LIBS@ -lnl-3#' ncat/Makefile.in

  ./configure \
    --prefix=/usr \
    PYTHON="python2" \
    --libexecdir=/usr/lib \
    --mandir=/usr/share/man \
    --with-libpcap=included \
    --with-openssl=/usr \
    --with-liblua=included

  cd "ncat/"
  make
  cd "../"
  make
}

package() {
  cd "${srcdir}/${_svnname}"
  make DESTDIR="${pkgdir}" install
  python2 -m compileall "${pkgdir}/usr/lib/python2.7/site-packages/zenmapCore"

  # remove zenmap uninstall script
  rm "${pkgdir}/usr/bin/uninstall_zenmap"

  # install custom GPL2 license
  install -Dm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et sw=2 sts=2 tw=80:
