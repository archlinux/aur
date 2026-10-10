# Maintainer: slondr
# Contributor: Joshua Ward <joshuaward@myoffice.net.au>
# Contributor: Eric Biggers <ebiggers3@gmail.com>
# Contributor: Collen Jones <collenjones@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=nethack-git
_pkgname=NetHack
pkgver=5.0.0_Release+r19762+gb1e2c2eaa
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
  'c652b09c68a21b7beb41d78cb09ab99be4bad89a9c05c0825a3ebe9759fa62b6')
conflicts=('nethack')
provides=('nethack')
backup=('etc/nethack/sysconf'
  'var/games/nethack/record'
  'var/games/nethack/logfile'
  'var/games/nethack/xlogfile'
  'var/games/nethack/livelog')

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

  # With thanks to bugtracker user loqs for the CFLAGS and LDFLAGS adjustments.
  # HACKDIR must exactly match the value the /usr/bin/nethack wrapper exports
  # (no trailing slash); NetHack drops setgid privileges on any mismatch.
  sed -e 's|NHCFLAGS+=-DHACKDIR=\\".*\\"|NHCFLAGS+=-DHACKDIR=\\"/var/games/nethack\\"|' \
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
  install -d "$pkgdir"/var/games
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
  chmod 644 "$pkgdir"/etc/nethack/sysconf

  # Permissions: the game runs setgid `games` and writes its data files
  # through group permissions. Nothing is world-writable.
  chown root:games "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games
  chown -R root:games "$pkgdir"/var/games/nethack
  find "$pkgdir"/var/games/nethack -type d -exec chmod 775 {} +
  find "$pkgdir"/var/games/nethack -type f -exec chmod 644 {} +
  chmod 664 "$pkgdir"/var/games/nethack/{perm,record,logfile,xlogfile,livelog}
  chmod 2775 "$pkgdir"/var/games/nethack/save
  chown root:games "$pkgdir"/usr/lib/nethack/nethack
  chmod 2755 "$pkgdir"/usr/lib/nethack/nethack

  install -vDm644 ../nethack.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/nethack.conf

  install -Dm644 doc/Guidebook.txt "$pkgdir"/usr/share/doc/nethack/Guidebook.txt
  install -Dm644 dat/license "$pkgdir"/usr/share/licenses/nethack/LICENSE
}
