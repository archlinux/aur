# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens at archlinux.us>

# TODO: I can't get the function keys to work

# Finish install: https://github.com/sergev/bash-commander
# add to ~/.bashrc
#declare -x EDITOR="le"
#declare -x VIEWER="le --read-only"
#[ -s '/etc/bash_commander' ] && source '/etc/bash_commander'

# I have no idea what editor "le" is

# To test: quit mc, load bashc and hit ^O or enter on a blank line to show panels

# To jump from panels to command line: Hit ^O

# To exit: Hit ^D

# To clean up after remove:
# remove lines from ~/.bashrc
# sudo rm -f '/etc/bash_commander' '/etc/bash_dialog'

set -u
_pkgname='bash-commander'
pkgname='bashc'
_pkgver='4.3' # no release tags
pkgver=4.3.r139.c6eb92e
pkgrel=1
pkgdesc='Bash Commander is the GNU Bourne Again shell extended with two-panel OFM file manager.'
#url='http://Groups.google.com/group/bashc'
#url='http://sourceforge.net/projects/bashc/'
url="https://github.com/sergev/bash-commander"
depends=('ncurses' 'bash')
license=('GPL')
install="${pkgname}.install"
arch=('i686' 'x86_64')
backup=('etc/bash_commander' 'etc/bash_dialog')
#source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tgz")
source=("git+https://github.com/sergev/bash-commander.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  set -u
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix='/usr' --sysconfdir="/etc/${pkgname}" --with-curses --enable-readline
  sed -i -e 's:$(DESTDIR)$(prefix)/etc/:$(DESTDIR)/etc/:g' 'Makefile'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${_pkgname}"
  make -s -j $(nproc)
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_pkgname}"
  install -dm755 "${pkgdir}/etc"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share"
  rm -f "${pkgdir}/usr/bin/bashbug"
  sed -i -e 's:/usr/local/etc/:/etc/:g' "${pkgdir}/etc/bash_commander"

  # Ensure there are no forbidden paths (git-aurcheck)
  #! grep -alqr "/sbin" "${pkgdir}" || echo "${}" # Only one instance left and it's POSIX
  #! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}" # This is fail over so it's OK
  #! grep -alqr "/usr/local" "${pkgdir}" || echo "${}"
  ! test -d "${pkgdir}/usr/sbin" || echo "${}"
  set +u
}
set +u
