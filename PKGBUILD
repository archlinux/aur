# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens at archlinux.us>

# TODO: I can't get the function keys to work

# Finish install: https://github.com/sergev/bash-commander
# add to ~/.bashrc
cmd1="
declare -x EDITOR='le'
declare -x VIEWER='le --read-only'
[ -s '/etc/bash_commander' ] && source '/etc/bash_commander'
"
# bashc
# Enter or ^O for panels

# To jump from panels to command line: Hit ^O

# To exit: Hit ^D

# Next login will be bash with blue prompt. No panels. Run bashc to get panels.

# To clean up after remove:
# remove lines from ~/.bashrc
# sudo rm -f '/etc/bash_commander' '/etc/bash_dialog'

# Demo without modifying .bashrc
# bashc # not a colored prompt, ^O does not bring up panels
# source '/etc/bash_commander' # now a colored prompt. source does not load a shell. It only sets variables.
# Hit Enter or ^O for panels, ^O for command line
# ^D to exit bashc back to bash

# Faster demo
# bashc --init-file <(echo "source '/etc/bash_commander'")

set -u
_pkgname='bash-commander'
pkgname='bashc'
_pkgver='5.2' # no release tags, scan git history for current version
pkgver=5.2.r223.c51f3c4
pkgrel=1
pkgdesc='Bash Commander is the GNU Bourne Again shell extended with two-panel OFM file manager.'
#url='http://Groups.google.com/group/bashc'
#url='http://sourceforge.net/projects/bashc/'
arch=('i686' 'x86_64')
url='https://github.com/sergev/bash-commander'
license=('GPL')
depends=('ncurses' 'bash' 'dialog')
makedepends=('git' 'cmake')
backup=('etc/bash_commander' 'etc/bash_dialog')
install="${pkgname}.install"
#source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tgz")
_srcdir="${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  printf '%s.r%s.%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  local _seds=(
    -e '# gets binary in right place, still need to move /etc'
    -e '/cmake -B/ s:$: -DCMAKE_INSTALL_PREFIX=/usr:g'
    -e '# make install is not allowed to build'
    -e '/^install:/ s:build::g'
  )
  sed -E "${_seds[@]}" -i 'Makefile'
  set +u

}

build() {
  set -u
  cd "${_srcdir}"
  # cmake is called by the Makefile
  nice make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  if :; then
    cd "${pkgdir}"
    install -d "${pkgdir}/etc/${pkgbase}"
    #rm -rf "${pkgdir}/usr/share"
    #rm -f "${pkgdir}/usr/bin/bashbug"
    install -dm755 'etc'
    mv usr/etc/* etc/
    rmdir usr/etc
    sed -e 's:/usr/local/etc/:/etc/:g' -i 'etc/bash_commander'
  fi
  set +u
}
set +u
