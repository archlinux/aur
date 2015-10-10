# Maintainer: Carlos Pita <carlosjosepita@gmail.com>

pkgname=bash-devel-git
pkgdesc='The GNU Bourne Again shell (Development version)'
pkgver="4.`date +%G%m%d`"
pkgrel=1
url='http://savannah.gnu.org/git/?group=bash'
arch=('i686' 'x86_64')
license=('GPL')
backup=(etc/bash.bash{rc,_logout} etc/skel/.bash{rc,_profile,_logout})
depends=('readline>=7.0' 'glibc')
optdepends=('bash-completion: for tab completion')
provides=('sh' "bash=$pkgver")
conflicts=('bash')
install=bash.install
source=(dot.bashrc
        dot.bash_profile
        dot.bash_logout
        system.bashrc
        system.bash_logout)
md5sums=('027d6bd8f5f6a06b75bb7698cb478089'
         '2902e0fee7a9168f3a4fd2ccd60ff047'
         '42f4400ed2314bd7519c020d0187edc5'
         '561949793177116b7be29a07c385ba8b'
         '472f536d7c9e8250dc4568ec4cfaf294')

build() {
  cd "$srcdir"
  git clone --depth 1 --branch devel git://git.savannah.gnu.org/bash.git
  cd bash
  git checkout devel
  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/bash.bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash.bash_logout\"\')
  export CFLAGS="${CFLAGS} ${_bashconfig[@]}"
  ./configure --prefix=/usr --with-curses --enable-readline \
              --without-bash-malloc --with-installed-readline
  make
}

package() {
  pushd "$srcdir/bash"
  make DESTDIR="$pkgdir" install
  popd

  ln -s bash "$pkgdir"/usr/bin/sh

  # system-wide configuration files
  install -dm755 "$pkgdir"/etc/
  install -m644 system.bashrc $pkgdir/etc/bash.bashrc
  install -m644 system.bash_logout "$pkgdir"/etc/bash.bash_logout

  # user configuration file skeletons
  install -dm755 "$pkgdir"/etc/skel/
  install -m644 dot.bashrc "$pkgdir"/etc/skel/.bashrc
  install -m644 dot.bash_profile "$pkgdir"/etc/skel/.bash_profile
  install -m644 dot.bash_logout "$pkgdir"/etc/skel/.bash_logout
}
