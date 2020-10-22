# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Carlos Pita <carlosjosepita@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=bash-devel-git
pkgver=r1155.g75c5460c
pkgrel=1
pkgdesc="The GNU Bourne Again shell (development version)"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/bash/bash.html"
license=('GPL')
depends=('glibc' 'ncurses' 'readline>=7.0')
makedepends=('git')
optdepends=('bash-completion: for tab completion')
provides=('bash' 'sh')
conflicts=('bash')
backup=(etc/bash.bash{rc,_logout} etc/skel/.bash{rc,_profile,_logout})
source=("git+https://git.savannah.gnu.org/git/bash.git#branch=devel"
        "dot.bash_logout::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/dot.bash_logout"
        "dot.bash_profile::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/dot.bash_profile"
        "dot.bashrc::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/dot.bashrc"
        "system.bash_logout::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/system.bash_logout"
        "system.bashrc::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/system.bashrc")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "bash"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "bash"

  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/bash.bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash.bash_logout\"\'
               -DNON_INTERACTIVE_LOGIN_SHELLS)
  export CFLAGS="$CFLAGS ${_bashconfig[@]}"

  # Note: This package does not use the system readline, as it depends on
  # a development version which is usually not ABI-compatible.
  ./configure \
    --prefix="/usr" \
    --enable-readline \
    --with-curses
  make
}

check() {
  cd "bash"

  #make check
}

package() {
  cd "bash"

  make DESTDIR="$pkgdir" install

  ln -s "bash" "$pkgdir/usr/bin/sh"

  # system-wide configuration files
  install -Dm644 "$srcdir/system.bashrc" "$pkgdir/etc/bash.bashrc"
  install -Dm644 "$srcdir/system.bash_logout" "$pkgdir/etc/bash.bash_logout"

  # user configuration file skeletons
  install -Dm644 "$srcdir/dot.bashrc" "$pkgdir/etc/skel/.bashrc"
  install -Dm644 "$srcdir/dot.bash_profile" "$pkgdir/etc/skel/.bash_profile"
  install -Dm644 "$srcdir/dot.bash_logout" "$pkgdir/etc/skel/.bash_logout"
}
