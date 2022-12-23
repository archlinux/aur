
pkgname=psh-git
_basever=5.2.15
_patchlevel=0
pkgver=${_basever}.${_patchlevel}
pkgrel=1
_reponame=psh
pkgdesc='The Pig Shell'
arch=(x86_64)
license=(GPL)
url='https://github.com/Easonqsp/psh'
backup=(etc/psh.psh{rc,_logout} etc/skel/.psh{rc,_profile,_logout})
depends=(readline libreadline.so glibc ncurses)
optdepends=()
source=("git+https://github.com/Easonqsp/psh.git"
        dot.pshrc
        dot.psh_profile
        dot.psh_logout
        system.pshrc
        system.psh_logout)
if [[ $((10#${_patchlevel})) -gt 0 ]]; then
  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    source=(${source[@]} https://ftp.gnu.org/gnu/psh/psh-$_basever-patches/psh${_basever//.}-$(printf "%03d" $_p){,.sig})
  done
fi

prepare() {
  cd $_reponame

  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    echo "applying patch psh${_basever//.}-$(printf "%03d" $_p)"
    patch -p0 -i ../psh${_basever//.}-$(printf "%03d" $_p)
  done
}

build() {
  cd $_reponame

  _pshconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/psh.pshrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/psh.psh_logout\"\'
               -DNON_INTERACTIVE_LOGIN_SHELLS)
  export CFLAGS="${CFLAGS} ${_pshconfig[@]}"

  ./configure \
    --prefix=/usr \
    --with-curses \
    --enable-readline \
    --without-psh-malloc \
    --with-installed-readline
  make
}

check() {
  make -C $_reponame check
}

package() {
  make -C $_reponame DESTDIR="$pkgdir" install
  #ln -s psh "$pkgdir/usr/bin/sh"

  # system-wide configuration files
  install -Dm644 system.pshrc "$pkgdir/etc/psh.pshrc"
  install -Dm644 system.psh_logout "$pkgdir/etc/psh.psh_logout"

  # user configuration file skeletons
  install -dm755 "$pkgdir/etc/skel/"
  install -m644 dot.pshrc "$pkgdir/etc/skel/.pshrc"
  install -m644 dot.psh_profile "$pkgdir/etc/skel/.psh_profile"
  install -m644 dot.psh_logout "$pkgdir/etc/skel/.psh_logout"
}

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# vim: ts=2 sw=2 et:
