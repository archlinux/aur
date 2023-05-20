# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Carlos Pita <carlosjosepita@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=bash-devel-git
pkgver=5.2.r1171.ge44e3d50
pkgrel=1
pkgdesc="The GNU Bourne Again shell (development version)"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/bash/bash.html"
license=('GPL')
depends=('glibc' 'ncurses' 'readline>=7.0')
makedepends=('git')
optdepends=('bash-completion: for tab completion')
provides=("bash=$pkgver" 'sh')
conflicts=('bash')
backup=(etc/bash.bash{rc,_logout} etc/skel/.bash{rc,_profile,_logout})
source=("git+https://git.savannah.gnu.org/git/bash.git#branch=devel"
        "dot.bash_logout::https://gitlab.archlinux.org/archlinux/packaging/packages/bash/-/raw/main/dot.bash_logout"
        "dot.bash_profile::https://gitlab.archlinux.org/archlinux/packaging/packages/bash/-/raw/main/dot.bash_profile"
        "dot.bashrc::https://gitlab.archlinux.org/archlinux/packaging/packages/bash/-/raw/main/dot.bashrc"
        "system.bash_logout::https://gitlab.archlinux.org/archlinux/packaging/packages/bash/-/raw/main/system.bash_logout"
        "system.bashrc::https://gitlab.archlinux.org/archlinux/packaging/packages/bash/-/raw/main/system.bashrc")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "bash"

  _tag=$(git tag -l --sort -v:refname | grep -E '^bash-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^bash-//'
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
