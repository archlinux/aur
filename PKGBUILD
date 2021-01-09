# $Id$
# Maintainer: Eden Rose(endlesseden) <eenov1988 "at"  gmail.com >
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Carlos Pita <carlosjosepita@gmail.com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=bash-devel-static-git
pkgdesc='The GNU Bourne Again shell (development version)(Static-Version)'
pkgver=4.0.alpha.r749.g5a7a52ea
pkgrel=1
url='http://www.gnu.org/software/bash/bash.html'
arch=('any')
license=('GPL')
backup=(etc/bash.bash{rc,_logout} etc/skel/.bash{rc,_profile,_logout})
makedepends=('git' 'readline-git' 'glibc-git' 'ncurses-git')
optdepends=('bash-completion: for tab completion')
provides=('sh' 'bash=$pkgver')
conflicts=('bash' 'bash-static')
source=('git+https://git.savannah.gnu.org/git/bash.git#branch=devel'
        'dot.bashrc'
        'dot.bash_profile'
        'dot.bash_logout'
        'system.bashrc'
        'system.bash_logout')
md5sums=('SKIP'
         '027d6bd8f5f6a06b75bb7698cb478089'
         '2902e0fee7a9168f3a4fd2ccd60ff047'
         '42f4400ed2314bd7519c020d0187edc5'
         'd8f3f334e72c0e30032eae1a1229aef1'
         '472f536d7c9e8250dc4568ec4cfaf294')

pkgver() {
  cd bash
  git describe --long --tags | sed -e 's/bash.//' -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd bash  
  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/bash.bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash.bash_logout\"\')
  export CFLAGS="${CFLAGS} ${_bashconfig[@]}"

  ./configure --prefix=/usr --with-curses --enable-readline \
              --with-gnu-malloc --enable-mem-scramble --enable-usg-echo-default \
	      --enable-single-help-strings --enable-select \
	      --enable-restricted --enable-progcomp --enable-process-substitution \
	      --enable-net-redirections --enable-multibyte --enable-job-control \
	      --enable-history --enable-help-builtin --enable-dparen-arithmetic \
	      --enable-directory-stack --enable-coprocesses --enable-cond-regexp \
	      --enable-cond-command --enable-command-timing --enable-casemod-expansions \
	      --enable-casemod-attributes --enable-brace-expansion --enable-bang-history \
	      --enable-array-variables --enable-arith-for-command --enable-alias \
     	      --enable-static-link 
  make
}


check() {
  make -C bash check
}

package() {
  make -C bash DESTDIR="$pkgdir" install
  ln -s bash "$pkgdir"/usr/bin/sh
  install -dm755 "$pkgdir"/etc/skel

  # system-wide configuration files
  install -m644 system.bashrc $pkgdir/etc/bash.bashrc
  install -m644 system.bash_logout "$pkgdir"/etc/bash.bash_logout

  # user configuration file skeletons
  install -m644 dot.bashrc "$pkgdir"/etc/skel/.bashrc
  install -m644 dot.bash_profile "$pkgdir"/etc/skel/.bash_profile
  install -m644 dot.bash_logout "$pkgdir"/etc/skel/.bash_logout
}
