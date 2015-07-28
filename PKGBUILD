# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens at archlinux.us>

set -u
pkgname='bashc'
pkgver='3.2.33.0'
pkgrel='4'
pkgdesc='A version of the GNU Bourne Again shell extended with two-panel OFM file manager.'
url='http://Groups.google.com/group/bashc'
#url='http://sourceforge.net/projects/bashc/'
#url='https://github.com/sergev/bash-commander'
depends=('ncurses')
license=('GPL')
install="${pkgname}.install"
arch=('i686' 'x86_64')
backup=('etc/bash_commander' 'etc/bash_dialog')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tgz")
sha256sums=('d8cd2a20628ab6aee7d89ec4e3a0163d2b1cb4d7d3e135af3f82474c5d3e6cb8')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/' --bindir='/usr/bin' --sbindir='/usr/bin' --sysconfdir="/etc/${pkgname}" --with-curses
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j $(nproc)
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Ensure there are no forbidden paths (git-aurcheck)
  #! grep -alqr "/sbin" "${pkgdir}" || echo "${}" # Only one instance left and it's POSIX
  #! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}" # This is fail over so it's OK
  ! test -d "${pkgdir}/usr/sbin" || echo "${}"
  set +u
}
set +u
