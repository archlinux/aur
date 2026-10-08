# Maintainer: slondr
# Contributor: Joshua Ward <joshuaward@myoffice.net.au>
# Contributor: Eric Biggers <ebiggers3@gmail.com>
# Contributor: Collen Jones <collenjones@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=nethack-git
_pkgname=NetHack
pkgver=5.0.0_Release+r19759+gcb453720b
pkgrel=1
pkgdesc='A single player dungeon exploration game'
arch=('x86_64')
url='https://github.com/NetHack/NetHack'
license=('NGPL')
depends=('ncurses' 'gzip')
optdepends=('gdb: backtraces on panic')
makedepends=(git)
_branch=NetHack-5.0
source=("git+https://github.com/NetHack/NetHack.git#branch=${_branch}" nethack.tmpfiles)
sha256sums=('SKIP'
  'b4077a48b9ccc184014806fbdc52c2b1c709d9ab9401445751a7089e9f436645')
conflicts=('nethack')
provides=('nethack')
backup=('etc/nethack/sysconf')

pkgver() {
  cd "${_pkgname}"
  local _version _commits _short_commit_hash
  _version=$(git describe --tags --abbrev=0 | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'NetHack.'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd "${_pkgname}"

  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
    -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' \
    -i include/unixconf.h

  # we are setting up for setgid games, so modify all necessary permissions
  # to allow full access for groups

  # With thanks to bugtracker user loqs for the CFLAGS and LDFLAGS adjustments
  sed -e 's|NHCFLAGS+=-DHACKDIR=\\".*\\"|NHCFLAGS+=-DHACKDIR=\\"/var/games/nethack/\\"|' \
    -e 's|NHCFLAGS+=-DSYSCF -DSYSCF_FILE=\\"$(HACKDIR)/sysconf\\"|NHCFLAGS+=-DSYSCF -DSYSCF_FILE=\\"/etc/nethack/sysconf\\"|' \
    -i sys/unix/hints/linux.501

  # Fix the way they disable __warn_unused_result__
  sed '/^#define __warn_unused_result__/ s,/\*empty\*/,__unused__,' \
    -i include/tradstdc.h

  sed -e 's|^#GAMEUID.*|GAMEUID = root|' \
    -e 's|^#GAMEGRP.*|GAMEGRP = games|' \
    -e '/^FILEPERM\s*=/ s|0644|0664|' \
    -e '/^DIRPERM\s*=/ s|0755|0775|' \
    -i sys/unix/Makefile.top
}

build() {
  cd "$srcdir/$_pkgname/sys/unix"
  sh setup.sh hints/linux.501
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "${_pkgname}"

  install -dm755 "$pkgdir"/usr/share/{man/man6,doc/nethack}
  install -dm775 "$pkgdir"/var/games/
  make HACKDIR="$pkgdir/var/games/nethack" \
    SHELLDIR="$pkgdir/usr/bin" \
    VARDIR="$pkgdir/var/games/nethack" \
    INSTDIR="$pkgdir/var/games/nethack" \
    MANDIR="$pkgdir/usr/share/man/man6" \
    -j1 install manpages
  sed -e "s|HACKDIR=$pkgdir/|HACKDIR=/|" \
    -e 's|HACK=$HACKDIR|HACK=/usr/lib/nethack|' \
    -i "$pkgdir"/usr/bin/nethack

  install -dm755 "$pkgdir"/usr/lib/nethack
  mv "$pkgdir"/var/games/nethack/{nethack,recover} "$pkgdir"/usr/lib/nethack/

  install -dm755 "$pkgdir"/etc/nethack
  mv "$pkgdir"/var/games/nethack/sysconf "$pkgdir"/etc/nethack/sysconf

  install -vDm 644 ../nethack.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/nethack.conf"

  install -Dm644 doc/Guidebook.txt "$pkgdir"/usr/share/doc/nethack/Guidebook.txt
  install -Dm644 dat/license "$pkgdir"/usr/share/licenses/nethack/LICENSE
}
