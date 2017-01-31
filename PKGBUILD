# $Id: PKGBUILD 287440 2017-01-25 19:04:31Z bpiotrowski $
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=bash-nosh
_basever=4.4
_patchlevel=011
pkgver=${_basever}.${_patchlevel}
pkgrel=2
pkgdesc='The GNU Bourne Again shell'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.gnu.org/software/bash/bash.html'
groups=()
backup=(etc/bash.bash{rc,_logout} etc/skel/.bash{rc,_profile,_logout})
depends=('readline>=7.0' 'glibc' 'ncurses')
optdepends=('bash-completion: for tab completion')
provides=('bash')
conflicts=('bash')
source=(https://ftp.gnu.org/gnu/bash/bash-$_basever.tar.gz{,.sig}
        dot.bashrc
        dot.bash_profile
        dot.bash_logout
        system.bashrc
        system.bash_logout)
validpgpkeys=('7C0135FB088AAF6C66C650B9BB5869F064EA74AB') # Chet Ramey

if [[ $((10#${_patchlevel})) -gt 0 ]]; then
  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    source=(${source[@]} https://ftp.gnu.org/gnu/bash/bash-$_basever-patches/bash${_basever//.}-$(printf "%03d" $_p){,.sig})
  done
fi

prepare() {
  cd $pkgname-$_basever

  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    msg "applying patch bash${_basever//.}-$(printf "%03d" $_p)"
    patch -p0 -i ../bash${_basever//.}-$(printf "%03d" $_p)
  done
}

build() {
  cd $pkgname-$_basever

  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/bash.bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash.bash_logout\"\')
  export CFLAGS="${CFLAGS} ${_bashconfig[@]}"

  ./configure --prefix=/usr --with-curses --enable-readline \
    --without-bash-malloc --with-installed-readline
  make
}

check() {
  make -C $pkgname-$_basever check
}

package() {
  make -C $pkgname-$_basever DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir"/etc/skel/
  # system-wide configuration files
  install -m644 system.bashrc $pkgdir/etc/bash.bashrc
  install -m644 system.bash_logout "$pkgdir"/etc/bash.bash_logout

  # user configuration file skeletons
  install -m644 dot.bashrc "$pkgdir"/etc/skel/.bashrc
  install -m644 dot.bash_profile "$pkgdir"/etc/skel/.bash_profile
  install -m644 dot.bash_logout "$pkgdir"/etc/skel/.bash_logout
}

md5sums=('148888a7c95ac23705559b6f477dfe25'
         'SKIP'
         '027d6bd8f5f6a06b75bb7698cb478089'
         '2902e0fee7a9168f3a4fd2ccd60ff047'
         '42f4400ed2314bd7519c020d0187edc5'
         'd8f3f334e72c0e30032eae1a1229aef1'
         '472f536d7c9e8250dc4568ec4cfaf294'
         '817d01a6c0af6f79308a8b7b649e53d8'
         'SKIP'
         '765e14cff12c7284009772e8e24f2fe0'
         'SKIP'
         '49e7da93bf07f510a2eb6bb43ac3e5a2'
         'SKIP'
         '4557d674ab5831a5fa98052ab19edaf4'
         'SKIP'
         'cce96dd77cdd1d293beec10848f6cbb5'
         'SKIP'
         'd3379f8d8abce5c6ee338f931ad008d5'
         'SKIP'
         'ec38c76ca439ca7f9c178e9baede84fc'
         'SKIP'
         'e0ba18c1e3b94f905da9b5bf9d38b58b'
         'SKIP'
         'e952d4f44e612048930c559d90eb99bb'
         'SKIP'
         '57b5b35955d68f9a09dbef6b86d2c782'
         'SKIP'
         'cc896e1fa696b93ded568e557e2392d5'
         'SKIP')
