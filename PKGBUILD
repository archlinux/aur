# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Burgess Chang <open@brsvh.org>

pkgname=bash-xdg-dirs-git
_basever=5.1
_patchlevel=008
pkgver=5.1.008.162.gcdc66e81
pkgrel=1
pkgdesc='The GNU Bourne Again shell (XDG Base Direcotry support)'
arch=(x86_64)
license=(GPL)
url='https://www.gnu.org/software/bash/bash.html'
backup=(etc/bash.bash{rc,_logout} etc/skel/.config/bash/{bashrc,profile,logout})
depends=(readline libreadline.so glibc ncurses)
optdepends=('bash-completion: for tab completion')
provides=('bash' 'sh')
conflicts=('bash')
source=('git+https://github.com/brsvh/bash-xdg-dirs#branch=feature/xdg-dirs'
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/dot.bashrc'
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/dot.bash_profile'
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/dot.bash_logout'
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/system.bashrc'
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/bash/trunk/system.bash_logout')
validpgpkeys=('7C0135FB088AAF6C66C650B9BB5869F064EA74AB') # Chet Ramey

if [[ $((10#${_patchlevel})) -gt 0 ]]; then
  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    source=(${source[@]} https://ftp.gnu.org/gnu/bash/bash-$_basever-patches/bash${_basever//.}-$(printf "%03d" $_p))
  done
fi

pkgver() {
  cd bash-xdg-dirs/
  printf '%s.%s.%s.g%s' "${_basever}" "${_patchlevel}"  "$(git rev-list --count feature/xdg-dirs)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd bash-xdg-dirs/
  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    echo "applying patch bash${_basever//.}-$(printf "%03d" $_p)"
    patch -p0 -i ../bash${_basever//.}-$(printf "%03d" $_p)
  done
}

build() {
  cd bash-xdg-dirs/

  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/bash.bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash.bash_logout\"\'
               -DNON_INTERACTIVE_LOGIN_SHELLS
	       -DXDG_BASE_DIRECTORY)
  export CFLAGS="${CFLAGS} ${_bashconfig[@]}"

  ./configure \
    --prefix=/usr \
    --with-curses \
    --enable-readline \
    --without-bash-malloc \
    --with-installed-readline
  make
}

check() {
  make -C bash-xdg-dirs check
}

package() {
  make -C bash-xdg-dirs DESTDIR="$pkgdir" install
  ln -s bash "$pkgdir/usr/bin/sh"

  # system-wide configuration files
  install -Dm644 system.bashrc "$pkgdir/etc/bash.bashrc"
  install -Dm644 system.bash_logout "$pkgdir/etc/bash.bash_logout"

  # user configuration file skeletons
  install -dm755 "$pkgdir/etc/skel/.config/bash"
  install -dm755 "$pkgdir/etc/skel/.cache/bash"
  install -m644 dot.bashrc "$pkgdir/etc/skel/.config/bash/bashrc"
  install -m644 dot.bash_profile "$pkgdir/etc/skel/.config/bash/profile"
  install -m644 dot.bash_logout "$pkgdir/etc/skel/.config/bash/logout"
}

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# vim: ts=2 sw=2 et:
