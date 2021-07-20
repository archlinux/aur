# Merged with official ABS bash PKGBUILD by João, 2021/07/19 (all respective contributors apply herein)
# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=bash-git
pkgver=5.1_r171.gce237286
pkgrel=2
pkgdesc='The GNU Bourne Again shell'
arch=($CARCH)
license=(GPL)
url='https://www.gnu.org/software/bash/bash.html'
backup=(etc/bash.bash{rc,_logout} etc/skel/.bash{rc,_profile,_logout})
depends=(readline libreadline.so glibc ncurses)
makedepends=(git)
optdepends=('bash-completion: for tab completion')
conflicts=(${pkgname%-git})
provides=(sh ${pkgname%-git})
source=(git+https://git.savannah.gnu.org/git/bash.git
        dot.bashrc
        dot.bash_profile
        dot.bash_logout
        system.bashrc
        system.bash_logout)
sha256sums=('SKIP'
            '3e22bf86ae6708df7a6bceb88c67a00118275f9c0b5268f453dd388af7c43b53'
            'e149407c2bee17779caec70a7edd3d0000d172e7e4347429b80cb4d55bcec9c2'
            '4330edf340394d0dae50afb04ac2a621f106fe67fb634ec81c4bfb98be2a1eb5'
            '5fdc20c44bc9058f728d11111327f4dbb5598fec4d948dd5265211598667f9f0'
            '025bccfb374a3edce0ff8154d990689f30976b78f7a932dc9a6fcef81821811e')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 '@set VERSION' doc/version.texi | cut -d ' ' -f3 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

# prepare() {
#   wget -q --show-progress --no-parent -nd -r https://ftp.gnu.org/gnu/bash/bash-$pkgver-patches/
#   rm *.sig
# 
#   cd ${pkgname%-git}
#   for patch in ../bash${pkgver//.}*; do
#     patch -p0 -i $patch
#   done
# }

build() {
  cd ${pkgname%-git}

  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/bash.bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash.bash_logout\"\'
               -DNON_INTERACTIVE_LOGIN_SHELLS)
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
#   make -C ${pkgname%-git} check
# }

package() {
  make -C ${pkgname%-git} DESTDIR="$pkgdir" install
  ln -s bash "$pkgdir/usr/bin/sh"

  # system-wide configuration files
  install -Dm644 system.bashrc "$pkgdir/etc/bash.bashrc"
  install -Dm644 system.bash_logout "$pkgdir/etc/bash.bash_logout"

  # user configuration file skeletons
  install -dm755 "$pkgdir/etc/skel/"
  install -m644 dot.bashrc "$pkgdir/etc/skel/.bashrc"
  install -m644 dot.bash_profile "$pkgdir/etc/skel/.bash_profile"
  install -m644 dot.bash_logout "$pkgdir/etc/skel/.bash_logout"
}
