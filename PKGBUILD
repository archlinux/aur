# Maintainer: Burgess Chang<bsc@brsvh.org>

pkgname=bash-xdg
_basever=5.1
_patchlevel=016
pkgver=${_basever}.${_patchlevel}
pkgrel=1
pkgdesc='The GNU Bourne Again shell - with improved Support for the XDG Base Directory Specification'
arch=(x86_64)
license=(GPL)
url='https://www.gnu.org/software/bash/bash.html'
depends=(readline libreadline.so glibc ncurses)
optdepends=('bash-completion: for tab completion')
provides=('bash' 'sh')
source=(https://ftp.gnu.org/gnu/bash/bash-$_basever.tar.gz
        customize-default-files.patch
        bashrc
        bash_logout)

if [[ $((10#${_patchlevel})) -gt 0 ]]; then
  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    source=(${source[@]} https://ftp.gnu.org/gnu/bash/bash-$_basever-patches/bash${_basever//.}-$(printf "%03d" $_p))
  done
fi

prepare() {
  cd $pkgname-$_basever

  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    echo "applying patch bash${_basever//.}-$(printf "%03d" $_p)"
    patch -p0 -i ../bash${_basever//.}-$(printf "%03d" $_p)
  done
  echo "applying patch customize-default-files"
  patch -p1 -i ../customize-default-files.patch
}

build() {
  cd $pkgname-$_basever

  _bashconfig=(-DDEFAULT_PROFILE=\'\"~/.config/profile\"\'
               -DDEFAULT_BASHRC=\'\"~/.config/bash/bashrc\"\'
               -DDEFAULT_BASH_PROFILE=\'\"~/.config/bash/bash_profile\"\'
               -DDEFAULT_BASH_LOGOUT=\'\"~/.config/bash/bash_logout\"\'
               -DDEFAULT_BASH_LOGIN=\'\"~/.config/bash/bash_login\"\'
               -DDEFAULT_BASH_HISTORY=\'\"~/.cache/bash/bash_history\"\'
               -DDEFAULT_SH_HISTORY=\'\"~/.cache/sh/sh_history\"\'
               -DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DNON_INTERACTIVE_LOGIN_SHELLS
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/bash/bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash/bash_logout\"\')
  export CFLAGS="${CFLAGS} ${_bashconfig[@]}"

  ./configure \
    --prefix=/usr \
    --with-curses \
    --enable-readline \
    --without-bash-malloc \
    --with-installed-readline
  make
}

# check() {
#   make -C $pkgname-$_basever check
# }

package() {
  make -C $pkgname-$_basever DESTDIR="$pkgdir" install
  ln -s bash "$pkgdir/usr/bin/sh"

  install -dm755 "$pkgdir/etc/bash"

  install -Dm644 bashrc "$pkgdir/etc/bash/bashrc"
  install -Dm644 bash_logout "$pkgdir/etc/bash/bash_logout"

  install -dm755 "$pkgdir/etc/skel/.config/bash"
  install -dm755 "$pkgdir/etc/skel/.cache/bash"
  install -dm755 "$pkgdir/etc/skel/.cache/sh"
}

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# vim: ft=bash ts=2 sw=2 et:
